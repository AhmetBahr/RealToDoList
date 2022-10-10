import 'package:flutter/material.dart';

import 'NavigationDrawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {}),
        appBar: AppBar(),
        body: TabBarView(children: [
          Container(
            color: Colors.red,
          ),
        ]),
        drawer: NavigationDrawerWidget(),
        bottomNavigationBar: const BottomAppBar(
            child: TabBar(tabs: [
          Tab(
            icon: Icon(
              Icons.list_alt,
              color: Colors.black,
            ),
            text: "Page1",
          ),
          Tab(
            icon: Icon(
              Icons.add_box,
              color: Colors.brown,
            ),
            text: "Page2",
          ),
        ])),
      ),
    );
  }
}
