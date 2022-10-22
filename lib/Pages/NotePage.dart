import 'package:flutter/material.dart';
import 'package:real_to_do_list/main.dart';

import '../Const/MidActionButton.dart';
import '../Const/MyActionButton.dart';
import '../Const/NavigationDrawer.dart';
import '../Const/NotesBody.dart';
import '../Const/Text_In_NotePage.dart';
import '../Const/Text_Subtitle.dart';
import '../Const/TopCategory.dart';
import 'package:flutter/src/rendering/box.dart';

import '../Const/theme_Change.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePage();
}

class _NotePage extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';

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
              // ignore: prefer_const_constructors
              TopCategory(),
              const Divider(),
              TextInNotePage(),
              TextSubtitle(),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.4),
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
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,
              ),
              Container(
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
                    color: Colors.white,
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
