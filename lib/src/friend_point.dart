import 'package:narrated_world/src/models/friend.dart';
import 'package:narrated_world/src/player.dart';
import 'package:narrated_world/src/special_points/special_point.dart';

class FriendPoint extends SpecialPoint {
  Friend friend;
  @override
  String eventSpecialName;

  FriendPoint({required this.eventSpecialName, required this.friend})
      : super(eventSpecialName: eventSpecialName);

  void tell(Player player) async {
    print(
      (await (await player.current?.next)!.specialPoints)[0]
          .entries
          .first
          .value,
    );
  }
}
