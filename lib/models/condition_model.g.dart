// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Condition _$ConditionFromJson(Map<String, dynamic> json) {
  return Condition(
    id: json['id'] as int,
    backgroundId: json['main'] as String,
    description: json['description'] as String,
    iconId: json['icon'] as String,
  );
}

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.backgroundId,
      'description': instance.description,
      'icon': instance.iconId,
    };
