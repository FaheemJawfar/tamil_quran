import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;
import '../models/quran_aya.dart';
import '../models/quran_sura.dart';

class DataParser {

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
