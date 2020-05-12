import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'bmi_form.dart';


void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new ChangeNotifierProvider<BmiData>(
      create: (context) => new BmiData(),
      child: new MaterialApp(
        title: "3. BMI (with Provider)",
        home: new HomePage(),
        theme: new ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
      ),
    );
  }

}
