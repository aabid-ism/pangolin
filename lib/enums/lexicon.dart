enum Lexicon {
  CSW21(name: "CSW21"),
  NWL20(name: "NWL20");

  const Lexicon({
    required this.name,
  });

  final String name;

  String get lexiconString => name;
}
