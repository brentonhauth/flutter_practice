// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
    city: json['city'] as String,
    icon: json['icon'] as String,
    main: json['main'] as String,
    temp: json['temp'],
    minTemp: json['temp_min'],
    maxTemp: json['temp_max'],
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) => <String, dynamic>{
      'city': instance.city,
      'icon': instance.icon,
      'main': instance.main,
      'temp': instance.temp,
      'temp_min': instance.minTemp,
      'temp_max': instance.maxTemp,
    };
