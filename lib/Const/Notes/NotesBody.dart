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
      height: 1000,
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
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
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.55),
              borderRadius: BorderRadius.circular(10),
            ),
            // ignore: prefer_const_constructors
            child: Text(
              '  Soğan',
              maxLines: 3,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            // ignore: prefer_const_constructors
            child: Text(
              '  Salatalık',
              maxLines: 3,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            // ignore: prefer_const_constructors
            child: Text(
              '  Domates',
              maxLines: 3,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
