import 'package:flutter/material.dart';
import 'package:real_to_do_list/Const/routes.dart';
import 'package:real_to_do_list/services/crud/notes_service.dart';
import 'package:real_to_do_list/utilities/dialogs/delete_dialog.dart';
import 'package:real_to_do_list/Pages/new_note_view.dart';
import 'package:real_to_do_list/services/auth/auth_service.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

typedef DeleteNoteCallback = void Function(AnonDatabaseNote note);

class AnonNotesListView extends StatelessWidget {
  final List<AnonDatabaseNote> notes;
  final DeleteNoteCallback onDeleteNote;
  late final NotesService _notesService;

  AnonNotesListView({Key? key, required this.notes, required this.onDeleteNote})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    _notesService = NotesService();
    print(this.notes);
    print(this.notes.length);
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          if (note.text.indexOf("✔") == -1) {
            return ListTile(
              title: Text(
                note.text,
                maxLines: 1, 
                softWrap: true, 
                overflow: TextOverflow.ellipsis
              ),
              trailing: IconButton(
                  onPressed: () async {
                    await _notesService.createAnonNote();
                    await _notesService.updateAnonNote(
                        note: notes[notes.length - 1], text: "✔" + note.text);
                    onDeleteNote(note);
                  },
                  icon: const Icon(Icons.done)),
            );
          } else {
            return ListTile(
              title: Text(
                note.text,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(decoration: TextDecoration.lineThrough),
              ),
            );
          }
        });
  }
}
