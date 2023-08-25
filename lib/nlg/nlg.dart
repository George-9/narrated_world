import 'nlg_sstructure_engine.dart' as nlgSEngine;

///  [Natural_Language_Generator]
/// generates structures of senteces with the provided nlg [Engine]
class NLG {
  final nlgSEngine.NLGSStructure _nlgsStructure;
  String? noun, verb, pronoun, adverb, sentence;

  NLG({
    this.noun,
    this.pronoun,
    this.verb,
    this.adverb,
    this.sentence,
  }) : _nlgsStructure = nlgSEngine.NLGSStructure('it', 'jumped');

  nlgSEngine.NLGSStructure get structure => _nlgsStructure;
}
