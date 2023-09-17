class SuraDetails {
  final int suraNumber;
  final String tamilName;
  final String? tamilMeaning;
  final String arabicName;
  final int verseCount;

  SuraDetails({
    required this.suraNumber,
    required this.tamilName,
    this.tamilMeaning,
    required this.arabicName,
    required this.verseCount,
  });
}
