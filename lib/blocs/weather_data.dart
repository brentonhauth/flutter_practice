import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../services/service.dart';
import '../models/weather_model.dart';

class WeatherData with ChangeNotifier {
  static final Map<String, String> _backgrounds = {
    'drizzle': 'umbrella.png',
    'thunderstorm': 'thunderstorm.jpg',
    'rain': 'rain.jpg',
    'snow': 'snow.jpg',
    'clear': 'clear.jpg',
    'clouds': 'clouds.jpg'
  };

  static final String _defaultCity = 'Vancouver';
  static final String _defaultBackground = 'snow.jpg';
  static final String _backgroundLocation = 'assets/images';
  static final String _iconLocation = 'https://openweathermap.org/img/wn';

  String background; // turn into property
  WeatherModel _model;

  get city => _model?.city;
  get icon => _model?.icon;
  get temp => _model?.temp;
  get minTemp => _model?.minTemp;
  get maxTemp => _model?.maxTemp;

  set city(String c) {
    _model?.city = c;
    notifyListeners();
  }

  set icon(String i) {
    _model?.icon = i;
    notifyListeners();
  }

  set temp(dynamic t) {
    _model?.temp = t;
    notifyListeners();
  }

  set minTemp(dynamic t) {
    _model?.minTemp = t;
    notifyListeners();
  }

  set maxTemp(dynamic t) {
    _model?.maxTemp = t;
    notifyListeners();
  }

  WeatherData() {
    _setDefaultValues();
    setWeather("Vancouver");

    // _setDefaultValues();
  }

  void _setDefaultValues() {
    city = _defaultCity;
    background = '$_backgroundLocation/$_defaultBackground';
    icon = '$_iconLocation/01d@2x.png';
    temp = 0.0;
    minTemp = 0.0;
    maxTemp = 0.0;
  }

  void setWeather(String city) async {
    Response res = await Service.getWeather(city);

    city = city;
    var map = json.decode(res.body);

    var weatherObj = (map['weather'] as List)[0];
    var temps = map['main'] as Map;

    _extractWeather(weatherObj);
    _extractTemperatures(temps);

    this.city = city;
    notifyListeners();
  }

  void _extractWeather(Map weatherObj) {
    var weather = (weatherObj['main'] as String).toLowerCase();

    var iconId = weatherObj['icon'] as String;
    icon = '$_iconLocation/$iconId@2x.png';

    var bg = _backgrounds.containsKey(weather)
        ? _backgrounds[weather]
        : _defaultBackground;
    background = '$_backgroundLocation/$bg';
  }

  void _extractTemperatures(Map tempObj) {
    print("OBJECT IS " + tempObj["temp"].toString());
    temp = tempObj['temp'];
    minTemp = tempObj['temp_min'];
    maxTemp = tempObj['temp_max'];
  }
}

// {
//   "weather": [
//     {
//       "id": 800,
//       "main": "Clear",
//       "description": "clear sky",
//       "icon": "01d"
//     }
//   ],
//   "base": "stations",
//   "main": {
//     "temp": 282.55,
//     "feels_like": 281.86,
//     "temp_min": 280.37,
//     "temp_max": 284.26,
//     "pressure": 1023,
//     "humidity": 100
//   }
// }
