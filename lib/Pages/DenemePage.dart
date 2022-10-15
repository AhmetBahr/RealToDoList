import 'package:flutter/material.dart';

import '../Const/MyActionButton.dart';
import '../Const/NavigationDrawer.dart';

class DenemePage extends StatefulWidget {
  const DenemePage({super.key});

  @override
  State<DenemePage> createState() => _DenemePage();
}

class _DenemePage extends State<DenemePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: MyActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: TabBarView(children: [
          Container(
            color: Colors.green,
          ),
        ]),
        drawer: NavigationDrawerWidget(),
      ),
    );
  }
}
