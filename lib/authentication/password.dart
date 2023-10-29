// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fudon/authentication/authenticate.dart';
import 'package:fudon/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class password extends StatefulWidget {
  password({Key? key}) : super(key: key);

  @override
  _passwordState createState() => _passwordState();
}

TextEditingController controllermail = TextEditingController();

class _passwordState extends State<password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
            height: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                gradient: const LinearGradient(
                    colors: [(Color(0xffF5591F)), Color(0xffF2861E)],
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight)),
            child: Container(
              margin: EdgeInsets.only(right: 30, top: 30),
              alignment: Alignment.bottomRight,
              child: Text(
                "PASSWORD",
                style: GoogleFonts.blackHanSans(
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                    color: Colors.white),
              ),
            )),
        SizedBox(
          height: 80,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: TextFormField(
            controller: controllermail,
            decoration: InputDecoration(labelText: "Enter your E-mail"),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        SizedBox(height: 30),
        GestureDetector(
          onTap: () async {
            if (controllermail.text == "") {
              showdialogue("Error", "Fill all the Fields", context);
            } else {
              Map<String, String?> flag =
                  await sendpassreset(controllermail.text);
              if (flag['status'] != 'Success') {
                showdialogue("Result", flag['status']!, context);
              } else {
                showdialogue("Success", "Success", context);
                controllermail.clear();
              }
            }
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            height: 54,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orange,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 6,
                    color: Colors.grey.shade300)
              ],
            ),
            child: Text(
              "SUBMIT",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ]),
    ));
  }
}


