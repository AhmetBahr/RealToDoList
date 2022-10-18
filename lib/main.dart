import 'package:flutter/material.dart';

import 'Const/BottomNavigation/BottomNavigationBottom.dart';

import 'package:real_to_do_list/services/auth/auth_service.dart';
import 'package:real_to_do_list/Pages/login_view.dart';
import 'package:real_to_do_list/Pages/register_view.dart';
import 'package:real_to_do_list/Pages/verify_email_view.dart';
import 'package:real_to_do_list/Const/routes.dart';

import 'Pages/NotePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: "ToDo",
      home: const NotePage(),
      routes: {
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        notesRoute: (context) => const NotePage(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get onSavedHaberr => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NotePage());
  }
}
