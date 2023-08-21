import 'dart:math';

import 'package:narrated_world/src/models/animal.dart';
import 'package:narrated_world/src/player.dart';

class Combat {
  Player player;
  Animal assailant;

  late String battleName;

  var weoponDesribers = [
    'sword',
    'fencing',
    'cutting',
  ];
  late int randomIndex;
  late String randomDescriber;

  Combat({required this.player, required this.assailant}) {
    randomIndex = Random.secure().nextInt(weoponDesribers.length);
    battleName =
        (assailant.weapon?.name ?? '') + '&' + weoponDesribers[randomIndex];
  }
}
