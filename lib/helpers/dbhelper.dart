import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:tamil_quran/models/arabic_verses.dart';
import '../models/sura_names.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database? _db;
  final String dbName = 'tamil_quran_all.db';

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    bool dbExists = await io.File(path).exists();

    if (!dbExists) {
      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", dbName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await io.File(path).writeAsBytes(bytes, flush: true);
    }

    var database = await openDatabase(path, version: 1);
    return database;
  }


  Future<List<SuraNames>> getSuraNames() async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM sura_names');
    List<SuraNames> allSuraNames = [];


    for (var suraNameDetails in list) {

      allSuraNames.add(SuraNames(
          suraNameDetails["sura_number"],
          suraNameDetails["name"],
          suraNameDetails["arabic_name"],
          suraNameDetails["total_verses"] ));

    }
    return allSuraNames;
  }




  Future<List> getAllSuraArabicVerses() async {

    var dbClient = await db;

    List allSurasArabic = [];

    for(int i = 1; i <= 114; i++){

      List<ArabicVerses> allVerses = [];
      List<Map> list = await dbClient!.rawQuery('SELECT * from quran_arabic where sura=$i');

      for (var arabicVerses in list) {
        allVerses.add(ArabicVerses(
            arabicVerses['index'],
            arabicVerses['sura'],
            arabicVerses['aya'],
            arabicVerses['arabic']));

      }

      allSurasArabic.add(allVerses);
    }

    return allSurasArabic;
  }

}
