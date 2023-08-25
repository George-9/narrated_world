import 'package:narrated_world/src/animal_weapon.dart';
import 'package:narrated_world/src/enums/creature_category.dart';
import 'package:narrated_world/src/models/animal.dart';

class Friend extends Animal {
  Friend({
    required String name,
    required int health,
    required double weight,
    required double toothHeight,
    required String mood,
    required List<Weapon> weapons,
    required CreatureCategory creatureCategory,
  }) : super(
          name: name,
          mood: mood,
          weight: weight,
          toothHeight: toothHeight,
          weapons: weapons,
        );
}
