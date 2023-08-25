import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../config/color_config.dart';
import '../helpers/shared_preferences.dart';
import '../helpers/verse_options.dart';
import '../models/verse.dart';
import '../providers/quran_provider.dart';
import '../widgets/show_verse.dart';

class SuraTranslationScreen extends StatefulWidget {
  final int goToVerse;
  final ItemScrollController scrollController;

  const SuraTranslationScreen({
    required this.scrollController,
    this.goToVerse = 0,
    super.key,
  });

  @override
  State<SuraTranslationScreen> createState() => _SuraTranslationScreenState();
}

class _SuraTranslationScreenState extends State<SuraTranslationScreen> {
  late int scrollTo = widget.goToVerse;
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  void initState() {
    super.initState();
    scrollToVerse();
  }

  void _updateLastSeen(int suraNumber, int verseNumber) {
    Preferences.setInt('lastSeenSura', suraNumber);
    Preferences.setInt('lastSeenVerse', verseNumber);
  }

  void scrollToVerse() {
    if (scrollTo > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.scrollController.scrollTo(
          index: scrollTo,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ScrollablePositionedList.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: ColorConfig.primaryColor),
              itemScrollController: widget.scrollController,
              itemCount: quranProvider.selectedSuraContent.length +
                  (quranProvider.selectedSura != 1 &&
                          quranProvider.selectedSura != 9
                      ? 1
                      : 0),
              itemBuilder: (BuildContext context, int index) {
                final showBismillah = index == 0 &&
                    (quranProvider.selectedSura != 1 &&
                        quranProvider.selectedSura != 9);

                if (showBismillah) {
                  return _getBismillah(quranProvider.filterOneVerse(1, 1));
                } else {
                  return VisibilityDetector(
                    key: Key(index.toString()),
                    onVisibilityChanged: (info) =>
                        _updateLastSeen(quranProvider.selectedSura, index),
                    child: ShowVerse(
                      verseModel: quranProvider.selectedSuraContent[index -
                          (quranProvider.selectedSura != 1 &&
                                  quranProvider.selectedSura != 9
                              ? 1
                              : 0)],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBismillah(VerseModel verse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  verse.arabic,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                VerseHelper.getTamilTranslation(verse),
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
