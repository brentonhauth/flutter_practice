import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/weather_data.dart';
import 'temp_display.dart';
import 'city_title.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Consumer<WeatherData>(builder: (context, weatherData, child) {
      return new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(weatherData.getBackgroundUrl()),
            fit: BoxFit.cover,
          ),
        ),
        child: new ListView(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            children: <Widget>[
              CityTitle(),
              Image.network(weatherData.getIconUrl(), scale: .5),
              TempDisplay(),
            ]),
      );
    });
  }
}
