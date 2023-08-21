import 'discovery.dart';

class Food extends Discovery {
  String id;
  String name;

  /// the amount of health the player gains when they
  /// consume it from the discovery [store]
  ///
  /// They first have to pick it for the [discovery]
  double health;

  Food({required this.id, required this.name, required this.health})
      : super(id: id, name: name);
}
