import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/dbhelper.dart';

import '../models/sura_names.dart';


class QuranProvider extends ChangeNotifier {


  final Future<List<SuraNames>> _suraNames =  DBHelper().getSuraNames();

  get suraNames => _suraNames;

  // set suraNames (value){
  //   _suraNames = value;
  //   notifyListeners();
  // }





}