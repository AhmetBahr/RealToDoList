import 'package:flutter/material.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({super.key});

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView(
        children: [
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
      ),
    );
  }
}
