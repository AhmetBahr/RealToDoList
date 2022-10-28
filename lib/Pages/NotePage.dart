import 'package:flutter/material.dart';
import 'package:real_to_do_list/main.dart';

import '../Const/Drawer/NavigationDrawer.dart';

import '../Const/Notes/TopCategory.dart';
import '../Const/Text/Text_In_NotePage.dart';
import '../Const/Text/Text_Subtitle.dart';
import 'package:flutter/src/rendering/box.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                    title: Text("Create New Item"),
                    content: TextField(
                      decoration: InputDecoration(hintText: "Type here..."),
                    ));
              });
        },
      ),
      drawer: NavigationDrawerWidget(),
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/svg/undraw_Annotation_re_h774.png"),
              //fit: BoxFit.cover,
              fit: BoxFit.contain,
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
