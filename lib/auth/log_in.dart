import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/auth/create_account.dart';
import 'package:flutter_application_1/helper/helper.dart';
import 'package:flutter_application_1/screen/home_page.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/services/database_Service.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:gap/gap.dart';

class LogIN extends StatefulWidget {
  const LogIN({super.key});

  @override
  State<LogIN> createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  Authservice authservice = Authservice();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textwidget("Groupie", Colors.black, 35),
                textwidget(
                    "Login Now to see what they are taking!", Colors.black, 17),
                Image.asset("assets/login.png"),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                Gap(10),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                Gap(10),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        login();
                      },
                      child: Text("Sign in")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textwidget("Dont Have an Account?", Colors.black, 14),
                    TextButton(
                        onPressed: () {
                          nextScreenReplacement(context, SignUP());
                        },
                        child: const Text(
                          "Register here",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.indigo),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    await authservice
        .signIN(emailController.text, passController.text)
        .then((value) async {
      if (value == true) {
        QuerySnapshot snapshot =
            await Database(uid: FirebaseAuth.instance.currentUser!.uid)
                .getData(emailController.text);

        await Helper().addName(snapshot.docs[0]["name"]);
        await Helper().addEMAIl(emailController.text);
        await Helper().addStatus(true);

        nextScreen(context, const HomePage());
      } else {
        SnackBar msg = SnackBar(content: Text(value));
        ScaffoldMessenger.of(context).showSnackBar(msg);
      }
    });
  }
}
