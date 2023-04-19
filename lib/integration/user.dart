import 'dart:convert';
import 'dart:ffi';

import 'package:awashyak_v1/utilities/seller_model.dart';
import "package:http/http.dart" as http;

// enter the url here
String host = "http://localhost:2700";

Future<String> signUpCustomer(String name_, int mobile_, String email_,
    String password_, String cPassword_) async {
  try {
    Map<String, String> header = {'Content-Type': "application/json"};
    final body = {
      "name": name_,
      "mobile": mobile_,
      "email": email_,
      "password": password_,
      "cpassword": cPassword_
    };

    var res = await http.post(Uri.parse("$host/Register"),
        headers: header, body: jsonEncode(body));

    switch (res.statusCode) {
      case 200:
        return jsonDecode(res.body)["tokens"][0]["token"];
    }
    return res.statusCode.toString();
  } catch (e) {
    return e.toString();
  }
}

Future<String> signInCustomer(
  String email_,
  String password_,
) async {
  try {
    Map<String, String> header = {'Content-Type': "application/json"};
    final body = {
      "email": email_,
      "password": password_,
    };
    var res = await http.post(Uri.parse("$host/SignIn"),
        headers: header, body: jsonEncode(body));

    switch (res.statusCode) {
      case 200:
        return jsonDecode(res.body)["tokens"][0]["token"];
    }
    return res.statusCode.toString();
  } catch (e) {
    return "Error";
  }
}

Future<String> getMedicines(String token_, String medicineName_,
    String latitide_, String longitude_) async {
  try {
    Map<String, String> header = {
      'Content-Type': "application/json",
      "Authorization": token_
    };
    final body = {
      "latitude": latitide_,
       "longitude": longitude_
    };
    var res = await http.post(Uri.parse("$host/search/$medicineName_"),
        headers: header, body: jsonEncode(body));

    switch (res.statusCode) {
      case 200:
        return jsonDecode(res.body)["tokens"][0]["token"];
    }
    return res.statusCode.toString();
  } catch (e) {
    return "Error";
  }
}
