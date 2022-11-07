import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_to_do_list/Const/routes.dart';
import 'package:real_to_do_list/main.dart';
import 'package:real_to_do_list/storage/storage_service.dart';

import '../Const/Drawer/NavigationDrawer.dart';

import '../Const/Notes/TopCategory.dart';
import '../Const/Text/Text_In_NotePage.dart';
import '../Const/Text/Text_Subtitle.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:real_to_do_list/services/crud/notes_service.dart';
import 'package:real_to_do_list/Pages/notes_list_view.dart';
import 'package:real_to_do_list/Pages/anonNotes_list_view.dart';
import 'package:real_to_do_list/services/auth/auth_service.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:localstorage/localstorage.dart';
import 'package:real_to_do_list/main.dart';
import '../../storage/storage_service.dart';

import 'package:real_to_do_list/storage/service_locator.dart';

class AnonNotePage extends StatefulWidget {
  const AnonNotePage({super.key});

  @override
  State<AnonNotePage> createState() => _AnonNotePage();
}

class _AnonNotePage extends State<AnonNotePage> {
  final StorageService storageService = getIt<StorageService>();
  late final NotesService _noteService;
  late String bg = storageService.get("bg");

  //String get userEmail => AuthService.firebase().currentUser!.email!;
  var i = 0;
  @override
  void initState() {
    _noteService = NotesService();
    _noteService.open();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
    super.initState();
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    rebuildAllChildren(context);

    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';

    //primaryBackOptions();
    //Ertesi gün notları silme
    DateTime date = DateTime.now();

    //print("ANON NOTE PAGE");
    if (storageService.get("today") != DateFormat('EEEE').format(date)) {
      storageService.set("today", DateFormat('EEEE').format(date));
      _noteService.deleteAllNotes();
      _noteService.deleteAllAnonNotes();
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(newAnonNoteRoute);
            /*
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text("Create New Item"),
                content: TextField(
                  decoration: InputDecoration(hintText: "Type here..."),
                )
              );
          });
          */
          },
        ),
        drawer: NavigationDrawerWidget(),
        body: ListView(
          children: [
            TopCategory(),
            Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bg),
                    fit: BoxFit.contain,
                  ),
                ),
                child: FutureBuilder(
                    future: _noteService.getOrCreateAnonUser(),
                    builder: (context, snapshot) {
                      //print("BUILD!!!");
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          return StreamBuilder(
                              stream: _noteService.allAnonNotes,
                              builder: (context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                  case ConnectionState.active:
                                    if (snapshot.hasData) {
                                      final allAnonNotes = snapshot.data
                                          as List<AnonDatabaseNote>;
                                      return AnonNotesListView(
                                          notes: allAnonNotes,
                                          onDeleteNote: (note) async {
                                            await _noteService.deleteAnonNote(
                                                id: note.id);
                                          });
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  default:
                                    return const CircularProgressIndicator();
                                }
                              });
                        default:
                          return const CircularProgressIndicator();
                      }
                    })),
          ],
          /*    //ESKI SizedBox içi
              // ignore: prefer_const_constructors
              TopCategory(),
              const Divider(
                color: Colors.black,
              ),
              TextInNotePage(),
              TextSubtitle(),
              const Divider(
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.all(5),
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                // ignore: prefer_const_constructors
                child: Text(
                  '  Patates',
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),*/
        ));
  }
}


/* 
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.pexels.com/photos/13866617/pexels-photo-13866617.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1  '),
              fit: BoxFit.cover,
            ),
          ),
          */
