// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsap/screens/Homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Color(0xFF075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF075E54),
        ),
      ),
      home: Homescreen(),
    );
  }
}
