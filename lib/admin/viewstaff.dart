import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fudon/innerscreen/loadingpage.dart';

import '../innerscreen/somethingwentwrong.dart';
import 'adminfunctions.dart';

class ViewUsers extends StatelessWidget {
  const ViewUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View staffs"),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('user')
            .where('role', isEqualTo: 'user')
            .snapshots(includeMetadataChanges: true),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError == true) {
            return const Somethingwentwrong();
          } else if (snapshot.connectionState == ConnectionState.active) {
            List<DocumentSnapshot> data = snapshot.data!.docs;
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return singlecollectionstaff(data[index], context);
              },
              itemCount: data.length,
            );
          } else {
            return const Loadingpage();
          }
        },
      ),
    );
  }
}

Widget singlecollectionstaff(DocumentSnapshot doc, context) {
  return Container(
    width: double.infinity,
    height: 350,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
        border: Border.all(color: Colors.blue)),
    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
    child: Column(
      children: [
        staffitems("Name", doc.get('name')),
        staffitems("Email", doc.get('email')),
        staffitems("Phone", doc.get('phone')),
        staffitems("Verifiedornot", doc.get('isverified').toString()),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                removeuser(doc.id);
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    color: Colors.blue),
                child: const Center(
                  child: Text("Remove"),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                verifyuser(doc.id);
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    color: Colors.blue),
                child: const Center(
                  child: Text("verify"),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget staffitems(String field, String data) {
  return SizedBox(
    width: double.infinity,
    height: 65,
    child: Card(
      child: ListTile(
        title: Text(
          field,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          data,
          style: const TextStyle(),
        ),
      ),
    ),
  );
}
