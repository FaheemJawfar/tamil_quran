import 'package:flutter/material.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {

  String _tamilFont = 'MUktaMalar';

  String get tamilFont => Preferences.getString('tamilFont') ?? _tamilFont;

  set tamilFont (String value) {
    Preferences.setString('tamilFont', value);
    _tamilFont = value;
    notifyListeners();
  }


  String _arabicFont = 'AlQalam';

  String get arabicFont => Preferences.getString('arabicFont') ?? _arabicFont;

  set arabicFont (String value) {
    Preferences.setString('arabicFont', value);
    _arabicFont = value;
    notifyListeners();
  }


  double _tamilFontSize = 16;

  double get tamilFontSize => Preferences.getDouble('tamilFontSize') ?? _tamilFontSize;

  set tamilFontSize (double value) {
    Preferences.setDouble('tamilFontSize', value);
    _tamilFontSize = value;
    notifyListeners();
  }


  double _arabicFontSize = 18;

  double get arabicFontSize => Preferences.getDouble('arabicFontSize') ?? _arabicFontSize;

  set arabicFontSize (double value) {
    Preferences.setDouble('arabicFontSize', value);
    _arabicFontSize = value;
    notifyListeners();
  }


  String _selectedTranslation = 'mJohn';
  String get selectedTranslation => Preferences.getString('selectedTranslation') ?? _selectedTranslation;

  set selectedTranslation (String value) {
    Preferences.setString('selectedTranslation', value);
    _selectedTranslation = value;
    notifyListeners();
  }

  void clearSettings() {
    _tamilFont = 'MUktaMalar';
    _arabicFont = 'AlQalam';
    _tamilFontSize = 16;
    _arabicFontSize = 18;
    _selectedTranslation = 'mJohn';

    Preferences.clear();
    notifyListeners();
  }




}