import 'world_object/world_object.dart';

class NarrationEvent {
  /// real-life like world objects the player encounters on the way
  /// for instance, a [thick] [tall] [shrub]
  ///                   (adverb, adverb(properties))  noun(the object)
  /// The objects properties are picked on the go(randomly)
  List<WorldObject> worldObjects;

  /// the chuncks of text to narrate
  List<String> narrationLogChuncks;

  NarrationEvent(
      {required this.worldObjects, required this.narrationLogChuncks});
}
