import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalkingPage extends StatefulWidget {
  const WalkingPage({super.key});

  @override
  State<WalkingPage> createState() => WalkingPageState();
}

class WalkingPageState extends State<WalkingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    // Handle button press
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
                  'Congrats!!! You earned 20 points!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF5E7E0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            'assets/icons/Vector.svg',
            alignment: Alignment.topLeft,
            height: 55,
            width: 35,
          ),
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.brown,
      selectedItemColor: Colors.white,
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
          icon: Icon(Icons.share, color: Color(0xFF0a0908)),
          label: 'Share',
        )
      ],
    );
  }
}
