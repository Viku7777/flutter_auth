import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/log_in.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String? otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back))),
              Container(
                height: 200,
                width: 200,
                child: Image.asset("assets/image3.png"),
              ),
              const Gap(20),
              const Text(
                "Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              const Text(
                "Enter the OTP send to your phone number",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(20),
              Pinput(
                onSubmitted: (value) {
                  setState(() {
                    otp = value;
                  });
                },
                showCursor: true,
                defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.purple.shade200)),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                length: 6,
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
                      if (otp != null) {
                      } else {
                        SnackBar msg =
                            SnackBar(content: Text("Enter 6-Digit code"));
                        ScaffoldMessenger.of(context).showSnackBar(msg);
                      }
                    },
                    child: const Text(
                      "Verify",
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              const Gap(20),
              const Text(
                "Didn't recive any code?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(20),
              const Text(
                "Resend New Code  ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
      ),
    ));
  }
}
