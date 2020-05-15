import 'package:json_annotation/json_annotation.dart';

part 'temperature_model.g.dart';

@JsonSerializable()
class Temperature {

  dynamic temp;

  @JsonKey(name: 'feels_like')
  dynamic feelsLike;

  @JsonKey(name: 'temp_min')
  dynamic minTemp;

  @JsonKey(name: 'temp_max')
  dynamic maxTemp;

  int pressure;

  int humidity;

  Temperature({
    this.temp,
    this.feelsLike,
    this.minTemp,
    this.maxTemp,
    this.pressure,
    this.humidity
    });

  factory Temperature.fromJson(Map<String, dynamic> json) => _$TemperatureFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureToJson(this);

}