import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../services/service.dart';
import '../models/weather_model.dart';
import '../models/temperature_model.dart';
import '../models/condition_model.dart';

class WeatherData with ChangeNotifier {

  // Static Constants
  static final Map<String, String> _backgrounds = {
    'drizzle': 'umbrella.png',
    'thunderstorm': 'thunderstorm.jpg',
    'rain': 'rain.jpg',
    'snow': 'snow.jpg',
    'clear': 'clear.jpg',
    'clouds': 'clouds.jpg'
  };
  static final String _defaultCity = 'Vancouver';
  static final String _defaultBackground = 'clear';
  static final String _backgroundLocation = 'assets/images';
  static final String _defaultIcon = '01d';
  static final String _iconLocation = 'https://openweathermap.org/img/wn';


  Weather _model;

  // Getters
  String get city => _model.city;
  String get iconId => _model.condition.iconId;
  String get backgroundId => _model.condition.backgroundId;
  get temp => _model.temperature.temp;
  get minTemp => _model.temperature.minTemp;
  get maxTemp => _model.temperature.maxTemp;

  // Setters
  set city(String c) {
    _model.city = c;
    notifyListeners();
  }

  set iconId(String i) {
    _model.condition.iconId = i;
    notifyListeners();
  }

  set backgroundId(String b) {
    _model.condition.backgroundId = b;
    notifyListeners();
  }

  set temp(dynamic t) {
    _model.temperature.temp = t;
    notifyListeners();
  }

  set minTemp(dynamic t) {
    _model.temperature.minTemp = t;
    notifyListeners();
  }

  set maxTemp(dynamic t) {
    _model.temperature.maxTemp = t;
    notifyListeners();
  }


  WeatherData() {
    _model = Weather(
      city: _defaultCity,
      condition: Condition(),
      temperature: Temperature()
    );

    setWeather(_defaultCity);
  }


  String getBackgroundUrl() {
    String bg = backgroundId != null
      && _backgrounds.containsKey(backgroundId.toLowerCase())
      ? _backgrounds[backgroundId.toLowerCase()]
      : _backgrounds[_defaultBackground];
    
    return '$_backgroundLocation/$bg';
  }

  String getIconUrl() {
    String ico = iconId ?? _defaultIcon;
    return '$_iconLocation/$ico@2x.png';
  }

  void setWeather(String city) async {
    Response res = await Service.getWeather(city);

    Map<String, dynamic> data = json.decode(res.body);

    _model = Weather.fromJson(data);

    notifyListeners();
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
