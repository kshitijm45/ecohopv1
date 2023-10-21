import 'package:ecohopv1/pages/home.dart';
import 'package:ecohopv1/pages/leaderboard.dart';
import 'package:ecohopv1/pages/carpoolresults.dart';
import 'package:ecohopv1/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarpoolPage extends StatefulWidget {
  final String username;
  const CarpoolPage({super.key, required this.username});

  @override
  State<CarpoolPage> createState() => _CarpoolPageState(username: username);
}

class _CarpoolPageState extends State<CarpoolPage> {
  final people = ['1', '2', '3', '4', '5', '6'];
  final cartype = ['Mini', 'Sedan', 'SUV'];
  TextEditingController fromLocationCtrl = TextEditingController();
  TextEditingController toLocationCtrl = TextEditingController();
  String username;
  _CarpoolPageState({required this.username});
  String? val;

  String? vals;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
      ));
  DropdownMenuItem<String> buildmenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(),
        backgroundColor: const Color(0xFFD8F3DC),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                "Choose Start Location",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: fromLocationCtrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 20, right: 20, top: 15),
                  hintText: 'Enter location',
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                "Choose Destination",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: toLocationCtrl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 20, right: 20, top: 15),
                  hintText: 'Enter location',
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 150, top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      String fromLocation = fromLocationCtrl.text;
                      String toLocation = toLocationCtrl.text;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarPoolResults(
                                    username: username,
                                    fromLocation: fromLocation,
                                    toLocation: toLocation,
                                  )));
                    },
                    child: const Text('Enter'),
                  ),
                ),
              ],
            ),
          ],
        ),
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
                icon: Icon(Icons.share, color: Color(0xFF0a0908)),
                label: 'Share',
              )
            ],
            onTap: (int index) {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(
                            username: username,
                          )),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LeaderboardPage(username: username)),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeNewPage(
                            username: username,
                          )),
                );
              }
            }));
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      title: const Text(
        'Carpooling',
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
          height: 55,
          width: 35,
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF5E7E0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/car-alt.svg',
            alignment: Alignment.topLeft,
          ),
        ),
      ),
    );
  }
}

class ReusbaleRow extends StatelessWidget {
  String value;
  ReusbaleRow({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value),
        ],
      ),
    );
  }
}
