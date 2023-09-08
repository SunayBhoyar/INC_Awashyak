//import 'dart:html';

import '../../screens/homepage.dart';

import 'package:awashyak_v1/integration/seller.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_auth/email_auth.dart';

import '../../constants.dart';
import '../../screens/medical_stores_card.dart';
import '../../utilities/datamodel.dart';
import '../../utilities/errorhandling.dart';
import 'package:flutter/material.dart';


class ottp extends StatefulWidget {
  const ottp({super.key});
  
  @override
  State<ottp> createState() => _ottpState();
 

}

class _ottpState extends State<ottp> {
   
  bool submitvalid=false;
  
  final TextEditingController emailcontroller = TextEditingController();

  final TextEditingController otpcontroller= TextEditingController();
  EmailAuth emailAuth=EmailAuth(sessionName: "otp verification");

  // void initState() async{
  // super.initState();
  // emailAuth =new EmailAuth(sessionName: "sample session");
  //   //emailAuth.config(data);
    



  // }
  void verify(){
    //print (emailAuth.validateOtp(recipientMail: emailcontroller.text, userOtp: otpcontroller.text));
    bool result= emailAuth.validateOtp(recipientMail: emailcontroller.text, userOtp: otpcontroller.text);
    if(result){
       Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return ottp();
                            
                      
                        }),
                      ),
                    );

    }
    else{
      print("invalid otp");
    }
  }
void sendOtp() async{
bool result= await emailAuth.sendOtp(recipientMail: emailcontroller.value.text);
if (result){
  print("otp sent");
 
  
}
else{
  print("otp not sent");
}
}
  
  @override
  Widget build(BuildContext context) {
    double height;
    Size size;
    size = MediaQuery.of(context).size;
    height = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(height: height*0.1,),
        TextField(
          controller: emailcontroller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "enter email for verification",
            suffixIcon: TextButton(
              child:Text("send otp") ,
              onPressed: ()=>sendOtp(),
            ),
          ),
        ),

        SizedBox(height: 40,),
        TextField(
          controller: otpcontroller,
          keyboardType: TextInputType.number,
          obscureText: true,
          decoration: InputDecoration(
            hintText: "enter otp",
            
          ),
        ),
        SizedBox(height: 30,),
        ElevatedButton(onPressed: (){}, child: Text("verify otp"))

      ])

      ,



    );
  }
}