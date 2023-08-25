import 'package:narrated_world/src/data.dart';

import '../special_points/special_point.dart';

class Division {
  String id;
  String name;

  /// checks for the end of the division
  int distance;

  String nextDivId;
  Future<List<Map<int, SpecialPoint>>> specialPoints;

  Division({
    required this.id,
    required this.name,
    required this.distance,
    required this.specialPoints,
    required this.nextDivId,
  });

  Future<Division?> get next async {
    for (var division in Data.divisions) {
      if (division.id == nextDivId) return division;
    }

    return null;
  }
}
