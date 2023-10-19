import 'package:ecohopv1/pages/home.dart';
import 'package:flutter/material.dart';

class LandingNewPage extends StatefulWidget {
  const LandingNewPage({super.key});

  @override
  State<LandingNewPage> createState() => _LandingNewPageState();
}

class _LandingNewPageState extends State<LandingNewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/login");
            },
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/signup");
            },
            child: const Text('SignUp'),
          ),
        ],
      ),
    );
  }
}
