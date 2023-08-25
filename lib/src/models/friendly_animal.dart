import 'package:narrated_world/src/animal_weapon.dart';
import 'package:narrated_world/src/enums/creature_category.dart';
import 'package:narrated_world/src/models/animal_object.dart';

/** A neighbour met along the players path, a friendly
 * animal. Might warn aginst an [encountered] [assailant]
 * e.g.
 * "Take care shiny teeth ahead"[Live_Speech] 
 */
final class FriendlyAnimal extends Animal {
  FriendlyAnimal({
    required String name,
    required int health,
    required double weight,
    required double toothHeight,
    required List<Weapon> weapons,
    required String mood,
    required CreatureCategory creatureCategory,
  }) : super(
          name: name,
          health: health,
          weight: weight,
          toothHeight: toothHeight,
          mood: mood,
          weapons: weapons,
          creatureCategory: creatureCategory,
        );

  void talk() {
    print('hello');
  }
}
