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
      floatingActionButton: MyActionButton(),

      ///floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(children: [
        Expanded(
            flex: 3,
            child: Container(
              color: Colors.red,
            )),
        Expanded(
            flex: 6,
            child: Container(
              color: Colors.cyanAccent[100],
            ))
      ]),
    );
  }
}
