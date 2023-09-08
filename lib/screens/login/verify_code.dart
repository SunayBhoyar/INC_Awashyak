import 'package:awashyak_v1/constants.dart';
import 'package:awashyak_v1/screens/homepage.dart';
import 'package:awashyak_v1/screens/login/logtin_with_phone_number.dart';
import 'package:awashyak_v1/screens/shopkeeperLogin/map.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_final/ui/posts/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_webservice/directions.dart';
import 'Roundbutton.dart';
import 'package:pinput/pinput.dart';

//import '../../utils/utils.dart';
//import '../../widgets/round_button.dart';
class VerifyCodeScreenState extends StatefulWidget {
 final  String verificationId;
 
  const VerifyCodeScreenState({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<VerifyCodeScreenState> createState() => _VerifyCodeScreenStateState();
}

class _VerifyCodeScreenStateState extends State<VerifyCodeScreenState> {

  bool loading = false;
  String? otpCode;
  final verifyCodecontroller = TextEditingController();
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
      appBar: AppBar(
        title: Text("Verification"),
        backgroundColor:primaryColor
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: height*0.02,),
            //Text("OTP has been sent",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),

            SizedBox(height: height*0.05,),
            Text("Enter the verification code",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: height*0.1,),
             //TextFormField(
              Center(
                child: Pinput(
                //controller: verifyCodecontroller,
                keyboardType: TextInputType.number,
                //decoration: InputDecoration(
                    //hintText: "6 digit code"
                    length: 6,
                    showCursor: true,
                    
                    onChanged:(Value){
                      otpCode=Value;
                    },
                    defaultPinTheme: PinTheme(height: height*0.06,width: height*0.06,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: primaryColor)
                    
                    ),
                    textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                    
                    
                    ),
                    onSubmitted: (Value){
                      setState(() {
                        loading=true;
                        otpCode=Value;
                      });
                    },
              
                ),
              ),
            //),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26,
                  ),
                  height: height * 0.05,
                  width: width * 0.6,
              child: ElevatedButton(child:loading?CircularProgressIndicator(color: Colors.white,):Text("Register",
              //selectionColor: Color.fromARGB(255, 255, 255, 255)
              ),
              style:ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                textStyle: TextStyle(fontSize: 25,)
              
            
              ),
              
            //backgroundColor: primaryColor;
                onPressed: () async {
                  
                setState(() {
                
                  loading = true;
                });
            
                
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                   // smsCode: verifyCodecontroller.text.toString()
                   smsCode: otpCode.toString()
                );
            
                try {
                  await auth.signInWithCredential(credential);
                  //String token_ = await LoginWithPhoneNumber(key: ,)
            String token_=await "";
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return HomePageCustomer(
                              token: token_,
                            );
                          }),
                        ),
                      );
                }
            
                catch (e) {
                  setState(() {
                    loading = false;
                  });
                 // utils().toastMessage(e.toString());
                }
              }
              ),
            )
            
          ],

        ),
      ),
      


    );
  }

  //verify otp
  void verifyOtp(BuildContext context, String userOtp){
    final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                 // smsCode: verifyCodecontroller.text.toString()
                 smsCode: userOtp
              );

              try {
                 auth.signInWithCredential(credential);
                //String token_ = await LoginWithPhoneNumber(key: ,)
String token_= "";
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return HomePageCustomer(
                            token: token_,
                          );
                        }),
                      ),
                    );
              }

              catch (e) {
                setState(() {
                  loading = false;
                });
               // utils().toastMessage(e.toString());
              }

  }
}
