import 'package:crop_disease_detection/screens/auth_screen.dart';
import 'package:crop_disease_detection/screens/login_screen.dart';
import 'package:crop_disease_detection/screens/main_screen.dart';
import 'package:crop_disease_detection/screens/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Crop Disease Detection App',
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}
