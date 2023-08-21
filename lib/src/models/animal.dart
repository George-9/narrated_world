import 'dart:math';

import 'package:narrated_world/src/animal_weapon.dart';
import 'package:narrated_world/src/enums/creature_category.dart';
import 'package:narrated_world/src/world_object/world_object.dart';

class Animal extends WorldObject {
  @override
  String name;

  /// An animal has more than one "weapon"
  List<Weapon>? weapons;
  Weapon? _weapon;

  CreatureCategory creatureCategory;

  int health;

  /// also have impact on combat points
  double weight, toothHeight;

  /// also(somehow) determined by
  /// the type[prey]/[neighbour] or [predator]
  String mood; // eerie music! Ha! Just, a happy squirrel...

  bool hasDangerousTeeth;

  Animal({
    required this.name,
    required this.weight,
    required this.toothHeight,
    required this.mood,
    required this.creatureCategory,
    required this.health,
    this.weapons,
  })  : hasDangerousTeeth = toothHeight > 5,
        _weapon = (weapons == null || weapons.isEmpty)
            ? null
            : weapons[Random.secure().nextInt(weapons.length)],
        super(name: name, weight: weight) {
    if (health < 0 || health > 100) {
      throw Exception('health must be between 0 and 100');
    }
  }

  /// a randomly picked weapon
  Weapon? get weapon => _weapon;
}
