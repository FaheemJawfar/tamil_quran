import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/translation_model.dart';

class QuranProvider extends ChangeNotifier {
  List<TranslationModel> translations = [];

  List<TranslationModel> filterBySura(int sura) {
    return translations.where((model) => model.sura == sura).toList();
  }

  Future<void> loadTranslationsFromDatabase() async {
    final startTime = DateTime.now();
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'tamil_quran_all.db');

    // Check if the database file already exists in the device's file system
    if (await databaseExists(path)) {
      // Open the existing database
      final database = await openDatabase(path);
      final List<Map<String, dynamic>> result =
          await database.query('quran_db_all');

      translations =
          result.map((data) => TranslationModel.fromMap(data)).toList();

      print('*' * 100);
      print(
          'loaded in ${DateTime.now().difference(startTime).inSeconds} seconds');
      print(translations.length);
      notifyListeners();
    } else {
      // Copy the database from assets to the device's file system
      await Directory(dirname(path)).create(recursive: true);
      final ByteData data = await rootBundle.load('assets/tamil_quran_all.db');
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);

      // Open the copied database
      final database = await openDatabase(path);
      final List<Map<String, dynamic>> result =
          await database.query('quran_db_all');

      translations =
          result.map((data) => TranslationModel.fromMap(data)).toList();
      notifyListeners();
    }
  }
}
