import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecohopv1/pages/challenges.dart';
import 'package:ecohopv1/pages/home.dart';
import 'package:ecohopv1/pages/leaderboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState(username: username);
}

class _ProfilePageState extends State<ProfilePage> {
  String username;
  File? profilepic;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String piclink = "";
  String points = "";

  int userIndex = -1;

  _ProfilePageState({required this.username});
  void initState() {
    super.initState();
    asyncfunction();
  }

  void asyncfunction() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('points', descending: true)
        .get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i].id == uid) {
        userIndex = i;
        break;
      }
    }

    if (userIndex != -1) {
      setState(() {
        piclink = querySnapshot.docs[userIndex]['profilepic'];
        points = querySnapshot.docs[userIndex]['points'].toString();
      });
    }
  }

  void sameImage(XFile selectedImage) async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child("profilepictures")
        .child(Uuid().v1())
        .putFile(File(selectedImage.path));
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .update({"profilepic": downloadUrl});
    setState(() {
      piclink = downloadUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
          width: 500,
          height: 784,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xF0D8F3DC)),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 412,
                  height: 320,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5E7E0),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 279,
                top: 13,
                child: Container(
                  width: 22.63,
                  height: 22.63,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0)),
                  child: const Stack(children: []),
                ),
              ),
              Positioned(
                left: 310.68,
                top: 13,
                child: Container(
                  width: 22.63,
                  height: 22.63,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0)),
                  child: const Stack(children: []),
                ),
              ),
              Positioned(
                left: 342.37,
                top: 13,
                child: Container(
                  width: 22.63,
                  height: 22.63,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0)),
                  child: const Stack(children: []),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: null,
                ),
                margin: EdgeInsets.only(left: 100, top: 70),
                child: CupertinoButton(
                    onPressed: () async {
                      XFile? selectedImage = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (selectedImage != null) {
                        sameImage(selectedImage);
                      }
                    },
                    padding: EdgeInsets.zero,
                    child: ClipOval(
                      child: Image.network(
                        piclink,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.grey,
                          );
                        },
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            );
                          }
                        },
                      ),
                    )),
              ),
              const Positioned(
                left: 29,
                top: 12,
                child: Text(
                  '',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 79,
                top: 238,
                child: SizedBox(
                  width: 250,
                  height: 73,
                  child: Container(
                    margin: EdgeInsets.only(left: 65, top: 30),
                    child: Text(
                      username,
                      style: TextStyle(
                        color: Color(0xFF582F0E),
                        fontSize: 32,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 78,
                top: 319,
                child: Container(
                  width: 25,
                  height: 25,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0)),
                ),
              ),
              Positioned(
                left: 44,
                top: 336,
                child: Container(
                  width: 136,
                  height: 125.31,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 136,
                          height: 125.31,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF23B832),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 35,
                        top: 19,
                        child: SizedBox(
                          width: 78,
                          height: 29,
                          child: Text(
                            'Points',
                            style: TextStyle(
                              color: Color(0xFF582F0E),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 38,
                        top: 45,
                        child: SizedBox(
                          width: 78,
                          height: 60.07,
                          child: Text(
                            points.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 48,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 218,
                top: 336,
                child: Container(
                  width: 136,
                  height: 125.31,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 136,
                          height: 125.31,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF23B832),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 27,
                        top: 18,
                        child: SizedBox(
                          width: 91,
                          height: 29,
                          child: Container(
                            margin: EdgeInsets.only(left: 6),
                            child: Text(
                              'Position',
                              style: TextStyle(
                                color: Color(0xFF582F0E),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 29,
                        top: 45,
                        child: SizedBox(
                          width: 104,
                          height: 62,
                          child: Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text(
                              (userIndex + 1).toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 48,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 342,
                top: 53,
                child: Container(
                  width: 27,
                  height: 27,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(children: []),
                ),
              ),
              Positioned(
                left: 38,
                top: 501,
                child: Container(
                  width: 318,
                  height: 48,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 318,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5E7E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 57),
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 69),
                              child: Text(
                                'Your Details',
                                style: TextStyle(
                                  color: Color(0xFF484444),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 280,
                        top: 14,
                        child: Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: -2,
                                top: 0,
                                child: Container(
                                  width: 16,
                                  height: 17.02,
                                  child: const Stack(children: []),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 565,
                child: Container(
                  width: 318,
                  height: 51,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 318,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5E7E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 60),
                              child: Icon(
                                Icons.notifications,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 65),
                              child: Text(
                                'Notifications',
                                style: TextStyle(
                                  color: Color(0xFF484444),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 280,
                        top: 15,
                        child: Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Stack(
                            children: [
                              Positioned(
                                left: -2,
                                top: 0,
                                child: Container(
                                  width: 16,
                                  height: 17.02,
                                  child: const Stack(children: []),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 318,
                top: 608.10,
                child: Container(
                  width: 24,
                  height: 22.18,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                ),
              ),
              Positioned(
                left: 38,
                top: 698,
                child: Container(
                  width: 318,
                  height: 48,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 318,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5E7E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 27,
                        top: 18.04,
                        child: Container(
                          width: 27.33,
                          height: 20.10,
                          child: const Stack(children: []),
                        ),
                      ),
                      Positioned(
                        left: 0, //altered
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center, //added alignment
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 70),
                              child: Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 8, //removed one sizebox
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 90),
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  color: Color(0xFF484444),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 281,
                        top: 20.12,
                        child: Container(
                          width: 16,
                          height: 15.73,
                          child: const Stack(children: []),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 36,
                top: 634,
                child: Container(
                  width: 318,
                  height: 48,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 318,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5E7E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 75),
                              child: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 90),
                              child: Text(
                                'Privacy',
                                style: TextStyle(
                                  color: Color(0xFF484444),
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 280,
                        top: 15.87,
                        child: Container(
                          width: 24,
                          height: 22.18,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 316,
                top: 647.40,
                child: Container(
                  width: 16,
                  height: 15.73,
                  child: const Stack(children: []),
                ),
              ),
              Positioned(
                left: 17,
                top: 56,
                child: Container(
                  width: 27,
                  height: 27,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Stack(children: []),
                ),
              ),
            ],
          ),
        )
      ]),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
        backgroundColor: Colors.brown,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        currentIndex: 0,
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
                  builder: (context) => LeaderboardPage(username: username)),
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
