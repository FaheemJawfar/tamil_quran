import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/providers/settings_provider.dart';

import '../models/verse.dart';

class SuraArabicScreen extends StatefulWidget {
  final List<VerseModel> allVersesOfSura;
  final int suraNumber;

  const SuraArabicScreen(
      {required this.allVersesOfSura, required this.suraNumber, Key? key})
      : super(key: key);

  @override
  State<SuraArabicScreen> createState() => _SuraArabicScreenState();
}

class _SuraArabicScreenState extends State<SuraArabicScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        controller: _scrollController,
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

  @override
  void didUpdateWidget(SuraArabicScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  TextSpan _buildRichTextSpan() {
    List<InlineSpan> inlineSpans = [];

    for (var verse in widget.allVersesOfSura) {
      inlineSpans.add(TextSpan(
        text: verse.arabic,
        style: TextStyle(
          fontSize: 20,
          fontFamily: Provider.of<SettingsProvider>(context, listen: true).arabicFont,
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
