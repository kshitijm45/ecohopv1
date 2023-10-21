import 'package:ecohopv1/pages/carpool.dart';
import 'package:ecohopv1/pages/challenges.dart';
import 'package:ecohopv1/pages/cycling.dart';
import 'package:ecohopv1/pages/leaderboard.dart';
import 'package:ecohopv1/pages/profile.dart';
import 'package:ecohopv1/pages/walking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeNewPage extends StatelessWidget {
  const HomeNewPage({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFD8F3DC),
        appBar: AppBar(
          title: Text('Hi $username',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              )),
          backgroundColor: const Color(0xFFF5E7E0),
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(15),
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5E7E0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  'assets/icons/settings.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5E7E0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset('assets/icons/bell.svg',
                      height: 20, width: 20),
                )),
          ],
        ),
        body: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 50, left: 10),
              child: SvgPicture.asset("assets/icons/yourgoals.svg")),
          // Container(
          //   margin: const EdgeInsets.only(bottom: 30, top: 20),
          //   child: const Text('Your Goals',
          //       style: TextStyle(
          //         color: Colors.black,
          //         fontSize: 25,
          //       )),
          // ),
          // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          //   Container(
          //       margin: const EdgeInsets.only(left: 25),
          //       alignment: Alignment.center,
          //       child: const Text('60%',
          //           style: TextStyle(
          //             color: Colors.black,
          //             fontSize: 25,
          //           )),
          //       width: 105,
          //       height: 103,
          //       decoration: BoxDecoration(
          //         border: Border.all(
          //           color: const Color.fromRGBO(183, 21, 62, 1),
          //           width: 7,
          //         ),
          //         borderRadius:
          //             const BorderRadius.all(Radius.elliptical(105, 103)),
          //       )),
          //   Container(
          //       width: 170,
          //       height: 109,
          //       child: Stack(children: <Widget>[
          //         const Positioned(
          //             top: 0,
          //             left: 0,
          //             child: Text(
          //               'Goal 1',
          //               textAlign: TextAlign.left,
          //               style: TextStyle(
          //                   color: Color.fromRGBO(0, 0, 0, 1),
          //                   fontFamily: 'Nunito',
          //                   fontSize: 20,
          //                   letterSpacing:
          //                       0 /percentages not used in flutter. defaulting to zero/,
          //                   fontWeight: FontWeight.normal,
          //                   height: 1),
          //             )),
          //         const Positioned(
          //             top: 0,
          //             left: 0,
          //             child: Text(
          //               'Goal 1',
          //               textAlign: TextAlign.left,
          //               style: TextStyle(
          //                   color: Color.fromRGBO(0, 0, 0, 1),
          //                   fontFamily: 'Nunito',
          //                   fontSize: 20,
          //                   letterSpacing:
          //                       0 /percentages not used in flutter. defaulting to zero/,
          //                   fontWeight: FontWeight.normal,
          //                   height: 1),
          //             )),
          //         Positioned(
          //             top: 38,
          //             left: 0,
          //             child: Container(
          //                 width: 85,
          //                 height: 9,
          //                 decoration: const BoxDecoration(
          //                   borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(100),
          //                     topRight: Radius.circular(100),
          //                     bottomLeft: Radius.circular(100),
          //                     bottomRight: Radius.circular(100),
          //                   ),
          //                   color: Color.fromRGBO(183, 21, 62, 1),
          //                 ))),
          //         const Positioned(
          //             top: 60,
          //             left: 1,
          //             child: Text(
          //               'Goal 2',
          //               textAlign: TextAlign.left,
          //               style: TextStyle(
          //                   color: Color.fromRGBO(0, 0, 0, 1),
          //                   fontFamily: 'Nunito',
          //                   fontSize: 20,
          //                   letterSpacing:
          //                       0 /percentages not used in flutter. defaulting to zero/,
          //                   fontWeight: FontWeight.normal,
          //                   height: 1),
          //             )),
          //         Positioned(
          //             top: 100,
          //             left: 0,
          //             child: Container(
          //                 width: 125,
          //                 height: 9,
          //                 decoration: const BoxDecoration(
          //                   borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(100),
          //                     topRight: Radius.circular(100),
          //                     bottomLeft: Radius.circular(100),
          //                     bottomRight: Radius.circular(100),
          //                   ),
          //                   color: Color.fromRGBO(183, 21, 62, 1),
          //                 ))),
          //         Positioned(
          //             top: 100,
          //             left: 0,
          //             child: Container(
          //                 width: 125,
          //                 height: 9,
          //                 decoration: const BoxDecoration(
          //                   borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(100),
          //                     topRight: Radius.circular(100),
          //                     bottomLeft: Radius.circular(100),
          //                     bottomRight: Radius.circular(100),
          //                   ),
          //                   color: Color.fromRGBO(183, 21, 62, 1),
          //                 ))),
          //         const Positioned(
          //             top: 35,
          //             left: 102,
          //             child: Text(
          //               '50%',
          //               textAlign: TextAlign.left,
          //               style: TextStyle(
          //                   color: Color.fromRGBO(0, 0, 0, 1),
          //                   fontFamily: 'Nunito',
          //                   fontSize: 12,
          //                   letterSpacing:
          //                       0 /percentages not used in flutter. defaulting to zero/,
          //                   fontWeight: FontWeight.normal,
          //                   height: 1),
          //             )),
          //         const Positioned(
          //             top: 95,
          //             left: 134,
          //             child: Text(
          //               '75%',
          //               textAlign: TextAlign.left,
          //               style: TextStyle(
          //                   color: Color.fromRGBO(0, 0, 0, 1),
          //                   fontFamily: 'Nunito',
          //                   fontSize: 12,
          //                   letterSpacing:
          //                       0 /percentages not used in flutter. defaulting to zero/,
          //                   fontWeight: FontWeight.normal,
          //                   height: 1),
          //             )),
          //       ]))
          // ]),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WalkingPage(
                                username: username,
                              )),
                    );
                    //print("clicked");
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 70, top: 56),
                    width: 76,
                    height: 68,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(33, 123, 81, 0.733),
                      borderRadius: BorderRadius.all(Radius.elliptical(76, 68)),
                    ),
                    child: SvgPicture.asset('assets/icons/walking.svg',
                        height: 7, width: 7, fit: BoxFit.scaleDown),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CyclingPage(
                                username: username,
                              )),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 56),
                    width: 76,
                    height: 68,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(33, 123, 81, 0.733),
                      borderRadius: BorderRadius.all(Radius.elliptical(76, 68)),
                    ),
                    child: SvgPicture.asset('assets/icons/bicycle.svg',
                        height: 7, width: 7, fit: BoxFit.scaleDown),
                  )),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CarpoolPage(
                                username: username,
                              )),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 56),
                    width: 76,
                    height: 68,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(33, 123, 81, 0.733),
                      borderRadius: BorderRadius.all(Radius.elliptical(76, 68)),
                    ),
                    child: SvgPicture.asset('assets/icons/car-alt.svg',
                        height: 7, width: 7, fit: BoxFit.scaleDown),
                  )),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left: 115, top: 25),
                    width: 76,
                    height: 68,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(33, 123, 81, 0.733),
                      borderRadius: BorderRadius.all(Radius.elliptical(76, 68)),
                    ),
                    child: SvgPicture.asset('assets/icons/bus.svg',
                        height: 7, width: 7, fit: BoxFit.scaleDown),
                  )),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 25, left: 21),
                    width: 76,
                    height: 68,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(33, 123, 81, 0.733),
                      borderRadius: BorderRadius.all(Radius.elliptical(76, 68)),
                    ),
                    child: SvgPicture.asset('assets/icons/train.svg',
                        height: 7, width: 7, fit: BoxFit.scaleDown),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: SvgPicture.asset('assets/icons/community.svg'),
          )
        ]),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.brown,
            selectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            currentIndex: 2,
//-----------
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
            }));
  }
}
