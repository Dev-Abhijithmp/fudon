// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:fudon/authentication/authenticate.dart';
import 'package:fudon/screen/donardetails.dart';
import 'package:fudon/screen/donorstatus.dart';
import 'package:google_fonts/google_fonts.dart';

class Donatorhome extends StatefulWidget {
  Donatorhome({Key? key}) : super(key: key);

  @override
  _DonatorhomeState createState() => _DonatorhomeState();
}

class _DonatorhomeState extends State<Donatorhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: 500,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: const [(Color(0xffF5591F)), Color(0xffF2861E)],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight)),
        child: Container(
            margin: EdgeInsets.only(right: 30, top: 150, left: 30),
            alignment: Alignment.topCenter,
            child: Text(
              "DONATION",
              style: GoogleFonts.blackHanSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 40,
                  color: Colors.white),
            )),
      ),
      Padding(
          padding: EdgeInsets.only(top: 250),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(40)),
            ),
            child: Column(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Container(
                          width: 170,
                          height: 65,
                          margin: EdgeInsets.only(left: 15, top: 60),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade500,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.add_circle_outline,
                              size: 40,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => donardetails()));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "Donate",
                              textAlign: TextAlign.right,
                              style: GoogleFonts.blackHanSans(fontSize: 15),
                            )),
                      ]),
                      Column(
                        children: [
                          Container(
                              width: 170,
                              height: 65,
                              margin: EdgeInsets.only(left: 10, top: 60),
                              decoration: BoxDecoration(
                                color: Colors.yellow.shade600,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.ad_units_outlined,
                                  size: 40,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Donarstatus()));
                                },
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 23),
                              child: Text(
                                "Status",
                                textAlign: TextAlign.right,
                                style: GoogleFonts.blackHanSans(fontSize: 15),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              width: 170,
                              height: 65,
                              margin: EdgeInsets.only(left: 30, top: 60),
                              decoration: BoxDecoration(
                                color: Colors.redAccent.shade400,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.logout,
                                  size: 40,
                                ),
                                onPressed: () {
                                  signout();
                                  Navigator.canPop(context)
                                      ? Navigator.pop(context)
                                      : null;
                                },
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Logout",
                                textAlign: TextAlign.right,
                                style: GoogleFonts.blackHanSans(fontSize: 15),
                              )),
                        ],
                      )
                    ])
              ],
            ),
          )),
    ]));
  }
}
