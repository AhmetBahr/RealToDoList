import 'package:flutter/material.dart';

import '../Const/theme_Change.dart';
import '../main.dart';

class ThmemePage extends StatelessWidget {
  const ThmemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(MyApp.titlee),
          actions: [ChangeThemeButtonWidget()]),
      body: Center(
          child: Text(
        "hello $text",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      )),
    );
  }
}
