import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/weather_data.dart';

class CityTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherData>(
      builder: (context, weatherData, child) {
        return Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            weatherData.city,
            style: TextStyle(
              color: Color.fromRGBO(240, 240, 240, 1),
              fontSize: 36,
              fontWeight: FontWeight.bold,
            )
          ),
        );
      },
    );
  }
}
