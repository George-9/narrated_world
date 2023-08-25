import '../data.dart' as data;
import '../models/division.dart';

/// Region holding many sub-regions [divisions]
class Area {
  String id, name, nextAreaId, currentDivisionId;
  List<String> divisionsIds;

  Area({
    required this.id,
    required this.name,
    required this.divisionsIds,
    required this.nextAreaId,
    required this.currentDivisionId,
  });

  Future<Area?> get nextArea async {
    for (Area area in await data.Data.areas) {
      if (area.id == nextAreaId) return area;
    }

    return null;
  }

  Future<Division?> get currentDivision async {
    for (Division division in data.Data.divisions) {
      if (division.id == currentDivisionId) return division;
    }

    return null;
  }
}
