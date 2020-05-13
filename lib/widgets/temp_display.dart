import 'package:flutter/material.dart';
import '../blocs/weather_data.dart';
import 'package:provider/provider.dart';

class TempDisplay extends StatelessWidget {
  final Color _textColor = Color.fromRGBO(240, 240, 240, 1);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherData>(builder: (context, weatherData, child) {
      return Container(
        // decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, .4)),
        alignment: Alignment.bottomRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Actual Temp: ${weatherData.temp}°C',
              style: TextStyle(
                color: _textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Min Temp: ${weatherData.maxTemp}°C',
              style: TextStyle(
                color: _textColor,
                fontSize: 16,
              ),
            ),
            Text(
              'Max Temp: ${weatherData.minTemp}°C',
              style: TextStyle(
                color: _textColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    });
  }
}
