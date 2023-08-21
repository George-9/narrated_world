import 'package:narrated_world/src/util.dart';

abstract class WorldObject {
  /// helps determine the
  // /// picked properties for the [kind] of object
  // ObjectType _objectType;

  double weight;
  String name;
  String size; // big, tall, short, fat, strong

  WorldObject({required this.name, required this.weight})
      : size = weight < 200
            ? generateRandom(smallWeights)
            : generateRandom(bigWeights);
}

List<String> smallWeights = [
  "light",
  "small",
  'tiny sized',
  "swift",
];

List<String> bigWeights = [
  "big",
  "enormous",
  "great",
  'huge',
];
