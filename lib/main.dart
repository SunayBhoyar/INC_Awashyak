import '../screens/chatGPT.dart';
import '../screens/individual_medicine_screen.dart';
import 'screens/login/startupPage.dart';
import '../screens/medicine_search_page.dart';
import '../screens/shopkeeper/homepageShop.dart';
import '../utilities/test1.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      // home: TestPage() ,
      // home: HomePageShop(),
      home: StartUp(),

    ); 
  }
}

