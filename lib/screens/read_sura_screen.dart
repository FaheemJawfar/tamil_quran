import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/screens/sura_arabic_screen.dart';
import 'package:tamil_quran/screens/sura_translation_screen.dart';
import 'package:tamil_quran/widgets/read_sura_appbar.dart';
import '../providers/quran_provider.dart';

class ReadSuraScreen extends StatefulWidget {
  final int goToVerse;

  const ReadSuraScreen({
    this.goToVerse = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<ReadSuraScreen> createState() => _ReadSuraScreenState();
}

class _ReadSuraScreenState extends State<ReadSuraScreen> {
  bool arabicOnly = false;
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);
  final ItemScrollController scrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReadSuraAppBar(
        title: quranProvider.suraList[quranProvider.selectedSura - 1].tamilName,
      onBookIconPressed: () {},
        onNavigatePreviousPressed: () => _navigateSura(-1),
        onNavigateNextPressed: () => _navigateSura(1),
      ),

      body: arabicOnly
          ? ReadSuraOnlyArabic(
              allVersesOfSura: quranProvider.selectedSuraContent,
              suraNumber: quranProvider.selectedSura,
            )
          : TranslationScreen(
              scrollController: scrollController,
              goToVerse: widget.goToVerse,
            ),
    );
  }

  void _navigateSura(int increment) {
    final newSura = quranProvider.selectedSura + increment;
    if (newSura >= 1 && newSura <= 114) {
      quranProvider.setSelectedSura(newSura);

      scrollController.scrollTo(
        index: 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
