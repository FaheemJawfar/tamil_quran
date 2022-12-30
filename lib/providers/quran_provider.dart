import 'package:flutter/material.dart';
import 'package:tamil_quran/helpers/dbhelper.dart';

import '../models/sura_names.dart';


class QuranProvider extends ChangeNotifier {


  List<SuraNames> _suraNames = [];
  get suraNames => _suraNames;

  getSuraNamesFromDb() async {
    var result = await DBHelper().getSuraNames();
    _suraNames = result;
    notifyListeners();
  }



  List _allSuraArabicVerses = [];
  get allSuraArabicVerses => _allSuraArabicVerses;

  getAllArabicVersesFromDb() async {
    var result = await DBHelper().getAllSuraArabicVerses();
    _allSuraArabicVerses = result;
    notifyListeners();
  }


  List _allSuraTamilVerses = [];
  get allSuraTamilVerses => _allSuraTamilVerses;

  getAllTamilVersesFromDb() async {
    var result = await DBHelper().getAllSuraTamilVerses();
    _allSuraTamilVerses = result;
    notifyListeners();
  }


  String _selectedTranslation = 'mJohn';

  get selectedTranslation => _selectedTranslation;


  setSelectedTranslation (value) {
    _selectedTranslation = value;
    notifyListeners();
  }


}