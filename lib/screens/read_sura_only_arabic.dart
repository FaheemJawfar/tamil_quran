import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

import '../models/translation_model.dart';

class ReadSuraOnlyArabic extends StatefulWidget {
  final List<TranslationModel> allVersesOfSura;

  const ReadSuraOnlyArabic({required this.allVersesOfSura, Key? key})
      : super(key: key);

  @override
  State<ReadSuraOnlyArabic> createState() => _ReadSuraOnlyArabicState();
}

class _ReadSuraOnlyArabicState extends State<ReadSuraOnlyArabic> {
  @override
  Widget build(BuildContext context) {
    String allVersesCombined = '';
    for (var verse in widget.allVersesOfSura) {
      allVersesCombined += '${verse.arabic}${getVerseEndSymbol(verse.aya)} ';
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/bismillah.png',
              height: 60,
              width: double.infinity,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                allVersesCombined,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
