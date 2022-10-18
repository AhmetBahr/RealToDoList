import 'package:flutter/material.dart';

class TextInNotePage extends StatefulWidget {
  const TextInNotePage({super.key});

  @override
  State<TextInNotePage> createState() => _TextInNotePageState();
}

class _TextInNotePageState extends State<TextInNotePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        " Morning",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 50,
        ),
      ),
      height: 60,
    );
  }
}
