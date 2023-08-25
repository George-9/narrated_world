/// TODO: CREATE A RANDOM GRAMMAR SENTENCE GENERATOR

/// generates random sentences valid in structure in terms
/// of correct Gramar
class NLGSStructure {
  String noun, verb;
  String structure;
  NLGSStructure(this.noun, this.verb)
      : structure = genStructre(
          noun: noun,
          verb: verb,
        );
}

String genStructre({
  String? noun,
  String? verb,
  String? auxilliary,
  String? adverb,
  String? noun1,
}) {
  if (auxilliary == null || adverb == null || noun1 == null) {
    return '$noun $verb';
  }

  return '$auxilliary $noun $verb $adverb $noun1';
}
