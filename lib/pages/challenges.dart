import 'package:ecohopv1/pages/home.dart';
import 'package:ecohopv1/pages/leaderboard.dart';
import 'package:ecohopv1/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChallengesPage extends StatefulWidget {
  final String username;
  const ChallengesPage({super.key, required this.username});

  @override
  State<ChallengesPage> createState() =>
      _ChallengesPageState(username: username);
}

class _ChallengesPageState extends State<ChallengesPage> {
  String username;
  _ChallengesPageState({required this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Color(0xFFD8F3DC),
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 50, left: 10),
                child: SvgPicture.asset("assets/icons/challenges.svg")),
            Container(
                margin: EdgeInsets.only(top: 50, left: 20),
                child: SvgPicture.asset("assets/icons/progress.svg"))
            // Container(
            //     margin: EdgeInsets.only(left: 42, top: 42),
            //     child: Text(
            //       "Daily Quests",
            //       style: TextStyle(fontSize: 20),
            //     )),
            // Container(
            //     width: 49,
            //     height: 42,
            //     margin: EdgeInsets.only(left: 18, top: 45),
            //     decoration: BoxDecoration(
            //       color: Color.fromRGBO(82, 183, 136, 1),
            //       borderRadius: BorderRadius.all(Radius.elliptical(49, 42)),
            //     ))
          ],
        ),
        bottomNavigationBar: bottomNavigationBar());
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      title: const Text(
        'Challenges',
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
          child: Icon(Icons.emoji_events, color: Colors.black, size: 30),
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
        currentIndex: 4,
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
