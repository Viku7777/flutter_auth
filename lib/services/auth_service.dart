import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/auth/log_in.dart';
import 'package:flutter_application_1/services/database_Service.dart';

class Authservice {
  // String uid;
  // Authservice({required this.uid});

  Future signUP(String name, String email, String password) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      if (user != null) {
        Database(uid: user.uid).addData(name, email, password);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signIN(String email, String pass) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: pass);
      return true;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  //LogOut

  Future logOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      await firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
