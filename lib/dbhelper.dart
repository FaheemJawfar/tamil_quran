import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'models/sura_names.dart';
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
    //print(list);
    List<SuraNames> allSuraNames = [];
    for (int i = 0; i < list.length; i++) {
      // print(list[i]["arabic_name"]);
      allSuraNames.add(SuraNames(list[i]["sura_number"], list[i]["name"],
          list[i]["arabic_name"], list[i]["total_verses"]));
    }
    return allSuraNames;
  }
}
