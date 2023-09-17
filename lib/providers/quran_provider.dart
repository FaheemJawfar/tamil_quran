import 'package:flutter/material.dart';
import 'package:tamil_quran/helpers/db_helper.dart';
import '../models/sura_details.dart';
import '../models/quran_aya.dart';

class QuranProvider extends ChangeNotifier {
  final List<QuranAya> _allVersesOfQuran = [];

  get allVersesOfQuran => _allVersesOfQuran;

  int _selectedSura = 0;

  int get selectedSura => _selectedSura;

  set selectedSura(int value) {
    _selectedSura = value;
    notifyListeners();
  }

  List<QuranAya> get selectedSuraContent {
    List<QuranAya> suraContent = [];
    if (selectedSura != 1 && selectedSura != 9) {
      suraContent.add(_allVersesOfQuran[0]);
    }
    suraContent.addAll(filterOneSura(_selectedSura));
    return suraContent;
  }

  List<QuranAya> filterOneSura(int sura) {
    return _allVersesOfQuran
        .where((model) => model.suraNumber == sura)
        .toList();
  }

  QuranAya filterOneVerse(int sura, int aya) {
    return _allVersesOfQuran.firstWhere(
        (model) => model.suraNumber == sura && model.ayaNumber == aya);
  }

  String get selectedSuraName {
    return SuraDetails.suraList[_selectedSura - 1].tamilName;
  }

  void loadQuranData() async {
    final db = await DatabaseHelper().database;
    List<Map<String, dynamic>> queryResult = await db.query('quran_db_all');

    for (var verse in queryResult) {
      _allVersesOfQuran.add(QuranAya.fromMap(verse));
    }
  }
}
