import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/helper.dart';
import 'package:flutter_application_1/mobile_auth/MainScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool logInStatus = false;

  @override
  void initState() {
    sfStatus();
    super.initState();
  }

  sfStatus() async {
    await Helper().getStatus().then((value) {
      setState(() {
        logInStatus = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        // home: LogIN());
        home: const MainScreen());
    // home: logInStatus ? const HomePage() : const LogIN());
  }
}
