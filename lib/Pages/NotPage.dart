import 'package:flutter/material.dart';

import '../Const/MidActionButton.dart';
import '../Const/MyActionButton.dart';
import '../Const/NavigationDrawer.dart';
import '../Const/NotesBody.dart';
import '../Const/Text_In_NotePage.dart';
import '../Const/Text_Subtitle.dart';
import '../Const/TopCategory.dart';
import 'package:flutter/src/rendering/box.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePage();
}

class _NotePage extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyActionButton(),
      drawer: NavigationDrawerWidget(),
      body: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.pexels.com/photos/13866617/pexels-photo-13866617.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1  '),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              TopCategory(),
              const Divider(),
              TextInNotePage(),
              TextSubtitle(),
            ],
          ),
        ),
      ),
    );
  }
}
