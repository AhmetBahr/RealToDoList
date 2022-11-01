import 'package:flutter/material.dart';
import 'package:real_to_do_list/services/crud/notes_service.dart';
import 'package:real_to_do_list/utilities/dialogs/delete_dialog.dart';
import 'package:real_to_do_list/Pages/new_note_view.dart';
import 'package:real_to_do_list/services/auth/auth_service.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

typedef DeleteNoteCallback = void Function(DatabaseNote note);

class CompletedNotesListView extends StatelessWidget{
  final List<DatabaseNote> notes;
  final List<DatabaseNote> completedNotes;
  final DeleteNoteCallback onDeleteNote;
  late final NotesService _notesService;

  CompletedNotesListView({Key? key, required this.notes, required this.completedNotes, required this.onDeleteNote}) : super(key: key);
  @override
  Widget build(BuildContext context){
    /*
    return StatefulWrapper(
    onInit: () {
    },
    child: Container()
  ); */
    _notesService = NotesService();

    return ListView.builder(
      //reverse: true,
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = completedNotes[index];
        thisTile: return ListTile(
          title: Text(
            note.text,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis
          ),
          trailing: IconButton(
            onPressed: () async {/*
              if(note.text.indexOf("✓") == -1){
                final currentUser = AuthService.firebase().currentUser!;
                final email = currentUser.email!;
                final owner = await _notesService.getUser(email: email); 
                await _notesService.createCompletedNote(owner: owner);
                await _notesService.updateCompletedNote(completedNote: completedNotes[completedNotes.length-1], text: "✓ " + note.text);
                onDeleteNote(note);*/
              },
            icon: const Icon(Icons.done)
          )
        );
      }
    );
  }
}
