import 'package:ecohopv1/pages/carpool.dart';
import 'package:ecohopv1/pages/landing.dart';
import 'package:ecohopv1/pages/walking.dart';
import 'package:flutter/material.dart';
import 'package:ecohopv1/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/land",
      routes: {
        "/land": (context) => const LandingPage(),
        "/home": (context) => const HomePage(),
        "/walk": (context) => const WalkingPage(),
        "/car": (context) => const CarpoolPage(),
      },
    );
  }
}
