import 'package:flutter/widgets.dart';
import 'package:real_to_do_list/services/auth/auth_provider.dart';
import 'package:real_to_do_list/services/auth/auth_user.dart';
import 'package:real_to_do_list/services/auth/auth_service.dart';
import 'package:real_to_do_list/services/auth/firebase_auth_porivder.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;
import "package:real_to_do_list/services/crud/crud_exceptions.dart";
import "dart:async";
import 'package:firebase_auth/firebase_auth.dart';

class NotesService{
  Database? _db;

  List<DatabaseNote> _notes = [];
  List<AnonDatabaseNote> _anonNotes = [];

  //singleton
  static final NotesService _shared = NotesService._sharedInstance();
  NotesService._sharedInstance(){
    _notesStreamController = StreamController<List<DatabaseNote>>.broadcast( //broadcast lets you listen to it again
      onListen: () {
        _notesStreamController.sink.add(_notes);
      }
    );
    _anonNotesStreamController = StreamController<List<AnonDatabaseNote>>.broadcast( //broadcast lets you listen to it again
      onListen: () {
        _anonNotesStreamController.sink.add(_anonNotes);
      }
    );
  }
  factory NotesService() => _shared;

  late final StreamController<List<DatabaseNote>> _notesStreamController;
  late final StreamController<List<AnonDatabaseNote>> _anonNotesStreamController;

  Stream<List<DatabaseNote>> get allNotes => _notesStreamController.stream; //Getter for getting all the notes
  Stream<List<AnonDatabaseNote>> get allAnonNotes => _anonNotesStreamController.stream; //Getter for getting all the notes
  
  Future<DatabaseUser> getOrCreateUser({required String email}) async {
    print("GET OR CREATE NORMAL USER");
    try{
      final user = await getUser(email: email);
      return user;
    }on CouldNotFindUserException{
      final createdUser = await createUser(email: email);
      return createdUser;
    } catch (e) {
      rethrow;
    }
  }
 
  Future<AuthUser?> getOrCreateAnonUser() async {
    print("GET OR CREATE ANON USER");
    try{
      final user = await getAnonUser();
      return user;
    }on CouldNotFindUserException{
      final createdUser = await createAnonUser();
      return createdUser;
    } catch (e) {
      rethrow;
    }
  }
  
  Future<void> _cacheNotes() async {
    print("CACHE NORMAL NOTES");
    await _ensureDbIsOpen();
    final allNotes = await getAllNotes();
    _notes = allNotes.toList();
    _notesStreamController.add(_notes);
  }

  Future<void> _cacheAnonNotes() async {
    print("CACHE ANON NOTES");
    await _ensureDbIsOpen();
    final allAnonNotes = await getAllAnonNotes();
    _anonNotes = allAnonNotes.toList();
    _anonNotesStreamController.add(_anonNotes);
  }

  Future <DatabaseNote> updateNote({required DatabaseNote note, required String text}) async {
    print("UPDATE NORMAL NOTE");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    
    //make sure note exists
    await getNote(id: note.id);
    
    //update db
    final updatesCount = await db.update(noteTable, {
      textColumn: text, 
      isSyncedWithCloudColumn: 0,
    }, where: "id = ?", whereArgs: [note.id]);

    if(updatesCount == 0)
      throw CouldNotUpdateNotesException();
    else{
      final updatedNote = await getNote(id: note.id);
      _notes.removeWhere((note) => note.id == updatedNote.id);
      if(updatedNote.text.indexOf("✔") != -1){
        print("This note goes to the depths below!");
        _notes.add(updatedNote);
      }
      else if(updatedNote.text.indexOf("★") != -1){
        print("This goes to the ABSOLUTE top!");
        _notes.insert(0, updatedNote);
      }
      else{
        print("This goes to the top!");
        int lastStarredNote = 0;
        for (int i = 0; i<_notes.length; i++){
          if(_notes[i].text.indexOf("★") != -1)
            lastStarredNote++;
        }
        _notes.insert(lastStarredNote, updatedNote);
      }
      _notesStreamController.add(_notes);
      return updatedNote;
    }
  }

  Future <AnonDatabaseNote> updateAnonNote({required AnonDatabaseNote note, required String text}) async {
    print("UPDATE ANON NOTE");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    
    //make sure note exists
    await getAnonNote(id: note.id);
    
    //update db
    final updatesCount = await db.update(anonNoteTable, {
      textColumn: text, 
    }, where: "id = ?", whereArgs: [note.id]);
    
    if(updatesCount == 0)
      throw CouldNotUpdateNotesException();
    else{
      final updatedAnonNote = await getAnonNote(id: note.id);
      _anonNotes.removeWhere((note) => note.id == updatedAnonNote.id);
      if(updatedAnonNote.text.indexOf("✔") != -1){
        print("This note goes to the depths below!");
        _anonNotes.add(updatedAnonNote);
      }
      else if(updatedAnonNote.text.indexOf("★") != -1){
        print("This goes to the ABSOLUTE top!");
        _anonNotes.insert(0, updatedAnonNote);
      }
      else{
        print("This goes to the top!");
        int lastStarredNote = 0;
        for (int i = 0; i<_anonNotes.length; i++){
          if(_anonNotes[i].text.indexOf("★") != -1)
            lastStarredNote++;
        }
        _anonNotes.insert(lastStarredNote, updatedAnonNote);
      }
      _anonNotesStreamController.add(_anonNotes);
      return updatedAnonNote;
    }
  }


  Future <Iterable<DatabaseNote>> getAllNotes() async {
    print("GET ALL NORMAL NOTES");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final notes = await db.query(noteTable);
    return notes.map((noteRow) => DatabaseNote.fromRow(noteRow));
  }

  Future <Iterable<AnonDatabaseNote>> getAllAnonNotes() async {
    print("GET ALL ANON NOTES");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final notes = await db.query(anonNoteTable);
    return notes.map((anonNoteRow) => AnonDatabaseNote.fromRow(anonNoteRow));
  }

  Future <DatabaseNote> getNote({required int id}) async {
    print("GET NORMAL NOTE");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final notes = await db.query(noteTable, limit: 1, where: "id = ?", whereArgs: [id]);
    if(notes.isEmpty){
      throw CouldNotFindNoteException();
    }
    else{
      final note = DatabaseNote.fromRow(notes.first);
      _notes.removeWhere((note) => note.id == id);
      _notes.add(note);
      _notesStreamController.add(_notes);
      return note;
    }
  }

  Future <AnonDatabaseNote> getAnonNote({required int id}) async {
    print("GET ANON NOTE");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final notes = await db.query(anonNoteTable, limit: 1, where: "id = ?", whereArgs: [id]);
    if(notes.isEmpty){
      throw CouldNotFindNoteException();
    }
    else{
      final note = AnonDatabaseNote.fromRow(notes.first);
      _anonNotes.removeWhere((note) => note.id == id);
      _anonNotes.add(note);
      _anonNotesStreamController.add(_anonNotes);
      print(note.text);
      return note;
    }
  }
  
  Future <int> deleteAllNotes() async{
    print("DELETE ALL NORMAL NOTES");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final numberOfDeletions = await db.delete(noteTable);
    _notes = [];
    _notesStreamController.add(_notes);
    return numberOfDeletions;
  }

  Future <int> deleteAllAnonNotes() async{
    print("DELETE ALL ANON NOTES");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final numberOfDeletions = await db.delete(anonNoteTable);
    _anonNotes = [];
    _anonNotesStreamController.add(_anonNotes);
    return numberOfDeletions;
  }

  Future <void> deleteNote({required int id}) async {
    print("DELETE NORMAL NOTE");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(noteTable, where: "id = ?", whereArgs: [id]);
    if(deletedCount != 1)
      throw CouldNotDeleteNoteException();
    else {
      _notes.removeWhere((note) => note.id == id);
      _notesStreamController.add(_notes);
    }
  }

  Future <void> deleteAnonNote({required int id}) async {
    print("DELETE ANON NOTE");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(anonNoteTable, where: "id = ?", whereArgs: [id]);
    if(deletedCount != 1)
      throw CouldNotDeleteNoteException();
    else {
      _anonNotes.removeWhere((note) => note.id == id);
      _anonNotesStreamController.add(_anonNotes);
    }
  }

  Future <DatabaseNote> createNote({required DatabaseUser owner}) async {
    print("CREATE NORMAL NOTE");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    //make sure owner exists in the db with correct id
    final dbUser = await getUser(email: owner.email);
    if(dbUser != owner)
      throw CouldNotFindUserException();
    else{
      const text = "";
      //create the note
      final noteId = await db.insert(noteTable, {
        userIdColumn: owner.id,
        textColumn: text,
        isSyncedWithCloudColumn: 1,
      });

      final note = DatabaseNote(
        id: noteId,
        userId: owner.id,
        text: text,
        isSyncedWithCloud: true,
      );

      _notesStreamController.add(_notes);
      
      return note;
    }
  }

  Future <AnonDatabaseNote> createAnonNote() async {
    print("CREATE ANON NOTE");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    //make sure owner exists in the db with correct id
    const text = "";
    //create the note
    final noteId = await db.insert(anonNoteTable, {
      textColumn: text,
    });

    final note = AnonDatabaseNote(
      id: noteId,
      text: text,
    );

    _anonNotes.add(note);
    _anonNotesStreamController.add(_anonNotes);
  
    return note;
  }

  Future <DatabaseUser> getUser({required String email}) async {
    print("GET NORMAL USER");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(userTable, limit: 1, where: "email = ?", whereArgs: [email.toLowerCase()]);
    if (results.isEmpty)
      throw CouldNotFindUserException();
    else{
      return DatabaseUser.fromRow(results.first);
    }
  }

  Future <AuthUser?> getAnonUser() async {
    await _ensureDbIsOpen();
    print("GOT USER");
    return AuthService.firebase().currentUser;
  }

  Future <AuthUser?> createAnonUser() async {
    await _ensureDbIsOpen();
    await FirebaseAuth.instance.signInAnonymously();
    print("CREATED USER");
    return AuthService.firebase().currentUser;
  }

  Future <DatabaseUser> createUser({required String email}) async {
    print("CREATE NORMAL USER");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(userTable, limit: 1, where: "email = ?", whereArgs: [email.toLowerCase()]);
    if (results.isNotEmpty)
      throw UserAlreadyExistsException();

    final userId = await db.insert(userTable, {emailColumn: email.toLowerCase()});
    return DatabaseUser(id: userId, email: email);
  }

  Future<void> deleteUser({required String email}) async {
    print("DELETE USER");
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(userTable, where: "email = ?", whereArgs: [email.toLowerCase()]);
    if(deletedCount != 1)
      throw CouldNotDeleteUserException();

  }

  Database _getDatabaseOrThrow(){
    print("GET DATABASE OR THROW");
    final db = _db;
    if(db == null)
      throw DatabaseIsNotOpenException();
    else
      return db;
  }

  Future<void> _ensureDbIsOpen() async {
    print("ENSURE DB IS OPEN");
    try{
      await open();
    } on DatabaseAlreadyOpenException{
      
    };
  }

  Future<void> open() async{
  print("OPEN");
    if(_db != null) 
      throw DatabaseAlreadyOpenException();

    try{
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;

      await db.execute(createUserTable);
      await db.execute(createNotesTable);
      await db.execute(createAnonNotesTable);

      await _cacheNotes();
      await _cacheAnonNotes();
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectoryException();
    }
  }

  Future<void> close() async{
    print("CLOSE");
    final db = _db;
    if (db==null)
      throw DatabaseIsNotOpenException();
    else{
      await db.close();
      _db = null;
    }
  }
}

@immutable
class DatabaseUser{
  final int id;
  final String email;

  const DatabaseUser({
    required this.id, 
    required this.email
  });

  DatabaseUser.fromRow(Map<String, Object?> map): 
    id = map[idColumn] as int, 
    email = map[emailColumn] as String;

  @override 
  String toString() => "Person, ID = $id, email = $email";

  @override 
  bool operator == (covariant DatabaseUser other) => id == other.id; //covariant allows you to chane parameter type while overriding
  
  @override
  int get hashCode => id.hashCode;
}

class DatabaseNote{
  int id;
  final int userId;
  final String text;
  final bool isSyncedWithCloud;

  DatabaseNote({
    required this.id,
    required this.userId, 
    required this.text, 
    required this.isSyncedWithCloud,
  });

  DatabaseNote.fromRow(Map<String, Object?> map):
    id = map[idColumn] as int,
    userId = map[userIdColumn] as int,
    text = map[textColumn] as String,
    isSyncedWithCloud = (map[isSyncedWithCloudColumn] as int) == 1 ? true : false;

  @override
  String toString() => "Note, ID = $id, userId = $userId, isSyncedWithCloud = $isSyncedWithCloud text = $text";
 
  @override 
  bool operator == (covariant DatabaseUser other) => id == other.id;
  
  @override
  int get hashCode => id.hashCode;
}

class AnonDatabaseNote{
  final int id;
  final String text;

  AnonDatabaseNote({
    required this.id,
    required this.text, 
  });

  AnonDatabaseNote.fromRow(Map<String, Object?> map):
    id = map[idColumn] as int,
    text = map[textColumn] as String;

  @override
  String toString() => "Note, ID = $id, text = $text";
}

const dbName = "notes.db";
const noteTable = "note";
const anonNoteTable = "anonNote";
const userTable = "user";
const idColumn = "id";
const emailColumn = "email";
const userIdColumn = "user_id";
const textColumn = "text";
const isSyncedWithCloudColumn = "is_synced_with_cloud";
//You can write other languages inside triple '''
const createUserTable = '''
  CREATE TABLE IF NOT EXISTS "user" (
    "id" INTEGER NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id" AUTOINCREMENT)
  );
''';

const createNotesTable = '''
CREATE TABLE IF NOT EXISTS "note" (
  "id"  INTEGER NOT NULL,
  "user_id" INTEGER NOT NULL,
  "text"  TEXT,
  "is_synced_with_cloud"  INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY("user_id") REFERENCES "user"("id"),
  PRIMARY KEY("id" AUTOINCREMENT)
);
''';

const createAnonNotesTable = '''
CREATE TABLE IF NOT EXISTS "anonNote" (
  "id"  INTEGER NOT NULL,
  "text"  TEXT,
  PRIMARY KEY("id" AUTOINCREMENT)
);
''';
