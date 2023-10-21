// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, duplicate_import

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
import 'package:http/http.dart' as http;

class CarPoolResults extends StatefulWidget {
  final String username;
  final String fromLocation;
  final String toLocation;
  const CarPoolResults(
      {super.key,
      required this.username,
      required this.fromLocation,
      required this.toLocation});

  @override
  State<CarPoolResults> createState() => _CarPoolResultsState(
      username: username, fromLocation: fromLocation, toLocation: toLocation);
}

class _CarPoolResultsState extends State<CarPoolResults> {
  String displayedMessage = ' ';
  String username;
  String fromLocation;
  String toLocation;
  _CarPoolResultsState(
      {required this.username,
      required this.fromLocation,
      required this.toLocation});

  var data;
  Future<void> getProductsApi() async {
    final response =
        await http.get(Uri.parse('http://192.168.56.1:8080/getAllusers'));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      data = jsonDecode(
          '[{"id":1,"companyName":"Ola","price":"500 rs"},{"id":2,"companyName":"Uber","price":"450 rs"}]');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(),
      backgroundColor: Color(0xFFD8F3DC),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getProductsApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading');
                } else {
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 5, // Add a shadow to the card
                            margin: EdgeInsets.all(
                                10), // Add some margin around the card
                            child: Padding(
                              padding: EdgeInsets.all(
                                  10), // Add some padding inside the card
                              child: Column(
                                children: [
                                  ReusbaleRow(
                                    value: data[index]['id'].toString(),
                                    username: username,
                                  ),
                                  ReusbaleRow(
                                    value:
                                        data[index]['companyName'].toString(),
                                    username: username,
                                  ),
                                  ReusbaleRow(
                                    value: data[index]['price'].toString(),
                                    username: username,
                                  ),
                                ],
                              ),
                            ));
                      });
                }
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      title: const Text(
        'Carpool Results',
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
            'assets/icons/car-alt.svg',
            alignment: Alignment.centerRight,
            height: 100,
            width: 100,
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

class ReusbaleRow extends StatelessWidget {
  String value;
  String username;
  ReusbaleRow({Key? key, required this.value, required this.username})
      : super(key: key);

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
