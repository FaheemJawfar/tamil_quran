import 'package:flutter/material.dart';
import '../app_config/color_config.dart';
import '../read_quran/quran_helper.dart';
import '../utils/data_parser.dart';
import '../utils/shared_preferences.dart';
import '../read_quran/quran_sura.dart';
import '../read_quran/quran_aya.dart';
import '../quran_audio/reciter.dart';

class QuranProvider extends ChangeNotifier {

  bool _isDarkMode = false;
  bool get isDarkMode => AppPreferences.getBool('isDarkMode') ?? _isDarkMode;

  set isDarkMode(bool value) {
    AppPreferences.setBool('isDarkMode', value);
    _isDarkMode = value;
    notifyListeners();
  }

  ThemeData get quranTheme =>
      isDarkMode ? ColorConfig.quranDarkTheme : ColorConfig.quranLightTheme;

  String _selectedTranslation = 'john_trust';

  Map<String, String> translations = {
    'john_trust': 'முஹம்மது ஜான் டிரஸ்ட் (John Trust)',
    'pj': 'P. ஜெய்னுல் ஆப்தீன்',
    'king_fahd': 'மன்னர் ஃபஹத் வளாகம் - சவூதி',
    'ift': 'இஸ்லாமிய நிறுவனம் டிரஸ்ட் (IFT)',
    'abdul_hameed': 'அப்துல் ஹமீது பாகவி',
  };

  List<String> languageFontsList = const [
    'MUktaMalar',
    'HindMadurai',
    'NotoSansTamil',
    'MeeraInimai'
  ];

  List<String> arabicFontsList = const [
    'AlQalam',
    'PDMS_Saleem',
    'Arabic',
    'MeezanUni',
    'Uthmani',
    'UthmanicScript'
  ];

  String get selectedTranslation =>
      AppPreferences.getString('selectedTranslation') ?? _selectedTranslation;

  set selectedTranslation(String value) {
    AppPreferences.setString('selectedTranslation', value);
    _selectedTranslation = value;
    loadTranslation();
    notifyListeners();
  }

  String get selectedTranslationName => translations[selectedTranslation] ?? '';

  List<QuranSura> _allSurasTamil = [];

  get allSurasTamil => _allSurasTamil;

  List<QuranSura> _allSurasArabic = [];

  get allSurasArabic => _allSurasArabic;

  loadTranslation() async {
    _allSurasTamil = await DataParser.loadXmlFromAssets(
        selectedTranslation);
    notifyListeners();
  }

  loadQuranArabic() async {
    _allSurasArabic =
        await DataParser.loadXmlFromAssets('quran');
    notifyListeners();
  }

  int _selectedSuraNumber = 0;

  int get selectedSuraNumber => _selectedSuraNumber;

  set selectedSuraNumber(int value) {
    _selectedSuraNumber = value;
    notifyListeners();
  }

  QuranAya get bismillahArabic {
    QuranAya bismillah = QuranAya(
        suraIndex: 0, ayaIndex: 0, text: _allSurasArabic[0].listOfAyas[0].text, ayaNumberList: '0');
    return bismillah;
  }

  QuranAya get bismillahTranslation {
    QuranAya bismillah = QuranAya(
        suraIndex: 0, ayaIndex: 0, text: _allSurasTamil[0].listOfAyas[0].text, ayaNumberList: '0');
    return bismillah;
  }


  bool get isPJMode => selectedTranslation == 'pj';

  List<QuranAya> get selectedSuraTranslation {
    List<QuranAya> content = [];
    if (_selectedSuraNumber != 1 && _selectedSuraNumber != 9 ) {
      content.add(bismillahTranslation);
    }
    content.addAll(_allSurasTamil[_selectedSuraNumber - 1].listOfAyas);
    return content;
  }

  List<QuranAya> get selectedSuraArabic {
    List<QuranAya> content = [];
    if (_selectedSuraNumber != 1 && _selectedSuraNumber != 9) {
      content.add(bismillahArabic);
    }
    content.addAll(_allSurasArabic[_selectedSuraNumber - 1].listOfAyas);
    return content;
  }

  List<QuranAya> get selectedSuraArabicForArabicOnlyScreen {
    List<QuranAya> content = [];

    content.addAll(_allSurasArabic[_selectedSuraNumber - 1].listOfAyas);
    return content;
  }

  QuranAya filterOneAyaArabic(int sura, int aya) {
    return _allSurasArabic[sura - 1].listOfAyas[aya - 1];
  }

  QuranAya filterOneAyaTranslation(int sura, int aya) {
    return _allSurasTamil[sura - 1].listOfAyas[aya - 1];
  }


  TextSpan getArabicAyaListFromTranslation(QuranAya quranAya, double desiredArabicFontSize) {
      List<int> intList = quranAya.ayaNumberList
          .split(',')
          .map((str) => int.parse(str))
          .toList();

      List<InlineSpan> spans = [];

      for (int ayaNumber in intList) {
        spans.add(
          TextSpan(
            text: filterOneAyaArabic(quranAya.suraIndex, ayaNumber).text,
            style: TextStyle(
              fontSize: desiredArabicFontSize,
              fontFamily: arabicFont,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        );
        spans.add(
          TextSpan(
            text: '${QuranHelper.getVerseEndSymbol(ayaNumber)} ',
            style: TextStyle(
              fontSize: 18,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        );
      }

      return TextSpan(children: spans);
  }


  String _tamilFont = 'MUktaMalar';

  String get tamilFont => AppPreferences.getString('tamilFont') ?? _tamilFont;

  set tamilFont(String value) {
    AppPreferences.setString('tamilFont', value);
    _tamilFont = value;
    notifyListeners();
  }

  String _arabicFont = 'AlQalam';

  String get arabicFont =>
      AppPreferences.getString('arabicFont') ?? _arabicFont;

  set arabicFont(String value) {
    AppPreferences.setString('arabicFont', value);
    _arabicFont = value;
    notifyListeners();
  }

  double _tamilFontSize = 19;

  double get tamilFontSize =>
      AppPreferences.getDouble('tamilFontSize') ?? _tamilFontSize;

  set tamilFontSize(double value) {
    AppPreferences.setDouble('tamilFontSize', value);
    _tamilFontSize = value;
    notifyListeners();
  }

  double _arabicFontSize = 23;

  double get arabicFontSize =>
      AppPreferences.getDouble('arabicFontSize') ?? _arabicFontSize;

  set arabicFontSize(double value) {
    AppPreferences.setDouble('arabicFontSize', value);
    _arabicFontSize = value;
    notifyListeners();
  }

  String _selectedReciter = 'alafasy-pj';

  String get selectedReciter =>
      AppPreferences.getString('selectedReciter') ?? _selectedReciter;

  set selectedReciter(String value) {
    AppPreferences.setString('selectedReciter', value);
    _selectedReciter = value;
    notifyListeners();
  }

  List<Reciter> get allReciters {
    return Reciter.recitersJsonList
        .map((json) => Reciter.fromJson(json))
        .toList();
  }

  Reciter get selectedReciterDetails {
    return allReciters
        .firstWhere((reciter) => reciter.identifier == selectedReciter);
  }

  void clearSettings() {
    AppPreferences.setString('tamilFont', 'MUktaMalar');
    _tamilFont = 'MUktaMalar';
    AppPreferences.setString('arabicFont', 'AlQalam');
    _arabicFont = 'AlQalam';
    AppPreferences.setDouble('tamilFontSize', 19);
    _tamilFontSize = 19;
    AppPreferences.setDouble('arabicFontSize', 23);
    _arabicFontSize = 23;
    AppPreferences.setString('selectedTranslation', 'john_trust');
    _selectedTranslation = 'john_trust';
    AppPreferences.setString('selectedReciter', 'alafasy-pj');
    _selectedReciter = 'alafasy-pj';
    AppPreferences.setBool('isDarkMode', false);
    _isDarkMode = false;

    notifyListeners();
  }
}
