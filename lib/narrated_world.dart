import 'src/data.dart' as GameData;
import 'src/player.dart';

/// TODO:(George) add daily challenges
/// for instance, challenge player to complete a level without using any discovery
/// and award them points
///
/// Also implement [undo] and [redo]

// List vowels = ['a', 'e', 'i', 'o', 'u'];

// extension on String {
//   bool startsWithAVowel() => vowels.any((vowel) => this.startsWith(vowel));
// }
// print('object'.startsWithAVowel());

void main() async {
  Player player =
      Player(currentPoint: 1, mood: 'happy', health: 100, discoveries: []);

  var areas = GameData.Data.areas;
  await player.walkArea((await areas)[0], await areas);
}
