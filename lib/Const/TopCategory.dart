import 'package:flutter/material.dart';

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
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            color: Colors.redAccent,
            width: 150,
          ),
          Container(
            color: Colors.blueAccent,
            width: 150,
          ),
          Container(
            color: Colors.green,
            width: 150,
          ),
          Container(
            color: Colors.amberAccent,
            width: 150,
          ),
        ],
      ),
    );
  }
}
