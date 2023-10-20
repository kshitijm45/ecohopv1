import 'package:ecohopv1/pages/home.dart';
import 'package:ecohopv1/pages/leaderboard.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState(username: username);
}

class _ProfilePageState extends State<ProfilePage> {
  String username;
  _ProfilePageState({required this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
          width: 390,
          height: 780,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xF0D8F3DC)),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 390,
                  height: 309,
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
              const Positioned(
                left: 29,
                top: 12,
                child: Text(
                  '10:00',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 79,
                top: 242,
                child: SizedBox(
                  width: 229,
                  height: 49,
                  child: Text(
                    'Arnav Chugh',
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
                      const Positioned(
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
                      const Positioned(
                        left: 38,
                        top: 45,
                        child: SizedBox(
                          width: 78,
                          height: 60.07,
                          child: Text(
                            '40',
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
                      const Positioned(
                        left: 27,
                        top: 18,
                        child: SizedBox(
                          width: 91,
                          height: 29,
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
                      const Positioned(
                        left: 29,
                        top: 45,
                        child: SizedBox(
                          width: 104,
                          height: 62,
                          child: Text(
                            '#4',
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
                      const Positioned(
                        left: 99,
                        top: 6,
                        child: SizedBox(
                          width: 127,
                          height: 29,
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
                      const Positioned(
                        left: 99,
                        top: 13,
                        child: SizedBox(
                          width: 171,
                          height: 38,
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
                      const Positioned(
                        left: 106,
                        top: 9,
                        child: SizedBox(
                          width: 97,
                          height: 39,
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
                      const Positioned(
                        left: 109,
                        top: 7,
                        child: SizedBox(
                          width: 106,
                          height: 29,
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
            icon: Icon(Icons.share, color: Color(0xFF0a0908)),
            label: 'Share',
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
                        username: "",
                      )),
            );
          }
        });
  }
}
