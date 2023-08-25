import 'nlg_sstructure_engine.dart' as nlg_s_engine;

///  [Natural_Language_Generator]
/// generates structures of senteces with the provided nlg [Engine]
class NLG {
  final nlg_s_engine.NLGSStructure _nlgsStructure;

  String? noun, verb, pronoun, adverb, sentence;

  NLG({
    this.noun,
    this.pronoun,
    this.verb,
    this.adverb,
    this.sentence,
  }) : _nlgsStructure = nlg_s_engine.NLGSStructure('it', 'jumped');

  nlg_s_engine.NLGSStructure get structure => _nlgsStructure;
}
