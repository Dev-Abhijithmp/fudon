

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fudon/admin/adminpage.dart';
import 'package:fudon/innerscreen/loadingpage.dart';
import 'package:fudon/screen/welcome.dart';

import '../innerscreen/somethingwentwrong.dart';

class Userswitcher extends StatelessWidget {
  const Userswitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection("user").doc(uid).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError == true) {
          return const Somethingwentwrong();
        } else if (snapshot.hasData == true) {
          DocumentSnapshot data = snapshot.data;
          if (data["role"] == "user") {
            return const welcome();
          } else {
            return const Adminpage();
          }
        } else {
          return const  Loadingpage();
        }
      },
    );
  }
}
