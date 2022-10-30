import "package:flutter/material.dart";

final String FlatString = "Note";

Widget MyMidActonButton() => FloatingActionButton.extended(
      // foregroundColor: Colors.black,
      // backgroundColor: Colors.lightBlue,
      icon: Icon(Icons.bubble_chart_outlined),
      label: Text(FlatString),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: () {
        print("Presed");
      },
    );
