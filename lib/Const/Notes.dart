import 'package:flutter/material.dart';

class MiniNotes extends StatefulWidget {
  const MiniNotes({super.key});

  @override
  State<MiniNotes> createState() => _MiniNotesState();
}

class _MiniNotesState extends State<MiniNotes> {
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
