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
  final int selectedSura;
  final int scrollTo;

  const ReadSuraTranslation({
    required this.selectedSura,
    this.scrollTo = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<ReadSuraTranslation> createState() => _ReadSuraTranslationState();
}

class _ReadSuraTranslationState extends State<ReadSuraTranslation> {

  late int selectedSura = widget.selectedSura;
  late int scrollTo = widget.scrollTo;
  late final quranProvider = context.read<QuranProvider>();

  late List<VerseModel> allVersesOfSura = context.read<QuranProvider>().filterOneSura(selectedSura);
  late final bool hasBismi =
      selectedSura != 1 && selectedSura != 9;
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
        title: Text(quranProvider.suraList[selectedSura - 1].tamilName),
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
                if (selectedSura != 1) {
                  setState(() {
                    selectedSura = selectedSura - 1;
                    allVersesOfSura = context.read<QuranProvider>().filterOneSura(selectedSura);
                  });
                 if(!arabicOnly){
                   scrollToFirstVerse();
                 }
                }
              },
              icon: const Icon(Icons.navigate_before)),
          IconButton(
              onPressed: () {
                if (selectedSura != 114) {
                  setState(() {
                    selectedSura = selectedSura + 1;
                    allVersesOfSura = context.read<QuranProvider>().filterOneSura(selectedSura);
                  });
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
        allVersesOfSura: allVersesOfSura,
        suraNumber: selectedSura,
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
                    itemCount: allVersesOfSura.length + (hasBismi ? 1 : 0),
                    itemBuilder: (BuildContext context, int index) {
                      if (hasBismi && index == 0) {
                        return const Padding(
                          padding: EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'அளவற்ற அருளாளனும், நிகரற்ற அன்புடையோனுமாகிய அல்லாஹ்வின் திருப்பெயரால்(துவங்குகிறேன்)',
                          style: TextStyle(fontSize: 14),
                        ),
                       SizedBox(height: 10,),
                      ],
                    ),
                  );
                } else {
                  int adjustedIndex = hasBismi ? index - 1 : index;
                  return VisibilityDetector(
                    key: Key(index.toString()),
                    onVisibilityChanged: (info) => updateLastSeen(selectedSura, index),

                    child: ShowVerse(
                      verseModel: allVersesOfSura[adjustedIndex],
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

  void scrollToVerse() {
    if (scrollTo > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.scrollTo(
          index: hasBismi ? scrollTo : scrollTo - 1,
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
      _scrollController.scrollTo(
        index: hasBismi ? 0 : 1,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

}
