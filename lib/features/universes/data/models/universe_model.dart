import 'package:json_annotation/json_annotation.dart';
import 'package:smash_fighters_reloaded/features/universes/domain/entities/universe.dart';
part 'universe_model.g.dart';

@JsonSerializable()
class UniverseModel {
  final String objectID;
  final String name;
  final String description;

  UniverseModel(
      {required this.objectID, required this.name, required this.description});

  factory UniverseModel.fromJson(Map<String, dynamic> json) =>
      _$UniverseModelFromJson(json);
  Map<String, dynamic> toJson() => _$UniverseModelToJson(this);

  Universe get toUniverse => Universe(
        objectID: objectID,
        name: name,
        description: description,
      );
}
