import 'package:awashyak_v1/screens/login/logtin_with_phone_number.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../screens/shopkeeper/homepageShop.dart';
import 'Roundbutton.dart';
import '../../screens/login/otp.dart';
import 'verify_code.dart';

import '../../screens/homepage.dart';

import '../../constants.dart';
import '../../integration/user.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController namecontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController cpasswordcontroller = TextEditingController();

  final phoneNumberController=TextEditingController();

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
      bool loading = false;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.1,
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
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: namecontroller,
                  keyboardType: TextInputType.text,
                  onChanged: (value) => {},
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: secondryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: primaryColor, width: 3.0),
                    ),
                    hintText: "Name",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
              ),
             
              
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.text,
                  onChanged: (value) => {},
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: secondryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: primaryColor, width: 3.0),
                    ),
                    hintText: "Email Id",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  controller: passwordcontroller,
                  keyboardType: TextInputType.text,
                  onChanged: (value) => {},
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: secondryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: primaryColor, width: 3.0),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  controller: cpasswordcontroller,
                  keyboardType: TextInputType.text,
                  onChanged: (value) => {},
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: secondryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: primaryColor, width: 3.0),
                    ),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
                          ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextFormField(
                  controller:phoneNumberController,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => {},
                  decoration: const InputDecoration(
                    // suffixIcon: TextButton(onPressed: ()=>LoginWithPhoneNumber()
                    // , child: Text("Send Otp")),
                    filled: true,
                    fillColor: secondryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: primaryColor, width: 3.0),
                    ),
                    hintText: "Mobile +91 xxxxxxxxxx",
                    hintStyle: TextStyle(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              SizedBox(height: height*0.01,),
          
              InkWell(
                onTap: () {

                  setState(() {
                loading = true;
              });
              auth.verifyPhoneNumber(
                phoneNumber: phoneNumberController.text,
                  verificationCompleted: (_){
                  setState(() {
                    loading=true;
                  });


                  },
                  verificationFailed: (e){
                   setState(() {
                   loading=false;
                  });
                  //utils().toastMessage(e.toString());
                  },
                  codeSent: (String verificationId , int? token){
                    

                  Navigator.push((context), MaterialPageRoute(builder: (context)=>VerifyCodeScreenState(verificationId: verificationId,)));
                   setState(() {
                    loading=false;
                  });
                  },
                  codeAutoRetrievalTimeout: (e){
                    //utils().toastMessage(e.toString());
                    setState(() {
                      loading=false;
                    });
                  });
                
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26,
                  ),
                  height: height * 0.05,
                  width: width * 0.6,
                  //color: Colors.black26,
                  child: const Center(
                      child: Text(
                    "Send OTP",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () async {
                  
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Text(
                    "Back to Main Menu",
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
