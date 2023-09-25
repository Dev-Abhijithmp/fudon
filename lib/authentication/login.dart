// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fudon/authentication/password.dart';
import 'package:fudon/authentication/registration.dart';
import 'package:fudon/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'authenticate.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

TextEditingController controllerMail = TextEditingController();
TextEditingController controllerPass = TextEditingController();
bool pass = true;

// ignore: camel_case_types
class _loginState extends State<login> {
  void changePass() {
    pass = !pass;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
            height: 300,
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
                "LOGIN",
                style: GoogleFonts.blackHanSans(
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                    color: Colors.white),
              ),
            )),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 70),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10), blurRadius: 7, color: Colors.grey)
            ],
          ),
          child: TextField(
            controller: controllerMail,
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.deepOrange),
              hintText: "ENTER THE EMAIL",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 7,
                color: Colors.grey,
              )
            ],
          ),
          child: TextField(
            controller: controllerPass,
            cursorColor: Color(0xffF5591F),
            obscureText: pass,
            decoration: InputDecoration(
              suffix: IconButton(
                onPressed: () => changePass(),
                icon: Icon(pass ? Icons.visibility_off : Icons.visibility),
              ),
              icon: Icon(Icons.vpn_key, color: Colors.deepOrange),
              hintText: "ENTER THE PASSWORD",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => password()),
              );
            },
            child: Text("Forgot your Password?"),
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (controllerMail.text.isEmpty || controllerPass.text.isEmpty) {
              showdialogue("Error", "fill all the fields", context);
            } else {
              Map<String, String?> flag =
                  await signinemail(controllerMail.text, controllerPass.text);
              // ignore: unrelated_type_equality_checks
              if (flag["status"] != "success") {
                showdialogue("Error", flag['status']!, context);
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
              "LOGIN",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have any account?"),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text(
                  "Register Now",
                  style: TextStyle(color: Color(0xffF5591F)),
                ),
              )
            ],
          ),
        )
      ]),
    ));
  }
}
