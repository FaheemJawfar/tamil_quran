import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/color_config.dart';
import '../helpers/quran_helper.dart';
import '../providers/quran_provider.dart';
import '../widgets/read_sura_appbar.dart';

class SuraArabicScreen extends StatefulWidget {
  const SuraArabicScreen({Key? key}) : super(key: key);

  @override
  State<SuraArabicScreen> createState() => _SuraArabicScreenState();
}

class _SuraArabicScreenState extends State<SuraArabicScreen> {
  final ScrollController scrollController = ScrollController();
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReadSuraAppBar(
        arabicOnly: true,
        arabicScrollController: scrollController,

      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorConfig.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(10),
              color: ColorConfig.backgroundColor,
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (quranProvider.selectedSuraNumber != 1 &&
                    quranProvider.selectedSuraNumber != 9)
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
      ),
    );
  }



  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  TextSpan _buildRichTextSpan() {
    List<InlineSpan> inlineSpans = [];

    for (var verse in quranProvider.selectedSuraArabic) {
      inlineSpans.add(TextSpan(
        text: verse.text,
        style: TextStyle(
          fontSize: 20,
          fontFamily:
          quranProvider.arabicFont,
          color: Colors.black,
        ),
      ));

      inlineSpans.add(TextSpan(
        text: '${QuranHelper.getVerseEndSymbol(verse.ayaIndex)} ',
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ));
    }

    return TextSpan(children: inlineSpans);
  }
}
