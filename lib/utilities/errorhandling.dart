import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utils{
    String toastMessage(String msg){
    Fluttertoast.showToast(msg: "This is not a valid amount",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
   backgroundColor: Colors.white,
      textColor: Colors.red,
      fontSize: 18.0
    );
    return("Invalid amount");
  }
}
