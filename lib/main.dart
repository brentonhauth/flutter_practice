import 'package:flutter/material.dart';
import 'HomePage.dart';


void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "2. BMI",
      home: new HomePage(),
      theme: new ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
    );
  }

}
