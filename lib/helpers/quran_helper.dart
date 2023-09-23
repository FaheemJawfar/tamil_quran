import 'package:tamil_quran/models/reciter.dart';

class QuranHelper {
  static String getVerseEndSymbol(int verseNumber,
      {bool arabicNumeral = true}) {
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

  static String getAudioURLBySurah(Reciter reciter, int suraNumber) {
    if (reciter.language == 'ta') {
      return "https://archive.org/download/${reciter.identifier}/sura-$suraNumber.mp3";
    }

    return "https://cdn.islamic.network/quran/audio-surah/128/${reciter.identifier}/$suraNumber.mp3";
  }

  static String getAudioURLByAya(String reciter, int ayaNumber) {
    return "https://cdn.islamic.network/quran/audio-surah/128/$reciter/$ayaNumber.mp3";
  }

  static int getAyaIndex(int suraNumber, int ayaNumber) {
    if (suraNumber < 1 || suraNumber > 114 || ayaNumber < 1) {
      throw ArgumentError('Invalid sura or aya number');
    }

    final List<int> ayaCounts = [
      7,
      286,
      200,
      176,
      120,
      165,
      206,
      75,
      129,
      109,
      123,
      111,
      43,
      52,
      99,
      128,
      111,
      110,
      98,
      135,
      112,
      78,
      118,
      64,
      77,
      227,
      93,
      88,
      69,
      60,
      34,
      30,
      73,
      54,
      45,
      83,
      182,
      88,
      75,
      85,
      54,
      53,
      89,
      59,
      37,
      35,
      38,
      29,
      18,
      45,
      60,
      49,
      62,
      55,
      78,
      96,
      29,
      22,
      24,
      13,
      14,
      11,
      11,
      18,
      12,
      12,
      30,
      52,
      52,
      44,
      28,
      28,
      20,
      56,
      40,
      31,
      50,
      40,
      46,
      42,
      29,
      19,
      36,
      25,
      22,
      17,
      19,
      26,
      30,
      20,
      15,
      21,
      11,
      8,
      8,
      19,
      5,
      8,
      8,
      11,
      11,
      8,
      3,
      9,
      5,
      4,
      7,
      3,
      6,
      3,
      5,
      4,
      5,
      6
    ];

    if (ayaNumber > ayaCounts[suraNumber - 1]) {
      throw ArgumentError('Invalid aya number for this sura');
    }

    int ayaIndex = 0;
    for (int i = 0; i < suraNumber - 1; i++) {
      ayaIndex += ayaCounts[i];
    }

    ayaIndex += ayaNumber;
    return ayaIndex;
  }
}
