import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/helpers/dbhelper.dart';
import 'package:tamil_quran/models/arabic_verses.dart';

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

}