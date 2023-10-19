import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CarpoolPage extends StatefulWidget {
  const CarpoolPage({super.key});

  @override
  State<CarpoolPage> createState() => _CarpoolPageState();
}

class _CarpoolPageState extends State<CarpoolPage> {
  final people = ['1', '2', '3', '4', '5', '6'];
  final cartype = ['Mini', 'Sedan', 'SUV'];

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
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
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
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
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
                    margin:
                        const EdgeInsets.only(left: 10, right: 140, top: 20),
                    child: const Text(
                      'Number Of People:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Karla',
                          fontSize: 15,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      'Type of Vehicle:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Karla',
                          fontSize: 15,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
              ],
            ),
            Row(
              children: [
                Container(
                    width: 100,
                    margin:
                        const EdgeInsets.only(left: 20, right: 140, top: 20),
                    child: DropdownButton<String>(
                        isExpanded: true,
                        value: vals,
                        items: people.map(buildMenuItem).toList(),
                        onChanged: (vals) => setState(() {
                              this.vals = vals;
                            }))),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 15, top: 20),
                    child: DropdownButton<String>(
                        isExpanded: true,
                        value: val,
                        items: cartype.map(buildmenuItem).toList(),
                        onChanged: (val) => setState(() {
                              this.val = val;
                            }))),
              ],
            ),
            Container(
                width: 346,
                height: 86,
                margin: const EdgeInsets.only(left: 30, top: 10),
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 346,
                          height: 86,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(245, 231, 224, 1),
                          ))),
                ])),
            Container(
                width: 346,
                height: 86,
                margin: const EdgeInsets.only(left: 30, top: 10),
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 346,
                          height: 86,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(245, 231, 224, 1),
                          ))),
                ])),
            Container(
                width: 346,
                height: 86,
                margin: const EdgeInsets.only(left: 30, top: 10),
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 346,
                          height: 86,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(245, 231, 224, 1),
                          ))),
                ]))
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
        ));
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
