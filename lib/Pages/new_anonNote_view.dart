import 'package:flutter/material.dart';
import 'package:real_to_do_list/services/crud/notes_service.dart';
import 'package:real_to_do_list/services/auth/auth_service.dart';
import 'package:real_to_do_list/services/auth/auth_user.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class NewAnonNoteView extends StatefulWidget{
  const NewAnonNoteView({ Key? key }) : super(key: key);

  @override
  _NewAnonNoteViewState createState() => _NewAnonNoteViewState();
}

class _NewAnonNoteViewState extends State<NewAnonNoteView>{
  AnonDatabaseNote? _note;
  late final NotesService _notesService;
  late final TextEditingController _textController;
  
  void _textControllerListener() async {
    final note = _note;
    if (note == null)
      return;

    final text = _textController.text;
    await _notesService.updateAnonNote(note: note, text: text);
  }

  void _setupTextConrollerListener() {
    _textController.removeListener(_textControllerListener);
    _textController.addListener(_textControllerListener);
  }

  Future<AnonDatabaseNote> createNewNote() async {
    final existingNote = _note;
    if(existingNote != null){
      return existingNote;
    }
    return await _notesService.createAnonNote();
  }

  void _deleteNoteIfTextIsEmpty() {
    final note = _note;
    if(_textController.text.isEmpty && note != null){
      _notesService.deleteAnonNote(id: note.id);
    }
  }

  void _saveNoteIfTextIsNotEmpty() async {
    final note = _note;
    final text = _textController.text;
    if(note != null && text.isNotEmpty) {
      await _notesService.updateAnonNote(note: note, text: text);
    }
  }

  @override
  void dispose() {
    _deleteNoteIfTextIsEmpty();
    _saveNoteIfTextIsNotEmpty();
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _notesService = NotesService();
    _textController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    print("ANON NEW NOTE");
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: FutureBuilder<AnonDatabaseNote>(
        future: createNewNote(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              _note = snapshot.data as AnonDatabaseNote?;
              _setupTextConrollerListener();
              return TextField(
                controller: _textController,
                keyboardType: TextInputType.multiline,
                maxLines: null, //Expands as you type
                decoration: const InputDecoration(
                  hintText: "Type your note here...",
                ),
              );
            default: 
              return const CircularProgressIndicator();
          } 
        }
      ) 
    ); //Scaffold
  }
}
