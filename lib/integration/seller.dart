import 'dart:convert';
import 'dart:ffi';

import "package:http/http.dart" as http;

// enter the url here
String host = "http://localhost:2700";

Future<String> signUpShopkeeper(
    String name_,
    String shopName_,
    String address_,
    int mobile_,
    String licence_,
    String email_,
    String password_,
    String cPassword_,
    String latitude_,
    String longitude_,
    String placeId_) async {
  try {
    final body = {
      "name": name_,
      "shopName": shopName_,
      "address": address_,
      "mobile": mobile_,
      "email": email_,
      "licence": licence_,
      "password": password_,
      "cpassword": cPassword_,
      "lat": latitude_,
      "long": longitude_,
      "placeId": placeId_
    };
    Map<String, String> header = {'Content-Type': "application/json"};

    var res = await http.post(Uri.parse("$host/Signup"),
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

Future<String> signInShopkeeper(String email_, String password_) async {
  try {
    final body = {
      "email": email_,
      "password": password_,
    };
    Map<String, String> header = {'Content-Type': "application/json"};

    var res = await http.post(Uri.parse("$host/login"),
        headers: header, body: jsonEncode(body));

    switch (res.statusCode) {
      case 200:
        return jsonDecode(res.body)["tokens"][0]["token"];
    }
    return res.statusCode.toString();
  } catch (e) {
    print(e.toString());
    return e.toString();
  }
}

Future<String> addMedicine(String token_, String name_, String expiry_,
    int quantity_, int cost_) async {
  try {
    final header = {"Authorization": token_};
    final body = {
      "name": name_,
      "expiry": expiry_,
      "Quantity": quantity_,
      "Cost": cost_
    };

    var res = await http.post(Uri.parse("$host/AddMed"),
        headers: header, body: jsonEncode(body));

    switch (res.statusCode) {
      case 200:
        return "sucess";
    }
    return res.statusCode.toString();
  } catch (e) {
    return e.toString();
  }
}
