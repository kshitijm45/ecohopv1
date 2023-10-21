import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecohopv1/pages/challenges.dart';
import 'package:ecohopv1/pages/home.dart';
import 'package:ecohopv1/pages/profile.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  final String username;
  const LeaderboardPage({super.key, required this.username});

  @override
  State<LeaderboardPage> createState() =>
      _LeaderboardPageState(username: username);
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  String username;
  _LeaderboardPageState({required this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Color(0xFFD8F3DC),
        body: Container(
          margin: EdgeInsets.only(top: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .orderBy("points", descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Expanded(
                          child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> userMap =
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;
                          return ListTile(
                            leading: Text((index + 1).toString()),
                            title: Text(userMap["username"]),
                            trailing: Text(userMap["points"].toString()),
                          );
                        },
                      ));
                    } else {
                      return Text("No data!");
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ]),
        ),
        bottomNavigationBar: bottomNavigationBar());
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      title: const Text(
        'Leaderboard',
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
          child: Icon(Icons.leaderboard, color: Colors.black, size: 30),
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
        currentIndex: 1,
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
