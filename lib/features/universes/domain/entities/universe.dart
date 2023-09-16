import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Universe {
  final String objectID;
  final String name;
  final String description;

  Universe(
      {required this.objectID, required this.name, required this.description});
}
