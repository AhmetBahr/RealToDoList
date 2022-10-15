import 'package:flutter/material.dart';

import '../Const/MyActionButton.dart';
import '../Const/NavigationDrawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: MyActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: TabBarView(children: [
          Container(
            color: Colors.red,
          ),
        ]),
        drawer: NavigationDrawerWidget(),
      ),
    );
  }
}
