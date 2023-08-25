/**
 * A place where the player [encounters]
 * a [nemesis] or finds a [discovery]
 * or just a [friendly_citizen]
 */
abstract class SpecialPoint {
  /// special name for that point
  /// Tasks and Talons for a warzone
  String eventSpecialName;

  SpecialPoint({required this.eventSpecialName});
}
