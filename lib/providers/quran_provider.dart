import 'package:flutter/material.dart';
import '../helpers/data_parser.dart';
import '../helpers/shared_preferences.dart';
import '../models/quran_sura.dart';
import '../models/quran_aya.dart';
import '../models/reciter.dart';

class QuranProvider extends ChangeNotifier {


  String _selectedTranslation = 'm_john';

  Map<String, String> translations = {
    'm_john': 'முஹம்மது ஜான் தமிழாக்கம்',
    'king_fahd': 'மன்னர் ஃபஹத் வளாகம் - சவூதி அரேபியா',
    'ift': 'இஸ்லாமிய நிறுவனம் ட்ரஸ்ட்',
    'abdul_hameed': 'அப்துல் ஹமீது பாகவி',
  };

  String get selectedTranslation =>
      AppPreferences.getString('selectedTranslation') ?? _selectedTranslation;

  set selectedTranslation(String value) {
    AppPreferences.setString('selectedTranslation', value);
    _selectedTranslation = value;
    loadTranslation();
    notifyListeners();
  }

  String get selectedTranslationName => translations[selectedTranslation] ?? '';


  List<QuranSura> _allSurasTranslation = [];

  get allSuras => _allSurasTranslation;

  List<QuranSura> _allSurasArabic = [];

  get allSurasArabic => _allSurasArabic;

  loadTranslation() async {
    _allSurasTranslation = await DataParser.loadXmlFromAssets(
        'assets/quran_db/$selectedTranslation.xml');
    notifyListeners();
  }

  loadQuranArabic() async {
    _allSurasArabic =
    await DataParser.loadXmlFromAssets('assets/quran_db/quran.xml');
    notifyListeners();
  }

  int _selectedSuraNumber = 0;

  int get selectedSuraNumber => _selectedSuraNumber;

  set selectedSuraNumber(int value) {
    _selectedSuraNumber = value;
    notifyListeners();
  }

  QuranAya get bismillahArabic {
    QuranAya bismillah = QuranAya(0, 0, _allSurasArabic[0].listOfAyas[0].text);
    return bismillah;
  }

  QuranAya get bismillahTranslation {
    QuranAya bismillah =
    QuranAya(0, 0, _allSurasTranslation[0].listOfAyas[0].text);
    return bismillah;
  }

  List<QuranAya> get selectedSuraTranslation {
    List<QuranAya> content = [];
    if (_selectedSuraNumber != 1 && _selectedSuraNumber != 9) {
      content.add(bismillahTranslation);
    }
    content.addAll(_allSurasTranslation[_selectedSuraNumber - 1].listOfAyas);
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

  QuranAya filterOneAyaArabic(int sura, int aya) {
    return _allSurasArabic[sura - 1].listOfAyas[aya - 1];
  }

  QuranAya filterOneAyaTranslation(int sura, int aya) {
    return _allSurasTranslation[sura - 1].listOfAyas[aya - 1];
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

  double _arabicFontSize = 22;

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
    AppPreferences.clear();
    _tamilFont = 'MUktaMalar';
    _arabicFont = 'AlQalam';
    _tamilFontSize = 19;
    _arabicFontSize = 22;
    _selectedTranslation = 'm_john';
    _selectedReciter = 'alafasy-pj';
    notifyListeners();
  }

}
