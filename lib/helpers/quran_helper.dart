class QuranHelper {

  static String getVerseEndSymbol(int verseNumber, {bool arabicNumeral = true}) {
    var arabicNumeric = '';
    var digits = verseNumber.toString().split("").toList();

    if (!arabicNumeral) return '\u06dd${verseNumber.toString()}';

    const Map arabicNumbers = {
      "0": "٠",
      "1": "۱",
      "2": "۲",
      "3": "۳",
      "4": "٤",
      "5": "٥",
      "6": "٦",
      "7": "۷",
      "8": "۸",
      "9": "۹"
    };

    for (var e in digits) {
      arabicNumeric += arabicNumbers[e];
    }

    return '\u06dd$arabicNumeric';
  }



  String getAudioURLBySurah(int surahNumber) {
    return "https://cdn.islamic.network/quran/audio-surah/128/ar.alafasy/$surahNumber.mp3";
  }
}