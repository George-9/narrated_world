import 'dart:math';

/// generates a random value(string) from a
/// list
String generateRandom(List<String> src) {
  if (src.isEmpty) {
    throw Exception(
      "Cannot genrate a random value from an empty list",
    );
  }

  Random random = Random(10);

  return src[random.nextInt(src.length - 1)];
}
