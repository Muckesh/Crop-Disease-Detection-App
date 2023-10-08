import 'package:crop_disease_detection/screens/login_screen.dart';
import 'package:crop_disease_detection/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user logged in
          if (snapshot.hasData) {
            return const MainScreen();
          }

          // user not logged in
          else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
