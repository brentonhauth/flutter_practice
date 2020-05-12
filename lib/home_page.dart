import 'package:flutter/material.dart';
import 'bmi_form.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('BMI'),
        backgroundColor: Color.fromRGBO(255, 105, 180, 1),
      ),
      body: new ListView(
        // padding: EdgeInsets.all(20),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Image.asset(
              'assets/bmi.png',
              fit: BoxFit.fitHeight,
              height: 250,
            ),
          ),

          BmiForm()
        ]
      )
    );
  }
}
