class SuraModel {
  final int suraNumber;
  final String tamilName;
  final String? tamilMeaning;
  final String arabicName;
  final int verseCount;
  bool isPlaying;

  SuraModel({
    required this.suraNumber,
    required this.tamilName,
    this.tamilMeaning,
    required this.arabicName,
    required this.verseCount,
    this.isPlaying = false,
  });
}
