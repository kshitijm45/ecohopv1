// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, duplicate_import, unused_local_variable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecohopv1/pages/challenges.dart';
import 'package:ecohopv1/pages/leaderboard.dart';
import 'package:ecohopv1/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';
import 'package:ecohopv1/pages/home.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WalkingPage extends StatefulWidget {
  final String username;
  const WalkingPage({super.key, required this.username});
  @override
  State<WalkingPage> createState() => _WalkingPageState(username: username);
}

class _WalkingPageState extends State<WalkingPage> {
  TextEditingController myController = TextEditingController();
  String displayedMessage = ' ';
  String username;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  _WalkingPageState({required this.username});
  void update(int data) async {
    try {
      var documentReference =
          FirebaseFirestore.instance.collection("users").doc(uid);

      var documentSnapshot = await documentReference.get();

      if (documentSnapshot.exists) {
        var oldpoints = documentSnapshot['points'];
        await documentReference.update({"points": oldpoints + data});
        print('Document data updated: $data');
      } else {
        print('Document with ID $uid does not exist.');
      }
    } catch (error) {
      print('Error updating document: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(),
      backgroundColor: Color(0xFFD8F3DC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff1D1617).withOpacity(0.11),
                          blurRadius: 40,
                          spreadRadius: 0.0,
                        )
                      ],
                    ),
                    child: TextField(
                      controller: myController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 20, right: 20, top: 15),
                        hintText: 'Enter KM travelled',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 12),
                        suffixIcon: Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              VerticalDivider(
                                color: Colors.black,
                                indent: 10,
                                endIndent: 10,
                                thickness: 0.1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child:
                                    SvgPicture.asset('assets/icons/_Close.svg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width:
                        10), // Add spacing between the TextField and the button
                ElevatedButton(
                  onPressed: () {
                    String userInput = myController.text;

                    RegExp regExp = RegExp(r'^\d+$');

                    if (regExp.hasMatch(userInput)) {
                      int number = int.parse(userInput);
                      int output = number * 4;
                      update(output);
                      String customMessage = '$output points!';

                      setState(() {
                        displayedMessage = customMessage;
                      });
                    } else {
                      setState(() {
                        displayedMessage = 'Invalid input';
                      });
                    }
                  },
                  child: Text('Enter'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You earned : $displayedMessage',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 10,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30, right: 100, left: 20),
                      child: SvgPicture.asset("assets/icons/walk.svg"),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30, top: 30),
                      child: SvgPicture.asset("assets/icons/circle.svg"),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 3, left: 10),
                  child: SvgPicture.asset(
                    'assets/icons/map (1).svg',
                    //width: 10,
                    height: 218,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      title: const Text(
        'Walking Goals',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color(0xFFF5E7E0),
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: const Color(0xFFF5E7E0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/walking.svg', // Provide the correct path to your SVG file
            alignment: Alignment.centerRight,
            height: 45,
            width: 35,
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        currentIndex: 2,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF0a0908)),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard, color: Color(0xFF0a0908)),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF0a0908)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard, color: Color(0xFF0a0908)),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events, color: Color(0xFF0a0908)),
            label: 'Challenges',
          )
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilePage(username: username)),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LeaderboardPage(
                        username: username,
                      )),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeNewPage(
                        username: username,
                      )),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChallengesPage(
                        username: username,
                      )),
            );
          }
        });
  }
}
