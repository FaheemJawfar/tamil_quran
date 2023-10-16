import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;
import '../read_quran/quran_aya.dart';
import '../read_quran/quran_sura.dart';

class DataParser {

  static Future<List<QuranSura>> loadXmlFromAssets(String selectedTranslation) async {
    String xmlFilePath = 'assets/quran_db/$selectedTranslation.xml';
    List<QuranSura> listOfAllSuras = [];

    final xmlString = await rootBundle.loadString(xmlFilePath);
    final document = xml.XmlDocument.parse(xmlString);

    for (var suraElement in document.findAllElements('sura')) {
      final suraIndex = int.parse(suraElement.getAttribute('index')!);
      final ayas = <QuranAya>[];

      for (var ayaElement in suraElement.findElements('aya')) {
        final ayaIndex = int.parse(ayaElement.getAttribute('index')!);
        final ayaText = ayaElement.getAttribute('text');
        ayas.add(QuranAya(suraIndex: suraIndex, ayaIndex: ayaIndex, text: ayaText!));
      }

      listOfAllSuras.add(QuranSura(suraIndex, ayas));
    }

    return listOfAllSuras;
  }
}
