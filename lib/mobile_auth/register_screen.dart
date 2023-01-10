import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/mobile_auth/OTP.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:gap/gap.dart';

class RegisterMobile extends StatefulWidget {
  const RegisterMobile({super.key});

  @override
  State<RegisterMobile> createState() => _RegisterMobileState();
}

class _RegisterMobileState extends State<RegisterMobile> {
  Country selectCountry = Country(
      phoneCode: "+91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "");
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/image2.png"),
                ),
                const Gap(20),
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                const Text(
                  "Add your phone number. we'll send you a verification code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold),
                ),
                const Gap(20),
                TextFormField(
                  cursorColor: Colors.purple,
                  controller: mobileController,
                  decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                                context: context,
                                countryListTheme: const CountryListThemeData(
                                    bottomSheetHeight: 600),
                                onSelect: (v) {
                                  setState(() {
                                    selectCountry = v;
                                  });
                                });
                          },
                          child: Text(
                            "${selectCountry.flagEmoji}+ ${selectCountry.phoneCode}",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      hintText: "Enter phone number",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black38),
                        borderRadius: BorderRadius.circular(15),
                      )),
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
                        nextScreen(context, Otp());
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 16),
                      )),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  otpsendtoNextScreen() {}
}
