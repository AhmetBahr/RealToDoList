import 'package:flutter/material.dart';

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
            color: Colors.grey,
          ),
        ]),
        bottomNavigationBar: const BottomAppBar(
            child: TabBar(tabs: [
          Tab(
            text: "Page1",
          ),
          Tab(
            text: "Page2",
          ),
        ])),
      ),
    );
  }
}
