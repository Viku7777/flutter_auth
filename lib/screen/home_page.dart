import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/log_in.dart';
import 'package:flutter_application_1/helper/helper.dart';
import 'package:flutter_application_1/services/auth_service.dart';
import 'package:flutter_application_1/services/database_Service.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Authservice authservice = Authservice();
  TextEditingController createGroup = TextEditingController();
  Stream? group;
  String name = "";
  String email = "";
  @override
  void initState() {
    sfFunction();
    super.initState();
  }

  sfFunction() async {
    await Database(uid: FirebaseAuth.instance.currentUser!.uid)
        .groupData()
        .then((value) {
      group = value;
    });
    await Helper().getName().then((value) {
      print(value);
      setState(() {
        name = value!;
      });
    });
    await Helper().getStatus().then((value) {
      print(value);
    });
    await Helper().getEmail().then((value) {
      print(value);

      setState(() {
        email = value!;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
              child: Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 150,
                  ),
                  Divider(
                    height: 10,
                  ),
                  Gap(10),
                  Text("Name : $email"),
                  Gap(5),
                  Text("Email : $name"),
                  Gap(100),
                  ElevatedButton(
                      onPressed: () {
                        logOut();
                      },
                      child: Text("Log Out"))
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            popupAddGroup(context);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text("Groupie"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: bodyFunction(context));
  }

  popupAddGroup(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Create a group"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: createGroup,
                decoration: InputDecoration(
                    labelText: "Group Name",
                    prefixIcon: Icon(Icons.group_add_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {},
                child: Text("Create"))
          ],
        );
      },
    );
  }

  noGroup(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              popupAddGroup(context);
            },
            child: Icon(
              Icons.add_circle,
              size: 75,
              color: Colors.grey[700],
            ),
          ),
          Gap(20),
          const Text(
            "you've not joined any group, tap on the add icon to create a group",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  bodyFunction(BuildContext context) {
    return StreamBuilder(
      stream: group,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data["groups"].length != 0) {
            return const Text("data");
          } else {
            return noGroup(context);
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.indigo),
          );
        }
      },
    );
  }

  logOut() async {
    await authservice.logOut().then((value) async {
      if (value == true) {
        await Helper().addName("");
        await Helper().addEMAIl("");
        await Helper().addStatus(false);
        nextScreenReplacement(context, LogIN());
      } else {
        SnackBar msg = SnackBar(content: Text(value));
        ScaffoldMessenger.of(context).showSnackBar(msg);
      }
    });
  }
}
