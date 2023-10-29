import 'package:flutter/material.dart';
import 'package:fudon/screen/donorstatus.dart';

showdialogue(String title, String content, context) {
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"),
              ),
            ],
          ));
}

showdialoguedonar(String title, String content, context) {
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => Donarstatus()));
                },
                child: Text("ok"),
              ),
            ],
          ));
}

class KeyClass {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
