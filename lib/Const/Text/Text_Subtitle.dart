import 'package:flutter/material.dart';

class TextSubtitle extends StatefulWidget {
  const TextSubtitle({super.key});

  @override
  State<TextSubtitle> createState() => _TextSubtitleState();
}

class _TextSubtitleState extends State<TextSubtitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "  To Do List",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 30,
        ),
      ),
      height: 20,
    );
  }
}
