import 'package:flutter/material.dart';

import '../ActionButton/MidActionButton.dart';

class TopCategory extends StatefulWidget {
  const TopCategory({super.key});

  @override
  State<TopCategory> createState() => _TopCategoryState();
}

class _TopCategoryState extends State<TopCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        padding: EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              MyMidActonButton(),
              SizedBox(
                width: 10,
              ),
              MyMidActonButton(),
              SizedBox(
                width: 10,
              ),
              MyMidActonButton(),
              SizedBox(
                width: 10,
              ),
              MyMidActonButton(),
            ],
          ),
        ],
      ),
    );
  }
}

/*
 Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            // ignore: prefer_const_constructors
            child: Text(
              'Daily',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.7),
              borderRadius: BorderRadius.circular(100),
            ),
            // ignore: prefer_const_constructors
            child: Text(
              'Shop',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.7),
              borderRadius: BorderRadius.circular(100),
            ),
            // ignore: prefer_const_constructors
            child: Text(
              'school',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.pink.withOpacity(0.7),
              borderRadius: BorderRadius.circular(100),
            ),
            // ignore: prefer_const_constructors
            child: Text(
              'Patates',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
         
*/
