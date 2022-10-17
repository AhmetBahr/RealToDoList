import 'package:flutter/material.dart';

import '../Const/MidActionButton.dart';
import '../Const/MyActionButton.dart';
import '../Const/NavigationDrawer.dart';
import '../Const/TopCategory.dart';

class NotPage extends StatefulWidget {
  const NotPage({super.key});

  @override
  State<NotPage> createState() => _NotePage();
}

class _NotePage extends State<NotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyActionButton(),
      drawer: NavigationDrawerWidget(),
      body: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1541472555878-357a209eb293?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1885&q=80'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              TopCategory(),
              const Divider(),
              Container(
                child: Text(
                  "Morning",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
                height: 60,
              ),
              Container(
                child: Text(
                  "To Do List",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                height: 60,
              ),
              const Divider(),
              Container(
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(100)),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




/*          Container(
              child: Text(
                "To day I do",
                style: TextStyle(fontSize: 30),
              ),
              height: 60,
            ),
            const Divider(),
            Container(
              color: Colors.green,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.red,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blue,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.pink,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.green,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.red,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blue,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.pink,
              height: 80,
            ),
            SizedBox(
              height: 10,
            ), */
