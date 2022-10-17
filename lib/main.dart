import 'package:flutter/material.dart';

import 'Const/BottomNavigation/BottomNavigationBottom.dart';
import 'Pages/NotPage.dart';
import 'package:real_to_do_list/services/auth/auth_service.dart';
import 'package:real_to_do_list/Pages/login_view.dart';
import 'package:real_to_do_list/Const/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(  
      title: "ToDo",
      home: const NotPage(),
      routes: {
        loginRoute: (context) => const LoginView(),
      }
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get onSavedHaberr => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NotPage());
  }
}
