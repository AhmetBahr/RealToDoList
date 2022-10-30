import 'package:flutter/material.dart';
import 'package:real_to_do_list/Const/routes.dart';
import 'package:real_to_do_list/services/auth/auth_exceptions.dart';
import 'package:real_to_do_list/services/auth/auth_service.dart';
import 'package:real_to_do_list/utilities/show_error_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() => print("INITIALIZEDD"));
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
        /*    appBar: AppBar(
        title: const Text("Register"),
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
          //  shape:
          //      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            ' Register Now',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.all(10),
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
            margin: EdgeInsets.all(10),
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
          TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  await AuthService.firebase()
                      .createUser(email: email, password: password);
                  AuthService.firebase().sendEmailVerification();
                  Navigator.of(context).pushNamed(verifyEmailRoute);
                } on WeakPasswordAuthException {
                  await showErrorDialog(context, "Weak password.");
                } on InvalidEmailAuthException {
                  await showErrorDialog(context, "Invalid email.");
                } on EmailAlreadyInUseAuthException {
                  await showErrorDialog(context, "Email is already in use.");
                } on GenericAuthException {
                  await showErrorDialog(context, "Authentication Error");
                }
              },
              child: const Text("Register")),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LoginView(),
              ));
            },
            child: const Text("I have already registered"),
          )
        ]));
  }
}
