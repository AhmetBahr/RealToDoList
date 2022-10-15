import 'package:flutter/material.dart';

import '../Const/MidActionButton.dart';
import '../Const/MyActionButton.dart';
import '../Const/NavigationDrawer.dart';

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
      body: Column(children: [
        Expanded(
            child: ListView(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    color: Colors.redAccent,
                    width: 150,
                  ),
                  Container(
                    color: Colors.blueAccent,
                    width: 150,
                  ),
                  Container(
                    color: Colors.green,
                    width: 150,
                  ),
                  Container(
                    color: Colors.purple,
                    width: 150,
                  ),
                ],
              ),
            ),
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
/*             Container(
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
            ),*/
          ],
        ))
      ]),
    );
  }
}
