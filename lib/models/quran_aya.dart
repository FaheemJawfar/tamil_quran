class QuranAya {
  final int index;
  final int suraNumber;
  final int ayaNumber;
  final String arabic;
  final String mJohn;
  final String abdulHameed;
  final String ift;
  final String kingFahd;

  QuranAya(
      {required this.index,
      required this.suraNumber,
      required this.ayaNumber,
      required this.arabic,
      required this.mJohn,
      required this.abdulHameed,
      required this.ift,
      required this.kingFahd});

  factory QuranAya.fromMap(Map<String, dynamic> map) {
    return QuranAya(
        index: map['index'],
        suraNumber: map['sura'],
        ayaNumber: map['aya'],
        arabic: map['arabic'],
        mJohn: map['m_john'],
        abdulHameed: map['abdul_hameed'],
        ift: map['ift'],
        kingFahd: map['king_fahd']);
  }
}
