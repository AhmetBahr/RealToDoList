import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_to_do_list/Const/thmema_provader.dart';

import 'Const/BottomNavigation/BottomNavigationBottom.dart';

import 'package:real_to_do_list/services/auth/auth_service.dart';
import 'package:real_to_do_list/Pages/login_view.dart';
import 'package:real_to_do_list/Pages/register_view.dart';
import 'package:real_to_do_list/Pages/verify_email_view.dart';
import 'package:real_to_do_list/Const/routes.dart';

import 'Pages/NotePage.dart';
import 'Pages/ThemaPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String titlee = 'Light & Dark Theme';

  get onSavedHaberr => null;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            title: titlee,
            themeMode: themeProvider.themeMode,
            theme: Mythemes.lightTheme,
            darkTheme: Mythemes.darkTheme,
            routes: {
              loginRoute: (context) => const LoginView(),
              registerRoute: (context) => const RegisterView(),
              verifyEmailRoute: (context) => const VerifyEmailView(),
              notesRoute: (context) => const NotePage(),
            },
            home: NotePage(),
          );
        },
      );
}
