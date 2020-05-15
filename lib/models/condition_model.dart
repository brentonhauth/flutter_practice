import 'package:json_annotation/json_annotation.dart';

part 'condition_model.g.dart';

@JsonSerializable()
class Condition {

  int id;

  @JsonKey(name: 'main')
  String backgroundId; // holds information for background

  String description;

  @JsonKey(name: 'icon')
  String iconId;

  Condition({
    this.id,
    this.backgroundId,
    this.description,
    this.iconId
    });

  
  factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);

}
