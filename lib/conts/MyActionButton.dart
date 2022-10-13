import 'package:flutter/material.dart';

Widget MyActionButton() => FloatingActionButton(
      child: Icon(Icons.play_arrow_sharp),
      backgroundColor: Colors.lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: () {
        print("Presed");
      },
    );
