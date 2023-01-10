import 'package:flutter/material.dart';
import 'package:flutter_application_1/mobile_auth/register_screen.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:gap/gap.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image1.png"),
            const Gap(10),
            const Text(
              "Let's get started",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Gap(10),
            const Text(
              "Never a better time than now to start.",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold),
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () {
                    nextScreen(context, const RegisterMobile());
                  },
                  child: const Text(
                    "Get started",
                    style: TextStyle(fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    )));
  }
}
