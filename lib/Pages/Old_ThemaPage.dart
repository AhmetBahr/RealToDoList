import 'package:flutter/material.dart';

import '../Const/OldTheme/theme_Change.dart';
import '../main.dart';

class ThmemePage extends StatelessWidget {
  const ThmemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange.withOpacity(0.0),
          //  title: Text(MyApp.titlee),
          actions: []),
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Theme(),
          Row(
            children: [
              card2(),
              card3(),
              card4(),
              cardGreen(),
            ],
          ),
          Row(
            children: [
              card2(),
              card3(),
              card4(),
              cardGreen(),
            ],
          ),
          const Divider(height: 25),
          background(),
          Row(
            children: [
              BG1(),
              BG2(),
            ],
          ),
          Row(
            children: [
              BG3(),
              BG4(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget Theme() => Container(
      child: Text(
        " Theme",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
      ),
      height: 30,
    );

Widget background() => Container(
      child: Text(
        " Background",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
      ),
      height: 30,
    );

Widget card2() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.fromLTRB(15, 0, 5, 0),
      color: Colors.blue,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                margin: EdgeInsets.all(2),
                height: 75,
                width: 75,
              ),
            ],
          ),
        ],
      ),
    );
Widget card3() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsetsDirectional.all(5),
      color: Colors.red,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                margin: EdgeInsets.all(2),
                height: 75,
                width: 75,
              ),
            ],
          ),
        ],
      ),
    );
Widget card4() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsetsDirectional.all(5),
      color: Colors.yellow,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                margin: EdgeInsets.all(2),
                height: 75,
                width: 75,
              ),
            ],
          ),
        ],
      ),
    );
Widget cardGreen() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsetsDirectional.all(5),
      color: Colors.green,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                margin: EdgeInsets.all(2),
                height: 75,
                width: 75,
              ),
            ],
          ),
        ],
      ),
    );

Widget BG1() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.fromLTRB(15, 10, 5, 10),
      color: Colors.greenAccent,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                margin: EdgeInsets.all(2),
                height: 110,
                width: 175,
              ),
            ],
          ),
        ],
      ),
    );

Widget BG2() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.fromLTRB(15, 10, 5, 10),
      color: Colors.greenAccent,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                margin: EdgeInsets.all(2),
                height: 110,
                width: 175,
              ),
            ],
          ),
        ],
      ),
    );

Widget BG3() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.fromLTRB(15, 10, 5, 10),
      color: Colors.yellowAccent,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                margin: EdgeInsets.all(2),
                height: 110,
                width: 175,
              ),
            ],
          ),
        ],
      ),
    );
Widget BG4() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.fromLTRB(15, 10, 5, 10),
      color: Colors.yellowAccent,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                margin: EdgeInsets.all(2),
                height: 110,
                width: 175,
              ),
            ],
          ),
        ],
      ),
    );
