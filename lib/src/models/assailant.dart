import 'package:narrated_world/src/enums/creature_category.dart';
import 'package:narrated_world/src/models/animal.dart';

import '../animal_weapon.dart';

class Assailant extends Animal {
  String name, mood;
  int health;
  double weight;
  double toothHeight;
  CreatureCategory creatureCategory;

  Assailant({
    required this.name,
    required this.health,
    required this.weight,
    required this.toothHeight,
    required this.mood,
    required this.creatureCategory,
    List<Weapon>? weapons,
  }) : super(
          name: name,
          weight: weight,
          toothHeight: toothHeight,
          mood: mood,
          health: health,
          creatureCategory: creatureCategory,
          weapons: weapons,
        ) {
    if (weapons == null || weapons.isEmpty)
      throw Exception(
        'Assailant\'s weapons  cannot be empty, they need a weapon to fight',
      );
  }
}
