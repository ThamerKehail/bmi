import 'package:bmi/result.dart';
import 'package:flutter/cupertino(1).dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline2: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),
          headline1: const TextStyle(fontSize: 45, fontWeight: FontWeight.w800,color: Colors.white),
          bodyText1: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)
        ),

      ),
      home:   MyHomePage(),
    );
  }
}


