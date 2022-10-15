import 'package:flutter/material.dart';

import 'Const/BottomNavigation/BottomNavigationBottom.dart';
import 'Pages/NotPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get onSavedHaberr => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NotPage());
  }
}
