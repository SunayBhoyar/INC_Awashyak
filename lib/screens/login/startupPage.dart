import 'dart:io';

import 'package:awashyak_v1/screens/shopkeeperLogin/startupPageS.dart';
import 'package:awashyak_v1/widgets/toast_notifications.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../screens/login/signin.dart';
import '../../screens/login/signup.dart';

import '../../constants.dart';
import '../../integration/user.dart';
import 'package:flutter/material.dart';

class StartUp extends StatefulWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  State<StartUp> createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> {
  Future<bool> checkConnectivity(BuildContext context) async {
    var connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.none) {
      showNotification("Please Connect to internet");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Network Error'),
            content: Text(
                'Unable to establish a network connection. Please check your internet connection and try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size;
    double height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/assets/login.png"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              Center(
                child: Text(
                  "AWASHYAK",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.05,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Center(
                child: Text(
                  "One stop solution to any EMERGENCY",
                  style: TextStyle(
                    color: primaryColor,
                    // fontWeight: FontWeight.bold,
                    fontSize: height * 0.02,
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                child: Image.asset(
                  "lib/assets/AppLogo.png",
                  height: height * 0.4,
                  width: width * 0.4,
                ),
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Flexible(
                child: InkWell(
                  onTap: () async {
                    if (await checkConnectivity(context)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return SignIn();
                          }),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26,
                    ),
                    height: height * 0.05,
                    width: width * 0.5,
                    //color: Colors.black26,
                    child: const Center(
                        child: Text(
                      "Login",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Flexible(
                child: InkWell(
                  onTap: () async {
                    if (await checkConnectivity(context)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return SignUp();
                          }),
                        ),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26,
                    ),
                    height: height * 0.05,
                    width: width * 0.5,
                    //color: Colors.black26,
                    child: const Center(
                        child: Text(
                      "Register",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: height * 0.03,
                ),
              ),
              InkWell(
                onTap: () async {
                  if (await checkConnectivity(context)) {
                    checkConnectivity(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return const StartUpShopkeeper();
                        }),
                      ),
                    );
                  }
                },
                child: const Center(
                  child: Text(
                    "Login as Shopkeeper",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
