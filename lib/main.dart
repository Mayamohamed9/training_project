import 'package:flutter/material.dart';
import 'package:training_project/modules/loginscreen.dart';
import 'package:training_project/modules/profilescreen.dart';
import 'package:training_project/modules/signupscreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginScreen(),

    );
  }
}
