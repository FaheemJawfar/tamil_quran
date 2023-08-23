import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:tamil_quran/config/color_config.dart';

import '../models/verse.dart';

class ReadSuraOnlyArabic extends StatefulWidget {
  final List<VerseModel> allVersesOfSura;
  final int suraNumber;

  const ReadSuraOnlyArabic(
      {required this.allVersesOfSura, required this.suraNumber, Key? key})
      : super(key: key);

  @override
  State<ReadSuraOnlyArabic> createState() => _ReadSuraOnlyArabicState();
}

class _ReadSuraOnlyArabicState extends State<ReadSuraOnlyArabic> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10),
            color: ColorConfig.backgroundColor,
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.suraNumber != 1 && widget.suraNumber != 9)
                Image.asset(
                  'assets/images/bismillah.png',
                  height: 40,
                  width: double.infinity,
                ),
              const SizedBox(
                height: 10,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: _buildRichTextSpan(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextSpan _buildRichTextSpan() {
    List<InlineSpan> inlineSpans = [];

    for (var verse in widget.allVersesOfSura) {
      inlineSpans.add(TextSpan(
        text: verse.arabic,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: 'Uthmani',
          color: Colors.black,
        ),
      ));

      inlineSpans.add(TextSpan(
        text: '${getVerseEndSymbol(verse.aya)} ',
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ));
    }

    return TextSpan(children: inlineSpans);
  }
}
