import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecohopv1/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cpassword = cpasswordController.text.trim();
    String username = usernameController.text.trim();
    if (email == "" || password == "" || cpassword == "")
      log("Please fill all the details");
    else if (password != cpassword)
      log("Passwords don't match");
    else {
      try {
        QuerySnapshot usernameCheck = await FirebaseFirestore.instance
            .collection("users")
            .where("username", isEqualTo: username)
            .get();

        if (usernameCheck.docs.isNotEmpty) {
          log("Username already exists");
        } else {
          // Create user if username is unique
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);

          if (userCredential.user != null) {
            saveUser(); // Save user data to Firestore
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeNewPage(username: username),
              ),
            );
          }
        }
      } on FirebaseAuthException catch (ex) {
        log(ex.code.toString());
      }
    }
  }

  void saveUser() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    String username = usernameController.text.trim();
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set({"username": username, "points": 0, "profilepic": ""});
    log("useradded");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFD8F3DC),
      appBar: appBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.brown)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.brown)),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.brown)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.brown)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.brown)),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.brown)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.brown)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.brown)),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.brown)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: cpasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.brown)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.brown)),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(color: Colors.brown)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: 300,
                height: 75,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: ElevatedButton(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Sign Up'), // <-- Text
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          // <-- Icon
                          Icons.login,
                          size: 24.0,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown, // Background color
                    ),
                    onPressed: () {
                      createAccount();
                    }),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      title: const Text(
        'Sign Up',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.brown,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          height: 500,
          width: 500,
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
