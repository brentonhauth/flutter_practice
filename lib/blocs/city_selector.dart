import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_practice/blocs/models/weather_data.dart';


List<String> _cities = <String>[
  'Vancouver',
  'Toronto',
  'Montreal',
  'Halifax'
];


class CitySelector extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Consumer<WeatherData>(
      builder: (context, weatherData, child) {
        return new DropdownButton<String>(
          value: weatherData.city,
          items: _cities.map((city) {
            return new DropdownMenuItem<String>(
              value: city,
              child: new Text(city)
            );
          }).toList(),
          onChanged: weatherData.setWeather,
        );
      },
    );
  }
}
