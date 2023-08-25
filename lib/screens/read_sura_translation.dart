import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';
import 'package:tamil_quran/screens/read_sura_only_arabic.dart';
import 'package:tamil_quran/widgets/show_verse.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../models/verse.dart';
import '../providers/quran_provider.dart';

class ReadSuraTranslation extends StatefulWidget {
  final int scrollTo;

  const ReadSuraTranslation({
    this.scrollTo = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<ReadSuraTranslation> createState() => _ReadSuraTranslationState();
}

class _ReadSuraTranslationState extends State<ReadSuraTranslation> {

  late int scrollTo = widget.scrollTo;
  late final quranProvider = context.watch<QuranProvider>();
  final _scrollController = ItemScrollController();
  bool arabicOnly = false;

  @override
  void initState() {
    super.initState();
    scrollToVerse();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      appBar: AppBar(
        title: Text(quranProvider.suraList[quranProvider.selectedSura].tamilName),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  arabicOnly = !arabicOnly;
                });
              },
              icon: const Icon(Icons.menu_book)),
          IconButton(
              onPressed: () {
                if (quranProvider.selectedSura != 1) {
                  quranProvider.setSelectedSura(quranProvider.selectedSura -1);
                  if(!arabicOnly){
                    scrollToFirstVerse();
                  }
                }
              },
              icon: const Icon(Icons.navigate_before)),
          IconButton(
              onPressed: () {
                if (quranProvider.selectedSura != 114) {
                  quranProvider.setSelectedSura(quranProvider.selectedSura +1);
                  if(!arabicOnly){
                    scrollToFirstVerse();
                  }
                }
              },
              icon: const Icon(Icons.navigate_next)),
        ],
      ),


      body: arabicOnly
          ? ReadSuraOnlyArabic(
        allVersesOfSura: quranProvider.selectedSuraContent,
        suraNumber: quranProvider.selectedSura,
      )
          : Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child:
            ScrollablePositionedList.separated(
              separatorBuilder: (context, index) => Divider(color: ColorConfig.primaryColor,),
              itemScrollController: _scrollController,
              itemCount: quranProvider.selectedSuraContent.length,
              itemBuilder: (BuildContext context, int index) {
                  return VisibilityDetector(
                    key: Key(index.toString()),
                    onVisibilityChanged: (info) => updateLastSeen(quranProvider.selectedSura, index),

                    child: ShowVerse(
                      verseModel: quranProvider.selectedSuraContent[index],
                    ),
                  );
                }

            ),
          ),
        ],
      ),
    );
  }

  void scrollToVerse() {
    if (scrollTo > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.scrollTo(
          index: scrollTo,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  updateLastSeen(int suraNumber, int verseNumber) {
    Preferences.setInt('lastSeenSura', suraNumber);
    Preferences.setInt('lastSeenVerse', verseNumber);
  }

  void scrollToFirstVerse() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(
        index: 0,
      );
    });
  }

}
