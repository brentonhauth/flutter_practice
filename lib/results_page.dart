import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bmi_form.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage();

  @override
  Widget build(BuildContext context) {

    return Consumer<BmiData>(
      builder: (context, bmiData, child) {
        var weightCategory = bmiData.getOverOrUnderWeight();
        var bmi = bmiData.calculate();

        return  Scaffold(
          appBar: new AppBar(
            title: Text('BMI'),
            backgroundColor: Color.fromRGBO(255, 105, 180, 1),
          ),

          body: Center(
            child: new Column(
              children: <Widget>[

                Text(
                  'Your BMI is ${bmi.toStringAsFixed(3)}',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue
                  ),
                ),

                Text(
                  'You are $weightCategory',
                  style: TextStyle(
                    fontSize: 25,
                    color: weightCategory != "normal" ? Colors.red : Colors.blue
                  ),
                )

              ],
            )
          )
        );
      }
    );
  }
}