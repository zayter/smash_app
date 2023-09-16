// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'universe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniverseModel _$UniverseModelFromJson(Map<String, dynamic> json) =>
    UniverseModel(
      objectID: json['objectID'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$UniverseModelToJson(UniverseModel instance) =>
    <String, dynamic>{
      'objectID': instance.objectID,
      'name': instance.name,
      'description': instance.description,
    };
