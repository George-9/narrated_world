import 'dart:async';
import 'dart:io';
import 'package:narrated_world/src/discovery/food_discovery_event.dart';
import 'package:narrated_world/src/special_points/special_point.dart';
import 'package:narrated_world/src/warzone/warzone.dart';

import 'discovery/discovery.dart';
import 'friend_point.dart';
import 'models/area.dart';

import 'models/assailant.dart';
import 'models/division.dart';

List vowels = [
  'a',
  'e',
  'i',
  'o',
  'u',
];

extension on String {
  bool startsWithAVowel() => vowels.any((vowel) => this.startsWith(vowel));
}

class Player {
  String mood;
  double health;
  int currentPoint;
  Division? current;
  List<Discovery> discoveries;

  Player({
    required this.currentPoint,
    required this.mood,
    required this.health,
    required this.discoveries,
  });

  Future<void> walkArea(Area? currentArea) async {
    if (currentArea == null) return;

    print('_________________');
    print('|');

    print('\t\n${currentArea.name} |\n');

    print('|');
    print('_________________\n');

    Division? current = await currentArea.currentDivision;

    await walkDivision(current);
    currentArea = await currentArea.nextArea;

    await walkArea(currentArea);
  }

  Future<void> walkDivision(Division? current) async {
    if (current != null) {
      await _exploreDivision(current);

      current = await current.next;
      walkDivision(current);
    }
    print('now in ${current?.name}'.toUpperCase());
  }

  Future<void> _exploreDivision(Division division) async {
    for (var specialPoint in await division.specialPoints) {
      exploreSpecialPoint(specialPoint);
    }
  }

  /// "work" on a special point.
  /// choose to pick a discovery or fight an ecountered nemesis
  Future<void> exploreSpecialPoint(Map<int, SpecialPoint> specialPoints) async {
    await for (var sp in Stream.value(specialPoints.values)) {
      for (SpecialPoint specialPoint in sp) {
        switch (specialPoint) {
          case (FoodDiscoveryEvent foodDiscoveryEvent):
            print(
              '\n'
              'collect ${foodDiscoveryEvent.food.name}?'
              ' y (yes) . press enter to skip',
            );

            var ans = stdin.readLineSync();
            if (ans == 'y') discoveries.add(foodDiscoveryEvent.food);
            break;

          case (Warzone warzone):
            String size = warzone.assailant.size;
            String aux = size.startsWithAVowel() ? 'An' : 'A';

            print(
              '_________________________________'
              ' ${warzone.warZoneSpecialName.toUpperCase()} \n'
              '_____'
              'Ecountered '
              ' $aux $size,'
              ' ${warzone.assailant.mood}'
              ' ${warzone.assailant.name} '
              ' with ${warzone.assailant.weapon?.name}'
              '_________________________________'
              '\n',
            );

            fightAssailantUntilWinOrDie(this, warzone.assailant);
            break;

          case (FriendPoint friendPoint):
            print('Met a ${friendPoint.friend.name}');
            break;

          default:
            print("Unable to work on this special point $sp");
            break;
        }
      }
    }
  }

  // void _implyEndOfAreas(Timer? timer) {
  //   timer?.cancel();
  //   print('\ndone walking areas\n');
  //   print('player current point: $currentPoint');

  //   for (var discovery in discoveries) {
  //     print(discovery.name);
  //   }
  // }
}

/// The player faces te assailant until
/// either of the are dead or wins the fight
Future<void> fightAssailantUntilWinOrDie(
  Player player,
  Assailant assailant,
) async {
  if (assailant.health <= 0 || player.health <= 0) {
    var battleResult = player.health > 1 ? "win" : "die";
    print('You $battleResult');
    return;
  }

  print("press 1 to attack, 2 to get attacked");

  String option = stdin.readLineSync() ?? '';
  if (option.isEmpty) {
    print('choose a valid option: 1 or 2');
    await fightAssailantUntilWinOrDie(player, assailant);
  }

  int result = int.parse(option);

  switch (result) {
    case 1:
      assailant.health -= (player.health ~/ 15) + 15;
      print("enemy health: ${assailant.health}");
      break;

    case 2:
      player.health -= (player.health ~/ 15) + assailant.weapon!.damage;
      print("You took damage");
      print("current health: ${player.health}");
      break;

    default:
  }

  await fightAssailantUntilWinOrDie(player, assailant);
}
