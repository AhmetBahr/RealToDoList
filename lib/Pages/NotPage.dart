import 'package:flutter/material.dart';

import '../Const/MidActionButton.dart';
import '../Const/MyActionButton.dart';
import '../Const/NavigationDrawer.dart';
import '../Const/TopCategory.dart';

class NotPage extends StatefulWidget {
  const NotPage({super.key});

  @override
  State<NotPage> createState() => _NotePage();
}

class _NotePage extends State<NotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      floatingActionButton: MyActionButton(),
      drawer: NavigationDrawerWidget(),
      body: Column(children: [
        Expanded(
            child: ListView(
          children: [
            TopCategory(),
            const Divider(),
            Container(
              child: Text(
                "Morning",
                style: TextStyle(fontSize: 50),
              ),
              height: 60,
            ),
            Container(
              child: Text(
                "To day I do",
                style: TextStyle(fontSize: 30),
              ),
              height: 60,
            ),
            const Divider(),
            Container(
              color: Colors.green,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.red,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blue,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.pink,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.green,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.red,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blue,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.pink,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ))
      ]),
    );
  }
}
