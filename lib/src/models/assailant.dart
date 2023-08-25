import 'package:narrated_world/src/models/animal.dart';

import '../animal_weapon.dart';

class Assailant extends Animal {
  @override
  String name;

  @override
  String mood;

  @override
  late int health = super.health;

  @override
  double weight;

  @override
  double toothHeight;

  Assailant({
    required this.name,
    required this.weight,
    required this.toothHeight,
    required this.mood,
    List<Weapon>? weapons,
  }) : super(
          name: name,
          weight: weight,
          toothHeight: toothHeight,
          mood: mood,
          weapons: weapons,
        ) {
    if (weapons == null || weapons.isEmpty)
      throw Exception(
        'Assailant\'s weapons  cannot be empty, they need a weapon to fight',
      );
  }
}
