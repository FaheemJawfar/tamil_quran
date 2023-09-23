import 'package:flutter/material.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';
import '../models/reciter.dart';

class SettingsProvider extends ChangeNotifier {

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

  double _tamilFontSize = 18;

  double get tamilFontSize =>
      AppPreferences.getDouble('tamilFontSize') ?? _tamilFontSize;

  set tamilFontSize(double value) {
    AppPreferences.setDouble('tamilFontSize', value);
    _tamilFontSize = value;
    notifyListeners();
  }

  double _arabicFontSize = 20;

  double get arabicFontSize =>
      AppPreferences.getDouble('arabicFontSize') ?? _arabicFontSize;

  set arabicFontSize(double value) {
    AppPreferences.setDouble('arabicFontSize', value);
    _arabicFontSize = value;
    notifyListeners();
  }

  String _selectedTranslation = 'mJohn';

  String get selectedTranslation =>
      AppPreferences.getString('selectedTranslation') ?? _selectedTranslation;

  set selectedTranslation(String value) {
    AppPreferences.setString('selectedTranslation', value);
    _selectedTranslation = value;
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
    _tamilFontSize = 18;
    _arabicFontSize = 20;
    _selectedTranslation = 'mJohn';
    _selectedReciter = 'alafasy-pj';
    notifyListeners();
  }
}
