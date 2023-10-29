import 'package:flutter/material.dart';
import 'package:fudon/admin/viewusers.dart';

import '../authentication/authenticate.dart';

class Adminpage extends StatelessWidget {
  const Adminpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const ViewUsers()));
            },
            child: Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text("view users"),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const ViewcomplaintAdmin()));
          //   },
          //   child: Container(
          //     height: 50,
          //     width: double.infinity,
          //     margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       color: Colors.blue,
          //     ),
          //     child: const Center(
          //       child: Text("View Requests"),
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () {
              signout();
            },
            child: Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              child: const Center(
                child: Text("Logout "),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
