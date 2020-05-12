import 'package:flutter/material.dart';
import 'results_page.dart';


class _BmiData {
  double age = 0;
  double height = 0; // in
  double weight = 0; // lb

  double calculate() {
    var heightSquared = height * height;
    return 703 * weight / heightSquared;
  }

  String getOverOrUnderWeight() {
    var bmi = calculate();
    if (bmi <= 18.5) {
      return "underweight";
    } else if (bmi < 25) {
      return "normal";
    } else if (bmi < 30) {
      return "overweight";
    } else {
      return "obese";
    }
  }

}

class BmiForm extends StatefulWidget {
  @override
  _BmiFormState createState() => _BmiFormState();
}

class _BmiFormState extends State<BmiForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _BmiData bmiData = new _BmiData();

  double _validateInput(String val) {
    if (val.isEmpty) {
      throw new Error();
    }

    double d = double.parse(val);

    if (d <= 0) {
      throw new Error();
    }

    return d;
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: this._formKey,
      child: new Column(
        children: <Widget>[
          // Age Field
          TextFormField(
            decoration: InputDecoration(icon: Icon(Icons.person), labelText: 'Age'),
            keyboardType: TextInputType.numberWithOptions(decimal: false, signed: false),
            validator: (String val) {
              try {
                var a = _validateInput(val);
                bmiData.age = a;
              } catch (e) {
                return 'Please enter a valid age';
              }
              return null;
            },
          ),

          // Height Field
          TextFormField(
            decoration: InputDecoration(icon: Icon(Icons.insert_chart), labelText: 'Height in ft'),
            keyboardType: TextInputType.numberWithOptions(signed: true),
            validator: (String val) {
              try {
                var h = _validateInput(val) * 12; // converts height to inches
                bmiData.height = h;
              } catch (e) {
                return 'Please enter height in ft';
              }
              return null;
            },
          ),

          // Weight Field
          TextFormField(
            decoration: InputDecoration(icon: Icon(Icons.menu), labelText: 'Weight in lb'),
            keyboardType: TextInputType.numberWithOptions(signed: false),
            validator: (String val) {
              try {
                var w = _validateInput(val);
                bmiData.weight = w;
              } catch (e) {
                return 'Please enter weight in lbs';
              }
              return null;
            },
          ),


          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmi: bmiData.calculate(),
                      weightCategory: bmiData.getOverOrUnderWeight(),
                    )
                  )
                );


                // ... it is valid
                // calc bmi, change screens
              }
            },
            child: Text('Calculate'),
            color: Color.fromRGBO(255, 105, 180, 1),
            textColor: Color.fromRGBO(255, 255, 255, 1),
          ),

        ],
      ),
    );
  }
}
