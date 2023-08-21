class AnimalPropsVault {
  String name, color, size;

  /// also have impact on combat points
  double weight, toothHeight;

  /// also(somehow) determined by
  /// the type[prey]/[neighbour] or [predator]
  String mood; // eerie music! Ha! Just, a happy squirrel...

  bool hasDangerousTeeth;

  AnimalPropsVault({
    required this.name,
    required this.color,
    required this.weight,
    required this.size,
    required this.toothHeight,
    required this.mood,
  }) : hasDangerousTeeth = toothHeight > 5 {
    /// TODO: implement the other fields initialization from
    ///  props data
  }
}
