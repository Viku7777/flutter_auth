import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/auth/log_in.dart';
import 'package:flutter_application_1/helper/helper.dart';
import 'package:flutter_application_1/screen/home_page.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:gap/gap.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  Authservice authservice = Authservice();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

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
                textwidget("Create your account now to chat and explore",
                    Colors.black, 17),
                Image.asset("assets/register.png"),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const Gap(7),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                const Gap(7),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                Gap(5),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        signUp();
                      },
                      child: Text("Sign up")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textwidget("Already Have an Account?", Colors.black, 14),
                    TextButton(
                        onPressed: () {
                          nextScreenReplacement(context, const LogIN());
                        },
                        child: const Text(
                          "Log In",
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

  signUp() async {
    await authservice
        .signUP(nameController.text, emailController.text, passController.text)
        .then((value) async {
      if (value == true) {
        await Helper().addName(passController.text);
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
