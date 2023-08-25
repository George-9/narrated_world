import 'package:narrated_world/src/animal_weapon.dart';
import 'package:narrated_world/src/discovery/food.dart';
import 'package:narrated_world/src/discovery/food_discovery_event.dart';
import 'package:narrated_world/src/friend_point.dart';
import 'package:narrated_world/src/models/assailant.dart';
import 'package:narrated_world/src/models/friend.dart';

import 'package:narrated_world/src/warzone/warzone.dart';

import '../src/models/area.dart';
import './models/division.dart';

class Data {
  static Future<List<Area>> areas = Future.value(
    [
      Area(
        id: 'A1',
        name: 'The old Village',
        currentDivisionId: 'dv1',
        divisionsIds: ['div1', 'div2'],
        nextAreaId: 'A2',
      ),
      Area(
        id: 'A2',
        currentDivisionId: 'dv3',
        name: 'Train terminal . Small city',
        divisionsIds: ['dv1', 'div2', 'div3'],
        nextAreaId: 'A3',
      ),
    ],
  );

  /// TODO:(George) make these points spawn special
  /// points(base on "landmarks"(to be added later)) on the run with randomnized
  /// zones with randomnized dicoveries, food, creatures e.t.c

  static List<Division> get divisions => [
        Division(
          id: 'dv1',
          name: 'The Stores',
          distance: 100,
          specialPoints: Future.value([{}, {}]),
          nextDivId: 'dv2',
        ),
        Division(
          id: 'dv2',
          name: 'The cable plains',
          distance: 40,
          specialPoints: Future.value([{}, {}]),
          nextDivId: 'dv3',
        ),
        Division(
          id: 'dv3',
          name: 'The car plant',
          distance: 30,
          specialPoints: Future.value(
            [
              {
                3: FoodDiscoveryEvent(
                  foodFindCoolName: "",
                  food: Food(id: 'bnn1', name: 'bannana', health: 25),
                ),
              },
              {
                5: Warzone(
                  warZoneSpecialName: 'warzone venom',
                  assailant: Assailant(
                    name: 'Python',
                    mood: 'bitter',
                    health: 100,
                    toothHeight: 10,
                    weight: 700,
                    weapons: [Weapon(name: 'Fangs', damage: 30)],
                  ),
                ),
              }
            ],
          ),
          nextDivId: 'dv4',
        ),
        Division(
          id: 'dv4',
          name: 'The plains',
          distance: 105,
          specialPoints: Future.value(
            [
              {
                3: Warzone(
                  warZoneSpecialName: 'warzone  @10& 2 you',
                  assailant: Assailant(
                    name: 'Grizzly',
                    health: 100,
                    mood: 'high spirited',
                    toothHeight: 10,
                    weight: 100,
                    weapons: [
                      Weapon(name: 'claws', damage: 10),
                      Weapon(name: 'Teeth', damage: 40),
                    ],
                  ),
                ),
              },
              {
                3: FriendPoint(
                  eventSpecialName: 'Chubby Cheeks Chummy',
                  friend: Friend(
                    name: 'Mole',
                    health: 100,
                    weight: 100,
                    toothHeight: 10,
                    mood: 'Harvesty',
                    weapons: [
                      Weapon(name: 'teeth', damage: 100),
                    ],
                  ),
                ),
                4: FoodDiscoveryEvent(
                  foodFindCoolName: 'cook seal',
                  food: Food(id: 'flt1', name: 'Fish filette', health: 60.1),
                ),
              },
            ],
          ),
          nextDivId: 'dv5',
        ),
      ];
}
