import 'package:awashyak_v1/screens/chatGPT.dart';
import 'package:awashyak_v1/screens/individual_medicine_screen.dart';
import 'package:awashyak_v1/screens/medicine_search_page.dart';
import 'package:awashyak_v1/screens/test.dart';
import 'package:awashyak_v1/utilities/test1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Awashyak APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TestPage() ,
    ); 
  }
}

