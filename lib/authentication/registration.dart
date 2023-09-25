// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudon/authentication/authenticate.dart';
import 'package:fudon/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

TextEditingController controllerMail = TextEditingController();
TextEditingController controllerPass = TextEditingController();
TextEditingController controllername = TextEditingController();
TextEditingController controllerRepass = TextEditingController();
TextEditingController controllernum = TextEditingController();
bool pass1 = true;
bool pass2 = true;

class _RegisterState extends State<Register> {
  get flag => null;
  void changePass1() {
    pass1 = !pass1;
    setState(() {});
  }

  void changePass2() {
    pass2 = !pass2;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      key: KeyClass.scaffoldKey,
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                  colors: [(Color(0xffF5591F)), Color(0xffF2861E)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight)),
          child: Container(
              margin: EdgeInsets.only(right: 40, top: 30),
              padding: EdgeInsets.only(right: 20, left: 30),
              alignment: Alignment.bottomRight,
              child: Text(
                "REGISTER",
                style: GoogleFonts.blackHanSans(
                    fontWeight: FontWeight.w300,
                    fontSize: 30,
                    color: Colors.white),
              )),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 70),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[300],
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 7,
                color: Colors.grey,
              )
            ],
          ),
          child: TextField(
            controller: controllername,
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              icon: Icon(Icons.person, color: Colors.deepOrange),
              hintText: "ENTER THE NAME",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
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
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[300],
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 5,
                color: Colors.grey,
              )
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
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[300],
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 5,
                color: Colors.grey,
              )
            ],
          ),
          child: Form(
            key: KeyClass.formKey,
            child: TextFormField(
              controller: controllernum,
              cursorColor: Color(0xffF5591F),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) => KeyClass.formKey.currentState?.validate(),
              validator: (val) {
                if (val!.length < 10 || val.length > 10) {
                  return "ENTER A TEN DIGIT NUMBER";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                icon: Icon(Icons.call, color: Colors.deepOrange),
                hintText: "ENTER YOUR PHONE NUMBER",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
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
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[300],
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 5,
                color: Colors.grey,
              )
            ],
          ),
          child: TextField(
            obscureText: pass1,
            controller: controllerPass,
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              suffix: IconButton(
                onPressed: () => changePass1(),
                icon: Icon(pass1 ? Icons.visibility_off : Icons.visibility),
              ),
              icon: Icon(Icons.password, color: Colors.deepOrange),
              hintText: "ENTER THE PASSWORD?",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
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
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[300],
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 5,
                color: Colors.grey,
              )
            ],
          ),
          child: TextField(
            controller: controllerRepass,
            obscureText: pass2,
            cursorColor: Color(0xffF5591F),
            decoration: InputDecoration(
              suffix: IconButton(
                onPressed: () => changePass2(),
                icon: Icon(pass2 ? Icons.visibility_off : Icons.visibility),
              ),
              icon: Icon(Icons.password, color: Colors.deepOrange),
              hintText: "RE-ENTER THE PAASWORD",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        GestureDetector(
            onTap: () async {
              if (controllerMail.text.isEmpty ||
                  controllerPass.text.isEmpty ||
                  controllername.text.isEmpty ||
                  controllerRepass.text.isEmpty ||
                  controllernum.text.isEmpty) {
                showdialogue("Error", "fill all the fields", context);
              } else {
                if (controllerPass.text == controllerRepass.text) {
                  Map<String, String?> flag = await register(
                      controllerMail.text,
                      controllerPass.text,
                      controllername.text,
                      controllernum.text);
                  // ignore: unrelated_type_equality_checks
                  if (flag["status"] != "success") {
                    showdialogue("Error", flag['status']!, context);
                  } else {
                    Navigator.pop(context);
                  }
                } else {
                  showdialogue("Error", "password didnt match", context);
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
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 5,
                        color: Colors.grey)
                  ],
                ),
                child: Text(
                  "REGISTER",
                  style: TextStyle(color: Colors.white),
                ))),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Have Already Member?"),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "LOGIN NOW",
                  style: TextStyle(color: Color(0xffF5591F)),
                ),
              )
            ],
          ),
        ),
      ])));
}
