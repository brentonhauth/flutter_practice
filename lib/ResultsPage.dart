import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final double bmi;
  final String weightCategory;

  ResultsPage({this.bmi, this.weightCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('BMI'),
          backgroundColor: Color.fromRGBO(255, 105, 180, 1),
        ),
        body: Center(
            child: new Column(
          children: <Widget>[
            Text(
              'Your BMI is ${bmi.toStringAsFixed(3)}',
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
            Text(
              'You are $weightCategory',
              style: TextStyle(
                  fontSize: 25,
                  color: weightCategory != "normal" ? Colors.red : Colors.blue),
            )
          ],
        )));
  }
}
