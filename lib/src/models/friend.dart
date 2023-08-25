import 'package:narrated_world/src/animal_weapon.dart';
import 'package:narrated_world/src/models/animal_object.dart';

class Friend extends Animal {
  Friend({
    required String name,
    required int health,
    required double weight,
    required double toothHeight,
    required String mood,
    required List<Weapon> weapons,
  }) : super(
          name: name,
          health: health,
          mood: mood,
          weight: weight,
          toothHeight: toothHeight,
          weapons: weapons,
        );
}
