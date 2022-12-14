import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_to_do_list/Pages/new_anonNote_view.dart';
import 'package:real_to_do_list/presentation/pr/Models/Styles/app_themes.dart';
import 'package:real_to_do_list/storage/service_locator.dart';
import 'package:real_to_do_list/storage/storage_service.dart';

import 'Const/BottomNavigation/BottomNavigationBottom.dart';

import 'package:real_to_do_list/services/auth/auth_service.dart';
import 'package:real_to_do_list/Pages/login_view.dart';
import 'package:real_to_do_list/Pages/register_view.dart';
import 'package:real_to_do_list/Pages/verify_email_view.dart';
import 'package:real_to_do_list/Const/routes.dart';

import 'Const/NewTheme/Theme_provider.dart';
import 'Const/OldTheme/thmema_provader.dart';
import 'Pages/NotePage.dart';
import 'Pages/AnonNotePage.dart';
import 'Pages/Theme_Settings_Page.dart';
import 'package:localstorage/localstorage.dart';

import 'package:real_to_do_list/Pages/new_note_view.dart';

import 'Pages/SettingsPages/share_button.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    setUpServiceLocator();

    final StorageService storageService = getIt<StorageService>();
    await storageService.init();

    runApp(MyApp(
      storageService: storageService,
    ));
  }, (e, _) => throw e);
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.storageService,
  }) : super(key: key);

  final StorageService storageService;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(storageService),
        ),
      ],
      child: Consumer<ThemeProvider>(
        child: FutureBuilder(
            future: AuthService.firebase().initialize(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  final user = AuthService.firebase().currentUser;
                  if (user != null) {
                    if (user.isAnonymous) {
                      return const AnonNotePage();
                    }
                    if (user.isEmailVerified) {
                      debugPrint("Email is verified");
                    } else {
                      return const VerifyEmailView();
                    }
                  } else {
                    return const LoginView();
                  }
                  return const NotePage();
                default:
                  return const CircularProgressIndicator();
              }
            }), //Main sayfaya burdan eri??iyoruz
        builder: (c, themeProvider, home) => MaterialApp(
          title: 'Flutter Theme And Primary Color Switcher',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.main(
            primaryColor: themeProvider.selectedPrimaryColor,
          ),
          darkTheme: AppThemes.main(
            isDark: true,
            primaryColor: themeProvider.selectedPrimaryColor,
          ),
          themeMode: themeProvider.selectedThemeMode,
          home: home,
          routes: {
            // themeaPagee: (context) => const ThmemePage(),
            notesRoute: (context) => const NotePage(),
            anonNotesRoute: (context) => const AnonNotePage(),
            loginRoute: (context) => const LoginView(),
            registerRoute: (context) => const RegisterView(),
            verifyEmailRoute: (context) => const VerifyEmailView(),
            newNoteRoute: (context) => const NewNoteView(),
            newAnonNoteRoute: (context) => const NewAnonNoteView(),
            shareRoute: (context) => const shareButton(),
            themeaPagee: (context) => const ThemePage()
          },
        ),
      ),
    );
  }
}


//??nceki Seferki Main

/*

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

*/
