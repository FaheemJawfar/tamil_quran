class TranslationModel {
  final int index;
  final int sura;
  final int aya;
  final String arabic;
  final String mJohn;
  final String abdulHameed;
  final String ift;
  final String kingFahd;

  TranslationModel(
      {required this.index,
      required this.sura,
      required this.aya,
      required this.arabic,
      required this.mJohn,
      required this.abdulHameed,
      required this.ift,
      required this.kingFahd});

  factory TranslationModel.fromMap(Map<String, dynamic> map) {
    return TranslationModel(
        index: map['index'],
        sura: map['sura'],
        aya: map['aya'],
        arabic: map['arabic'],
        mJohn: map['m_john'],
        abdulHameed: map['abdul_hameed'],
        ift: map['ift'],
        kingFahd: map['king_fahd']);
  }
}
