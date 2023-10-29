// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudon/innerscreen/loadingpage.dart';
import 'package:fudon/innerscreen/somethingwentwrong.dart';
import 'package:fudon/screen/delivery.dart';
import 'package:fudon/screen/donator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../authentication/authenticate.dart';

Color darkorange = Color(0xffF5591F);
Color lightorange = Color(0xffF2861E);
// ignore: non_constant_identifier_names
bool is_selected = false;

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  int index = 0;
  List<Color> welcomecolor = [
    Colors.white,
    Colors.white,
  ];
  List<Widget> page = [Donatorpage(), delivery()];
  void changecolor(int val) {
    setState(() {
      index = val;
      welcomecolor[0] = Colors.white;
      welcomecolor[1] = Colors.white;
      welcomecolor[val] = darkorange;
      is_selected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('user')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(includeMetadataChanges: true),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData == true) {
              DocumentSnapshot doc = snapshot.data!;

              if (doc.get('isverified') == true) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("choose any one"),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                changecolor(0);
                              },
                              child: Container(
                                height: 90,
                                width: 90,
                                child: Icon(
                                  Icons.fastfood,
                                  size: 50,
                                ),
                                decoration: BoxDecoration(
                                    color: welcomecolor[0],
                                    border:
                                        Border.all(color: darkorange, width: 2),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Donate",
                              style: GoogleFonts.notoSans(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("donate your food "),
                            Text("for needy")
                          ],
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                changecolor(1);
                              },
                              child: Container(
                                height: 90,
                                width: 90,
                                child: Icon(
                                  Icons.delivery_dining,
                                  size: 60,
                                ),
                                decoration: BoxDecoration(
                                    color: welcomecolor[1],
                                    border:
                                        Border.all(color: darkorange, width: 2),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Recieve",
                              style: GoogleFonts.notoSans(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Collect food "),
                            Text("for needy")
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 300,
                    ),
                    is_selected
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return page[index];
                              }));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              child: Center(
                                child: Text("Proceed"),
                              ),
                              decoration: BoxDecoration(
                                  color: darkorange,
                                  borderRadius: BorderRadius.circular(115)),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(bottom: 20),
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 50,
                          ),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            "Verification is not completed ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Contact admin for verification ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 300,
                    ),
                    InkWell(
                      onTap: () {
                        signout();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: darkorange,
                        ),
                        child: const Center(child: Text("Logout")),
                      ),
                    ),
                  ],
                );
              }
            } else if (snapshot.hasError == true) {
              return const Somethingwentwrong();
            } else {
              return const Loadingpage();
            }
          }),
    );
  }
}
