// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fudon/add/functions.dart';
import 'package:fudon/authentication/registration.dart';
import 'package:fudon/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class donardetails extends StatefulWidget {
  donardetails({Key? key}) : super(key: key);

  @override
  _donardetailsState createState() => _donardetailsState();
}

TextEditingController controllerfoodtype = TextEditingController();
TextEditingController controlleraddress = TextEditingController();
TextEditingController controllerdistrict = TextEditingController();
TextEditingController controllernum = TextEditingController();
TextEditingController controllerfoodcount = TextEditingController();
TextEditingController controllerName = TextEditingController();

bool isloading = false;

class _donardetailsState extends State<donardetails> {
  String vehicle = 'Car';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  gradient: const LinearGradient(
                      colors: [(Color(0xffF5591F)), Color(0xffF2861E)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight)),
              child: Container(
                margin: EdgeInsets.only(right: 30, top: 60, left: 40),
                alignment: Alignment.center,
                child: Text("FUDON",
                    style: GoogleFonts.blackHanSans(
                        fontWeight: FontWeight.w300,
                        fontSize: 30,
                        textStyle: TextStyle(color: Colors.white))),
              )),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              TextFormField(
                controller: controllername,
                decoration: InputDecoration(labelText: "Donator name"),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              TextFormField(
                controller: controllerfoodtype,
                decoration: InputDecoration(labelText: "Enter the Food Type"),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              TextFormField(
                controller: controllerfoodcount,
                decoration: InputDecoration(labelText: "Enter food count"),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Suggested Vehicle:'),
              value: vehicle,
              icon: const Icon(Icons.car_rental),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (String? newValue2) {
                setState(() {
                  vehicle = newValue2!;
                });
              },
              items: <String>['Car', 'Bike', 'Van', 'Truck']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              TextFormField(
                controller: controlleraddress,
                decoration: InputDecoration(labelText: "Enter Your Address"),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              TextFormField(
                controller: controllerdistrict,
                decoration: InputDecoration(labelText: "Enter your district"),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              TextFormField(
                controller: controllernum,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration:
                    InputDecoration(labelText: "Enter Your Mobile Number"),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          isloading == false
              ? InkWell(
                  onTap: () async {
                    if (controlleraddress.text == "" ||
                        controllerdistrict.text == "" ||
                        controllerfoodtype.text == "" ||
                        controllerfoodcount.text == "" ||
                        controllername.text == "" ||
                        controllernum.text.length < 10) {
                      showdialogue("Error", "Fill all the fields", context);
                    } else {
                      isloading = true;
                      Map<String, String> flag = await donatefood(
                          controllername.text,
                          controllerfoodtype.text,
                          controllerfoodcount.text,
                          vehicle,
                          controlleraddress.text,
                          controllerdistrict.text,
                          controllernum.text);
                      if (flag['status'] == 'success') {
                        showdialogue("success", "success", context);
                        setState(() {
                          isloading = false;
                          controllerMail.clear();
                          controllerName.clear();
                          controllerfoodcount.clear();
                          controlleraddress.clear();
                          controllerdistrict.clear();
                          controllernum.clear();
                          controllerfoodtype.clear();
                        });
                      } else {
                        setState(() {
                          isloading = false;
                          showdialogue("Error", flag['status']!, context);
                        });
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
                    height: 40,
                    width: 120,
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
                      "submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
              : Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  height: 40,
                  width: 120,
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
                    "Loading...",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
        ])),
      ),
    );
  }
}
