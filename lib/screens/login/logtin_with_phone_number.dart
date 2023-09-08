import 'package:awashyak_v1/screens/shopkeeper/homepageShop.dart';
import 'Roundbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../screens/homepage.dart';

import '../../constants.dart';
import '../../integration/user.dart';
import 'package:flutter/material.dart';
import '../../screens/login/otp.dart';

import 'verify_code.dart';


class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  

  bool loading = false;
  final phoneNumberController=TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size;
    double height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: secondryColor,
       appBar: AppBar(backgroundColor:primaryColor,
         title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: height*0.15,),
            
            Text("Please enter Mobile number",style: TextStyle(fontSize: width*0.05,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
            ),
            SizedBox(height: height*0.15,),
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "+91 xxxxxxxxxx"
              ),
            ),
            SizedBox(height: height*0.1,),
            RoundButton(title: 'Login',loading: loading, onTap: (){

              setState(() {
                loading = true;
              });
              auth.verifyPhoneNumber(
                phoneNumber: phoneNumberController.text,
                  verificationCompleted: (_){
                  setState(() {
                    loading=false;
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
            })
          ],

        ),
      ),



    );
  }
}