abstract class Discovery {
  /// used for checking if the discovery has been used
  /// before.
  /// If used, no discovery is there
  String id;

  String name;

  Discovery({required this.id, required this.name});
}
