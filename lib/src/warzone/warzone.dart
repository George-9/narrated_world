import 'package:narrated_world/src/models/assailant.dart';
import 'package:narrated_world/src/models/friendly_animal.dart';
import 'package:narrated_world/src/special_points/special_point.dart';

class Warzone extends SpecialPoint {
  String warZoneSpecialName;
  Assailant assailant;

  Warzone({required this.warZoneSpecialName, required this.assailant})
      : super(eventSpecialName: warZoneSpecialName) {
    if (assailant is FriendlyAnimal) {
      throw Exception("Friend Should Not Attack");
    }
  }
}
