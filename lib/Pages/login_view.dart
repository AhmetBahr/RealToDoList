import 'package:flutter/material.dart';
import 'package:real_to_do_list/Const/routes.dart';
import 'package:real_to_do_list/Pages/register_view.dart';
import 'package:real_to_do_list/services/auth/auth_exceptions.dart';
import 'package:real_to_do_list/services/auth/auth_service.dart';
import 'package:real_to_do_list/utilities/show_error_dialog.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() => print("INITIALIZED"));
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';

    return Scaffold(
      /* appBar: AppBar(
      title: const Text("Login"),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(notesRoute, (_) => false);
          }, 
          icon: Icon(Icons.arrow_back, size: 35.0)
        ),
      ]
    ),*/
      appBar: AppBar(
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(children: [
        const Divider(),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter email',
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: 'Enter password',
            ),
          ),
        ),
        Container(
          child: TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                await AuthService.firebase()
                    .logIn(email: email, password: password);
                final user = AuthService.firebase().currentUser;
                if (user?.isEmailVerified ?? false) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(notesRoute, (_) => false);
                } else {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(verifyEmailRoute, (_) => false);
                }
              } on UserNotFoundAuthException {
                await showErrorDialog(context, "User not found.");
              } on WrongPasswordAuthException {
                await showErrorDialog(context, "Wrong password.");
              } on InvalidEmailAuthException {
                await showErrorDialog(context, "Invalid email.");
              } on GenericAuthException {
                await showErrorDialog(context, "Authentication Error");
              }
            },
            child: const Text("Login"),
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RegisterView(),
              ));
            },
            child: const Text("Not registered yet"))
      ]),
    );
  }
}
