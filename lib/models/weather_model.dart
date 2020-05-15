import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  String city;
  
  String icon;

  @JsonKey(name: 'main')
  String main; // Replacing 'background' from #4

  dynamic temp;

  @JsonKey(name: 'temp_min')
  dynamic minTemp;

  @JsonKey(name: 'temp_max')
  dynamic maxTemp;

  WeatherModel({this.city, this.icon, this.main, this.temp, this.minTemp, this.maxTemp});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
