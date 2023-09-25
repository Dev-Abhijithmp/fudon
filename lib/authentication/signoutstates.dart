// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fudon/authentication/authenticate.dart';
import 'package:fudon/authentication/login.dart';
import 'package:fudon/innerscreen/loadingpage.dart';
import 'package:fudon/innerscreen/somethingwentwrong.dart';
import 'package:fudon/screen/welcome.dart';

class Signinout extends StatefulWidget {
  const Signinout({Key? key}) : super(key: key);

  @override
  _SigninoutState createState() => _SigninoutState();
}

class _SigninoutState extends State<Signinout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: StreamBuilder(
          stream: changesign,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Somethingwentwrong();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return welcome();
            } else if (snapshot.hasData) {
              return welcome();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Loadingpage();
            } else {
              return login();
            }
          }),
    );
  }
}
