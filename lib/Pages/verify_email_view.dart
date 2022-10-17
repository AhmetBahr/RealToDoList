import 'package:flutter/material.dart';
import 'package:real_to_do_list/Const/routes.dart';
import 'package:real_to_do_list/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget{
  const VerifyEmailView ({ Key? key }) : super(key: key);

  @override
  _StateVerifyEmailView createState() => _StateVerifyEmailView();
}

class _StateVerifyEmailView extends State<VerifyEmailView>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(registerRoute, (_) => false);
            }, 
            icon: Icon(Icons.arrow_back, size: 35.0)
          ),
        ]
      ),
      body: Column( children: [
        const Text("We've sent you an email verification. Please open it to verify your account."),
        TextButton(
          onPressed: () async {
            AuthService.firebase().sendEmailVerification();
          }, 
          child: const Text("Tap if you haven't recieved the verification email.")
        ),
        TextButton(
          onPressed: () async {
            await AuthService.firebase().logOut();
            Navigator.of(context).restorablePushNamedAndRemoveUntil(registerRoute, (route) => false);
          }, 
          child: const Text("Retry"))
      ])
    );
  }
}
