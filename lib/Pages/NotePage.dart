import 'package:flutter/material.dart';
import 'package:real_to_do_list/Const/routes.dart';
import 'package:real_to_do_list/main.dart';

import '../Const/Drawer/NavigationDrawer.dart';

import '../Const/Notes/TopCategory.dart';
import '../Const/Text/Text_In_NotePage.dart';
import '../Const/Text/Text_Subtitle.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:real_to_do_list/services/crud/notes_service.dart';
import 'package:real_to_do_list/Pages/notes_list_view.dart';
import 'package:real_to_do_list/services/auth/auth_service.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePage();
}

class _NotePage extends State<NotePage> {
  late final NotesService _notesService;
  String get userEmail => AuthService.firebase().currentUser!.email!;

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';

    @override
    void initState() {
      super.initState();
      Firebase.initializeApp().whenComplete(() { 
        print("completed");
        setState(() {});
      });
    }
    //primaryBackOptions();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(newNoteRoute);
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
      body:/* FutureBuilder( 
          future: _notesService.getOrCreateUser(email: userEmail),
          builder: (context, snapshot) {
            switch(snapshot.connectionState){
              case ConnectionState.done:
                return StreamBuilder(
                  stream: _notesService.allNotes,
                  builder: (context, snapshot) {
                    switch(snapshot.connectionState){
                      case ConnectionState.waiting:
                      case ConnectionState.active:
                        if (snapshot.hasData){
                          final allNotes = snapshot.data as List<DatabaseNote>;
                          return NotesListView(
                            notes: allNotes, 
                            onDeleteNote: (note) async {
                              await _notesService.deleteNote(id: note.id);
                            }
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      default:     
                        return const CircularProgressIndicator();
                    }
                  }
                );
              default:  
                return const CircularProgressIndicator();
            }
          }
        )*/
        SizedBox(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/svg/unlem.png"),
              //fit: BoxFit.cover,
              fit: BoxFit.contain,
            ),
          ),
          child: ListView(
            children: [
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
              ),
            ],
          ),
        ),
      ),
    );


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
