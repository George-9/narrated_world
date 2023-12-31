import 'dart:async';
import 'dart:io';
import 'package:narrated_world/src/discovery/food_discovery_event.dart';
import 'package:narrated_world/src/friend_point.dart';
import 'package:narrated_world/src/special_points/special_point.dart';
import 'package:narrated_world/src/warzone/warzone.dart';

import 'discovery/discovery.dart';
import 'models/area.dart';

import 'models/division.dart';

List vowels = [
  'a',
  'e',
  'i',
  'o',
  'u',
];

extension on String {
  bool get startsWithAVowel => vowels.any((vowel) => this.startsWith(vowel));
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

  Future<void> walkArea(Area? currentArea, List<Area> areas) async {
    Duration duration = Duration(milliseconds: 400);

    Timer.periodic(duration, (Timer? timer) async {
      if (currentArea == null) {
        _implyEndOfAreas(timer);
        return;
      }

      print('_________________');
      print('|');

      print('\t\n${currentArea?.name} |\n');

      print('|');
      print('_________________\n');

      Division? current = await currentArea?.currentDivision;

      while (current != null) {
        print('now in ${current.name}'.toUpperCase());

        await _exploreDivision(current);

        current = await current.next;
      }

      currentArea = await currentArea?.nextArea;
    });
  }

  Future<void> _exploreDivision(Division division) async {
    for (var specialPoint in await division.specialPoints) {
      exploreSpecialPoint(specialPoint);
    }
  }

  /// "work" on a special point.
  /// choose to pick a discovery or fight an ecountered nemesis
  Future<void> exploreSpecialPoint(Map<int, SpecialPoint> specialPoints) async {
    await for (var sp in await Stream.value(await specialPoints.values)) {
      for (SpecialPoint specialPoint in sp) {
        switch (specialPoint) {
          case (FoodDiscoveryEvent foodDiscoveryEvent):
            print(
              '\n'
              'collect ${foodDiscoveryEvent.food.name}?'
              ' y (yes) . press enter to skip',
            );

            var ans = await stdin.readLineSync();
            if (ans == 'y') discoveries.add(foodDiscoveryEvent.food);
            break;

          case (Warzone warzone):
            String size = warzone.assailant.size;
            String aux = size.startsWithAVowel ? 'An' : 'A';

            print(
              '_________________________________'
              ' ${warzone.warZoneSpecialName.toUpperCase()} \n'
              '_____'
              'Ecountered a'
              ' ${warzone.assailant.creatureCategory.name}.'
              ' $aux ${size},'
              ' ${warzone.assailant.mood}'
              ' ${warzone.assailant.name} '
              ' with ${warzone.assailant.weapon?.name}'
              '_________________________________'
              '\n',
            );
            break;

          case (FriendPoint friendPoint):
            print('Met a ${friendPoint.friend.name}');
            break;

          default:
            print("Unable to work on this special point ${sp}");
            break;
        }
      }
    }
  }

  void _implyEndOfAreas(Timer? timer) {
    timer?.cancel();
    print('\ndone walking areas\n');
    print('player current point: $currentPoint');

    for (var discovery in discoveries) {
      print(discovery.name);
    }
  }
}
