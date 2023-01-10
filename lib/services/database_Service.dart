import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  String uid;

  Database({required this.uid});

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("users");

  //Save Data

  Future addData(String name, String email, String password) async {
    await userCollection.doc(uid).set({
      "name": name,
      "password": password,
      "groups": [],
      "email": email,
      "uid": uid
    });
  }

// send Data

  Future getData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // send Group list

  Future groupData() async {
    return userCollection.doc(uid).snapshots();
  }
}
