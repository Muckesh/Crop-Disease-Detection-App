// import 'package:crop_disease_detection/screens/login_screen.dart';
// import 'package:crop_disease_detection/screens/signup_screen.dart';
// import 'package:flutter/material.dart';

// class LoginOrRegisterScreen extends StatefulWidget {
//   const LoginOrRegisterScreen({super.key});

//   @override
//   State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
// }

// class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
//   // initial show login
//   bool showLoginPage = true;

//   // toggle
//   void toggleScreens() {
//     setState(() {
//       showLoginPage = !showLoginPage;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showLoginPage) {
//       return LoginScreen(
//         onTap: toggleScreens,
//       );
//     } else {
//       return SignupScreen(
//         onTap: toggleScreens,
//       );
//     }
//   }
// }
