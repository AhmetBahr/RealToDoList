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
        padding: EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(100)),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 150,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(100)),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 150,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(100)),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 150,
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(100)),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
