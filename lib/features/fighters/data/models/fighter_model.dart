import 'package:json_annotation/json_annotation.dart';
import 'package:smash_fighters_reloaded/features/fighters/domain/entities/fighter.dart';
part 'fighter_model.g.dart';

@JsonSerializable()
class FighterModel {
  final String objectID;
  final String name;
  final String description;
  final dynamic rate;
  final String price;
  final String downloads;
  final String imageURL;
  final String universe;

  FighterModel(
      {required this.objectID,
      required this.name,
      required this.description,
      required this.rate,
      required this.price,
      required this.downloads,
      required this.imageURL,
      required this.universe});

  factory FighterModel.fromJson(Map<String, dynamic> json) =>
      _$FighterModelFromJson(json);
  Map<String, dynamic> toJson() => _$FighterModelToJson(this);

  Fighter get toFighter => Fighter(
      objectID: objectID,
      name: name,
      description: description,
      rate: rate,
      price: price,
      downloads: downloads,
      imageURL: imageURL,
      universe: universe);
}
