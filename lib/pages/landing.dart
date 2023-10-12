import 'dart:convert';
import 'package:ecohopv1/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Map<String, dynamic>? _userData;
  bool _loggedIn = false;

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      var userData = await FacebookAuth.i.getUserData(
        fields: "name,email,picture.width(200),birthday,friends,gender,link",
      );
      setState(() {
        _userData = userData;
        _loggedIn = true;
      });
    } else {
      print(result.status);
      print(result.message);
    }
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    setState(() {
      _loggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD8F3DC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Container(
            //     margin: EdgeInsets.all(30),
            //     width: 230.7796630859375,
            //     height: 230,
            //     child: Image.asset(
            //       'assets/icons/mainlogo.svg',
            //       height: 100,
            //       width: 100,
            //     )),
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            _loggedIn == false
                ? SignInButton(
                    Buttons.Facebook,
                    onPressed: () {
                      _login();
                    },
                  )
                : TextButton(
                    onPressed: () {
                      _logout();
                    },
                    child: const Text('Log Out'),
                  ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text('Skip'),
            )
          ],
        ),
      ),
    );
  }
}
