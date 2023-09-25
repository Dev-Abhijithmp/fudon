// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, camel_case_types, unused_field

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fudon/authentication/signoutstates.dart';
import 'package:fudon/innerscreen/loadingpage.dart';
import 'package:fudon/innerscreen/somethingwentwrong.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(home());
}

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Somethingwentwrong();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return Signinout();
            }
            return Loadingpage();
          }),
    );
  }
}
