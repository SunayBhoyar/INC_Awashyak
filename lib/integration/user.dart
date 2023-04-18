import 'dart:convert';
import 'dart:ffi';

import "package:http/http.dart" as http;

// enter the url here
String host = "http://localhost:2600";

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
    var res =
        await http.post(Uri.parse("$host/SignIn"),headers: header, body: jsonEncode(body));

    switch (res.statusCode) {
      case 200:
        return jsonDecode(res.body)["tokens"][0]["token"];
    }
    return res.statusCode.toString();
  } catch (e) {
    return "Error";
  }
}

// Future<Void> getMedicines(String token_ , String medicineName)async{

// }
