import 'package:json_annotation/json_annotation.dart';
import 'condition_model.dart';
import 'temperature_model.dart';

// Had to write custome behavior for 'fromJson'/'toJson'
// part 'weather_model.g.dart';

@JsonSerializable()
class Weather {

  @JsonKey(name: 'name')
  String city = '';

  @JsonKey(name: 'main')
  Temperature temperature = Temperature();

  @JsonKey(name: 'weather')
  Condition condition = Condition();


  Weather({this.city, this.temperature, this.condition});


  factory Weather.fromJson(Map<String, dynamic> json) {

    Condition condition;

    // Grabing the first element of the 'weather' json data
    if (json['weather'] != null) {
      List<dynamic> jsonConditions = json['weather'] as List<dynamic>;
      List<Condition> conditionsList = jsonConditions.map((c) => Condition.fromJson(c)).toList();
      condition = conditionsList[0];
    }

    return Weather(
      city: json['name'] as String,
      temperature: json['main'] == null
          ? null
          : Temperature.fromJson(json['main'] as Map<String, dynamic>),
      condition: condition
    );
    // _$WeatherFromJson(json);
  }


  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': city,
    'main': temperature.toJson(),
    'weather': <dynamic>[condition.toJson()],
};
}
