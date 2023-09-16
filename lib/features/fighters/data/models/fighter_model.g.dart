// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fighter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FighterModel _$FighterModelFromJson(Map<String, dynamic> json) => FighterModel(
      objectID: json['objectID'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      rate: json['rate'],
      price: json['price'] as String,
      downloads: json['downloads'] as String,
      imageURL: json['imageURL'] as String,
      universe: json['universe'] as String,
    );

Map<String, dynamic> _$FighterModelToJson(FighterModel instance) =>
    <String, dynamic>{
      'objectID': instance.objectID,
      'name': instance.name,
      'description': instance.description,
      'rate': instance.rate,
      'price': instance.price,
      'downloads': instance.downloads,
      'imageURL': instance.imageURL,
      'universe': instance.universe,
    };
