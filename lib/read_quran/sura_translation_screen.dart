import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'read_sura_appbar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../app_config/color_config.dart';
import '../utils/shared_preferences.dart';
import '../providers/quran_provider.dart';
import 'show_verse.dart';

class SuraTranslationScreen extends StatefulWidget {
  final int goToVerse;

  const SuraTranslationScreen({
    this.goToVerse = 0,
    super.key,
  });

  @override
  State<SuraTranslationScreen> createState() => _SuraTranslationScreenState();
}

class _SuraTranslationScreenState extends State<SuraTranslationScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  final scrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    scrollToVerse();
  }

  void scrollToVerse() {
    if (widget.goToVerse > 0) {
      int index = widget.goToVerse;
      int suraNumber =
          Provider.of<QuranProvider>(context, listen: false).selectedSuraNumber;
      if (suraNumber == 1 || suraNumber == 9) {
        index--;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.scrollTo(
          index: index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _updateLastSeen(int suraNumber, int verseNumber) {
    AppPreferences.setInt('lastSeenSura', suraNumber);
    AppPreferences.setInt('lastSeenVerse', verseNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quranProvider.isDarkMode ? null : ColorConfig.backgroundColor,
      appBar: ReadSuraAppBar(
        tamilScrollController: scrollController,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ScrollablePositionedList.separated(
                separatorBuilder: (context, index) =>
                    Divider(color: quranProvider.isDarkMode ? null : ColorConfig.primaryColor),
                itemScrollController: scrollController,
                itemCount: quranProvider.selectedSuraArabic.length,
                itemBuilder: (BuildContext context, int index) {
                  return VisibilityDetector(
                    key: Key(index.toString()),
                    onVisibilityChanged: (info) => _updateLastSeen(
                        quranProvider.selectedSuraNumber, index),
                    child: ShowVerse(
                      quranAyaArabic: quranProvider.selectedSuraArabic[index],
                      quranAyaTranslation:
                          quranProvider.selectedSuraTranslation[index],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
