import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;
import '../models/quran_aya.dart';
import '../models/quran_sura.dart';

class DataParser {
  // static Future<List<SuraDetails>> loadQuranMetaData() async {
  //   try {
  //     final jsonData = await rootBundle.loadString('assets/metadata.json');
  //     final jsonMap = json.decode(jsonData);
  //     final suraDetailsList = jsonMap['chapters'];
  //
  //     //print('Number of Sura Details: ${suraDetailsList.length}');
  //
  //     List<SuraDetails> suraDetailsObjects = [];
  //
  //     for (var suraDetails in suraDetailsList) {
  //       suraDetailsObjects.add(SuraDetails.fromJson(suraDetails));
  //     }
  //
  //     return suraDetailsObjects;
  //   } catch (e) {
  //     debugPrint('Error loading or parsing JSON: $e');
  //     return [];
  //   }
  // }


  static Future<List<QuranSura>> loadXmlFromAssets(String xmlFilePath) async {
    List<QuranSura> suras = [];

    final xmlString = await rootBundle.loadString(xmlFilePath);
    final document = xml.XmlDocument.parse(xmlString);

    for (var suraElement in document.findAllElements('sura')) {
      final suraIndex = int.parse(suraElement.getAttribute('index')!);
      final ayas = <QuranAya>[];

      for (var ayaElement in suraElement.findElements('aya')) {
        final ayaIndex = int.parse(ayaElement.getAttribute('index')!);
        final sura = suraIndex;
        final ayaText = ayaElement.getAttribute('text');
        ayas.add(QuranAya(ayaIndex, sura, ayaText!));
      }

      suras.add(QuranSura(suraIndex, ayas));
    }

    return suras;
  }
}
