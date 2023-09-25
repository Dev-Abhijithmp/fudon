// ignore_for_file: prefer_const_constructors
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fudon/screen/donatorhome.dart';
import 'package:fudon/screen/profile.dart';


class Donatorpage extends StatefulWidget {
  const Donatorpage({Key? key}) : super(key: key);

  @override
  _DonatorpageState createState() => _DonatorpageState();
}

class _DonatorpageState extends State<Donatorpage> {
  int selectedindex = 0;
  List<Color> curvedcolor = [
    Colors.deepOrange,
    Colors.black,
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [Donatorhome(), Profilepage()];

    void changeindex(int index) {
      setState(() {
        selectedindex = index;
        curvedcolor[0] = Colors.black;
        curvedcolor[1] = Colors.black;
        curvedcolor[selectedindex] = Colors.deepOrange;
      });
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      body: pages[selectedindex],
      bottomNavigationBar: CurvedNavigationBar(
          color: Colors.orange,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.white,
          height: 50,
          index: selectedindex,
          onTap: changeindex,
          items: [
            Icon(
              Icons.home,
              color: curvedcolor[0],
            ),
            Icon(
              Icons.person,
              color: curvedcolor[1],
            ),
          ]),
    );
  }
}
