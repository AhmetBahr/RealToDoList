import 'package:flutter/material.dart';

import '../Pages/DenemePage.dart';
import '../Pages/NotPage.dart';
import '../Pages/MainPages.dart';

class MyBottomBar extends StatefulWidget {
  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int index = 0;
  final List<Widget> child = [
    //Buraya sayfalar gelicek
    MainPage(),
    DenemePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child[index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: getonTappedBar,
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.favorite),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.people),
              label: "",
            )
          ]),
    );
  }

  void getonTappedBar(int value) {
    setState(() {
      index = value;
    });
  }
}
