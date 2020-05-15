// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temperature _$TemperatureFromJson(Map<String, dynamic> json) {
  return Temperature(
    temp: json['temp'],
    feelsLike: json['feels_like'],
    minTemp: json['temp_min'],
    maxTemp: json['temp_max'],
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
  );
}

Map<String, dynamic> _$TemperatureToJson(Temperature instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.minTemp,
      'temp_max': instance.maxTemp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
