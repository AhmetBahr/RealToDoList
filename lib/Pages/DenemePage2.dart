import 'package:flutter/material.dart';

import '../conts/MyActionButton.dart';
import '../conts/NavigationDrawer.dart';

class DenemePage2 extends StatefulWidget {
  const DenemePage2({super.key});

  @override
  State<DenemePage2> createState() => _DenemePage2();
}

class _DenemePage2 extends State<DenemePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(children: [
        Expanded(
            flex: 3,
            child: Container(
              color: Colors.red,
            )),
        Expanded(
            flex: 6,
            child: Container(
              color: Colors.green,
            ))
      ]),
    );
  }
}
