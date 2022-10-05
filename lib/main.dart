import 'package:flutter/material.dart';
import 'package:nanyang_marche/pages/homePage.dart';
import 'package:nanyang_marche/pages/loginPage.dart';
import 'package:nanyang_marche/pages/loginPage2.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        debugShowCheckedModeBanner: false,
      home: LoginScreen()
    );
  }
}



