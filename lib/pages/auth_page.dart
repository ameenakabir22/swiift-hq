import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swiift/pages/homepage.dart';
import 'package:swiift/pages/login.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // if user is logged in
            if (snapshot.hasData) {
              return HomePage();
            }

            // if user is not logged in
            else {
              return LogIn();
            }
          }),
    );
  }
}
