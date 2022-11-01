import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;
import "package:real_to_do_list/services/crud/crud_exceptions.dart";
import "dart:async";

class NotesService{
  Database? _db;

  List<DatabaseNote> _notes = [];
  List<DatabaseNote> _completedNotes = [];

  //singleton
  static final NotesService _shared = NotesService._sharedInstance();
  NotesService._sharedInstance(){
    _notesStreamController = StreamController<List<DatabaseNote>>.broadcast( //broadcast lets you listen to it again
      onListen: () {
        _notesStreamController.sink.add(_notes);

      }
    );
    _completedNotesStreamController = StreamController<List<DatabaseNote>>.broadcast( //broadcast lets you listen to it again
      onListen: () {
        _completedNotesStreamController.sink.add(_completedNotes);

      }
    );
  }
  factory NotesService() => _shared;

  late final StreamController<List<DatabaseNote>> _notesStreamController;
  late final StreamController<List<DatabaseNote>> _completedNotesStreamController;

  Stream<List<DatabaseNote>> get allNotes => _notesStreamController.stream; //Getter for getting all the notes
  Stream<List<DatabaseNote>> get allCompletedNotes => _completedNotesStreamController.stream; //Getter for getting all the notes
  
  Future<DatabaseUser> getOrCreateUser({required String email}) async {
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
  
  Future<void> _cacheNotes() async {
    await _ensureDbIsOpen();
    final allNotes = await getAllNotes();
    _notes = allNotes.toList();
    _notesStreamController.add(_notes);
  }

  Future<void> _cacheCompletedNotes() async {
    await _ensureDbIsOpen();
    final allCompletedNotes = await getAllCompletedNotes();
    _completedNotes = allCompletedNotes.toList();
    _completedNotesStreamController.add(_completedNotes);
  }

  Future <DatabaseNote> updateNote({required DatabaseNote note, required String text}) async {
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
      _notes.add(updatedNote);
      _notesStreamController.add(_notes);
      return updatedNote;
    }
  }

  Future <DatabaseNote> updateCompletedNote({required DatabaseNote completedNote, required String text}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    
    //make sure note exists
    await getCompletedNote(id: completedNote.id);
    
    //update db
    final updatesCount = await db.update(completedNoteTable, {
      textColumn: text, 
      isSyncedWithCloudColumn: 0,
    }, where: "id = ?", whereArgs: [completedNote.id]);
    
    if(updatesCount == 0)
      throw CouldNotUpdateNotesException();
    else{
      final updatedNote = await getCompletedNote(id: completedNote.id);
      _completedNotes.removeWhere((completedNote) => completedNote.id == updatedNote.id);
      _completedNotes.add(updatedNote);
      _completedNotesStreamController.add(_completedNotes);
      return updatedNote;
    }
  }

  Future <Iterable<DatabaseNote>> getAllNotes() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final notes = await db.query(noteTable);
    return notes.map((noteRow) => DatabaseNote.fromRow(noteRow));
  }

  Future <Iterable<DatabaseNote>> getAllCompletedNotes() async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final completedNotes = await db.query(completedNoteTable);
    return completedNotes.map((completedNoteRow) => DatabaseNote.fromRow(completedNoteRow));
  }

  Future <DatabaseNote> getNote({required int id}) async {
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

  Future <DatabaseNote> getCompletedNote({required int id}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final notes = await db.query(completedNoteTable, limit: 1, where: "id = ?", whereArgs: [id]);
    if(notes.isEmpty){
      throw CouldNotFindNoteException();
    }
    else{
      final note = DatabaseNote.fromRow(notes.first);
      _notes.removeWhere((note) => note.id == id);
      _notes.add(note);
      _completedNotesStreamController.add(_notes);
      return note;
    }
  }

  Future <int> deleteAllNotes() async{
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final numberOfDeletions = await db.delete(noteTable);
    _notes = [];
    _notesStreamController.add(_notes);
    return numberOfDeletions;
  }

  Future <int> deleteAllCompletedNotes() async{
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final numberOfDeletions = await db.delete(completedNoteTable);
    _completedNotes = [];
    _completedNotesStreamController.add(_completedNotes);
    return numberOfDeletions;
  }

  Future <void> deleteNote({required int id}) async {
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

  Future <DatabaseNote> createNote({required DatabaseUser owner}) async {
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

      _notes.add(note);
      _notesStreamController.add(_notes);
      
      return note;
    }
  }

  Future <DatabaseNote> createCompletedNote({required DatabaseUser owner}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    //make sure owner exists in the db with correct id
    final dbUser = await getUser(email: owner.email);
    if(dbUser != owner)
      throw CouldNotFindUserException();
    else{
      const text = "";
      //create the note
      final noteId = await db.insert(completedNoteTable, {
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

      _completedNotes.add(note);
      _completedNotesStreamController.add(_completedNotes);
      
      return note;
    }
  }
  Future <DatabaseUser> getUser({required String email}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(userTable, limit: 1, where: "email = ?", whereArgs: [email.toLowerCase()]);
    if (results.isEmpty)
      throw CouldNotFindUserException();
    else{
      return DatabaseUser.fromRow(results.first);
    }

  }

  Future <DatabaseUser> createUser({required String email}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final results = await db.query(userTable, limit: 1, where: "email = ?", whereArgs: [email.toLowerCase()]);
    if (results.isNotEmpty)
      throw UserAlreadyExistsException();

    final userId = await db.insert(userTable, {emailColumn: email.toLowerCase()});
    return DatabaseUser(id: userId, email: email);
  }

  Future<void> deleteUser({required String email}) async {
    await _ensureDbIsOpen();
    final db = _getDatabaseOrThrow();
    final deletedCount = await db.delete(userTable, where: "email = ?", whereArgs: [email.toLowerCase()]);
    if(deletedCount != 1)
      throw CouldNotDeleteUserException();

  }

  Database _getDatabaseOrThrow(){
    final db = _db;
    if(db == null)
      throw DatabaseIsNotOpenException();
    else
      return db;
  }

  Future<void> _ensureDbIsOpen() async {
    try{
      await open();
    } on DatabaseAlreadyOpenException{
      
    };
  }

  Future<void> open() async{
    if(_db != null) 
      throw DatabaseAlreadyOpenException();

    try{
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;

      await db.execute(createUserTable);
      await db.execute(createNotesTable);
      await db.execute(createCompletedNotesTable);

      await _cacheNotes();
      await _cacheCompletedNotes();
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectoryException();
    }
  }

  Future<void> close() async{
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
  final int id;
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

const dbName = "notes.db";
const noteTable = "note";
const userTable = "user";
const completedNoteTable = "completed";
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

const createCompletedNotesTable = '''
CREATE TABLE IF NOT EXISTS "completed" (
  "id"  INTEGER NOT NULL,
  "user_id" INTEGER NOT NULL,
  "text"  TEXT,
  "is_synced_with_cloud"  INTEGER NOT NULL DEFAULT 0,
  FOREIGN KEY("user_id") REFERENCES "user"("id"),
  PRIMARY KEY("id" AUTOINCREMENT)
);
''';
