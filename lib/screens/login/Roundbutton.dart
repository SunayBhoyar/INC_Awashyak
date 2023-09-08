import 'package:awashyak_v1/screens/shopkeeper/homepageShop.dart';


import '../../screens/homepage.dart';

import '../../constants.dart';
import '../../integration/user.dart';
import 'package:flutter/material.dart';
import '../../screens/login/otp.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap ;
  final bool loading ;


  const RoundButton({Key? key,
    required this.title,
    required this.onTap,
    this.loading =false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white): Text(title,style: TextStyle(color: Colors.white),),
        ),

      ),
    );
  }
}
