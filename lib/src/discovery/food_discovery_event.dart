import 'package:narrated_world/src/discovery/food.dart';
import 'package:narrated_world/src/special_points/special_point.dart';

class FoodDiscoveryEvent extends SpecialPoint {
  String foodFindCoolName;
  Food food;

  FoodDiscoveryEvent({required this.foodFindCoolName, required this.food})
      : super(eventSpecialName: foodFindCoolName);
}
