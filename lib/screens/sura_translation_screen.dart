import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tamil_quran/widgets/read_sura_appbar.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../config/color_config.dart';
import '../helpers/shared_preferences.dart';
import '../helpers/verse_helper.dart';
import '../models/verse.dart';
import '../providers/quran_provider.dart';
import '../providers/settings_provider.dart';
import '../widgets/show_verse.dart';

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
//  late int scrollTo = widget.goToVerse;
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);
  late final settingsProvider =
      Provider.of<SettingsProvider>(context, listen: true);
  final scrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    scrollToVerse();
  }

  void _updateLastSeen(int suraNumber, int verseNumber) {
    AppPreferences.setInt('lastSeenSura', suraNumber);
    AppPreferences.setInt('lastSeenVerse', verseNumber);
  }

  void scrollToVerse() {
    if (widget.goToVerse > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.scrollTo(
          index: widget.goToVerse,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasBismillah =
        (quranProvider.selectedSura != 1 && quranProvider.selectedSura != 9);

    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      appBar: ReadSuraAppBar(
        tamilScrollController: scrollController,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ScrollablePositionedList.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: ColorConfig.primaryColor),
              itemScrollController: scrollController,
              itemCount: quranProvider.selectedSuraContent.length +
                  (hasBismillah ? 1 : 0),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0 && hasBismillah) {
                  return ShowVerse(
                    isBismi: true,
                    verseModel: quranProvider.bismillahVerse,
                  );
                } else {
                  return VisibilityDetector(
                    key: Key(index.toString()),
                    onVisibilityChanged: (info) =>
                        _updateLastSeen(quranProvider.selectedSura, index),
                    child: ShowVerse(
                      isBismi: false,
                      verseModel: quranProvider
                          .selectedSuraContent[index - (hasBismillah ? 1 : 0)],
                    ),
                  );
                }
              },
            ),
          ),
          Divider(color: ColorConfig.primaryColor),
        ],
      ),
    );
  }
}
