import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecohopv1/pages/carpool.dart';
import 'package:ecohopv1/pages/cycling.dart';
import 'package:ecohopv1/pages/landing.dart';
import 'package:ecohopv1/pages/loginpage.dart';
import 'package:ecohopv1/pages/signup.dart';
import 'package:ecohopv1/pages/walking.dart';
import 'package:flutter/material.dart';
import 'package:ecohopv1/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/land",
      routes: {
        "/land": (context) => const LandingPage(),
        "/home": (context) => const HomeNewPage(
              username: '',
            ),
        "/walk": (context) => const WalkingPage(
              username: '',
            ),
        "/car": (context) => const CarpoolPage(
              username: '',
            ),
        "/login": (context) => const LoginPage(),
        "/signup": (context) => const SignUpPage(),
        "/cycle": (context) => const CyclingPage(
              username: '',
            ),
      },
    );
  }
}
