import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "4. Weather",
      home: new HomePage(),
      theme: new ThemeData(
        primarySwatch: Colors.red,
        //  visualDensity: VisualDensity.adaptivePlatformDensity
      ),
    );
  }
}
