import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/city_selector.dart';
import '../blocs/home_body.dart';
import '../blocs/models/weather_data.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new ChangeNotifierProvider<WeatherData>(
      create: (context) => defaultWeatherData(),
      child: Scaffold(
        appBar: new AppBar(
          title: Text('Weather App', textAlign: TextAlign.center),
          backgroundColor: Colors.green,
          actions: <Widget>[CitySelector()],
        ),
        body: HomeBody()
      ),
    );
  }
}





// ListView(
//           children: <Widget>[
//             Container(
//               child: Image.asset(
//                 'assets/bmi.png',
//                 fit: BoxFit.fitHeight,
//                 height: 250,
//               ),
//               padding: EdgeInsets.all(20),
//             ),

//             BmiForm(),
//           ],
//         ),