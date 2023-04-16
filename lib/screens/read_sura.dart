import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'package:tamil_quran/widgets/common_app_bar.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReadSura extends StatefulWidget {
  final int suraNumber;
  final String suraName;
  final int verseNumber;

  const ReadSura({
    Key? key,
    required this.suraNumber,
    required this.suraName,
    required this.verseNumber,
  }) : super(key: key);

  @override
  State<ReadSura> createState() => _ReadSuraState();
}

class _ReadSuraState extends State<ReadSura> {
  late var quranProvider = Provider.of<QuranProvider>(context, listen: true);
  final ItemScrollController _itemScrollController = ItemScrollController();

  late int suraNumberIndex = widget.suraNumber - 1;

  final double _currentArabicFontSize = 20;
  final double _currentTamilFontSize = 20;
  final String _selectedTamilFont = 'MuktaMalar';
  final String _selectedArabicFont = 'AlQalam';
  bool nightMode = false;
  int inputVerse = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nightMode ? Colors.grey[900] : Colors.white,
      appBar: CommonAppBar(
        label: widget.suraName,
      ),
      body: quranProvider.allSuraTamilVerses.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Expanded(
                    child: ScrollablePositionedList.builder(
                        initialScrollIndex: widget.verseNumber,
                        itemScrollController: _itemScrollController,
                        itemCount: getVerseCount(),
                        itemBuilder: (context, index) {
                          return VisibilityDetector(
                            key: Key(index.toString()),
                            onVisibilityChanged: (info) async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                              prefs.setInt('lastVerse', index);
                              prefs.setInt('lastSura', widget.suraNumber);
                            },
                            child: Card(
                              color:
                                  nightMode ? Colors.grey[900] : Colors.white,
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: ListTile(
                                title: Text(
                                  setArabicVerse(index),
                                  style: TextStyle(
                                    color:
                                        nightMode ? Colors.white : Colors.black,
                                    fontSize: _currentArabicFontSize,
                                    fontFamily: _selectedArabicFont,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                subtitle: Text(
                                  setTamilVerse(index),
                                  style: TextStyle(
                                    color:
                                        nightMode ? Colors.white : Colors.black,
                                    fontFamily: _selectedTamilFont,
                                    fontSize: _currentTamilFontSize,
                                  ),
                                ),
                                onTap: () {},
                                onLongPress: () {},
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            )
          : Container(),
    );
  }

  int getVerseCount() {
    if (widget.suraNumber == 1 || widget.suraNumber == 9) {
      return quranProvider.allSuraArabicVerses[suraNumberIndex].length;
    } else {
      return quranProvider.allSuraArabicVerses[suraNumberIndex].length + 1;
    }
  }


  String setTamilVerse(index) {

    if (quranProvider.selectedTranslation == 'mJohn') {
      if (widget.suraNumber == 1 || widget.suraNumber == 9) {
        return '${index + 1}. ${quranProvider.allSuraTamilVerses[suraNumberIndex][index].mJohn}';
      } else {
        if (index == 0) {
          return '${quranProvider.allSuraTamilVerses[0][0].mJohn}';
        } else {
          return '$index. ${quranProvider.allSuraTamilVerses[suraNumberIndex][index - 1].mJohn}';
        }
      }
    } else if (quranProvider.selectedTranslation == 'abdulHameed') {
      if (widget.suraNumber == 1 || widget.suraNumber == 9) {
        return '${index + 1}. ${quranProvider.allSuraTamilVerses[suraNumberIndex][index].abdulHameed}';
      } else {
        if (index == 0) {
          return '${quranProvider.allSuraTamilVerses[0][0].abdulHameed}';
        } else {
          return '$index. ${quranProvider.allSuraTamilVerses[suraNumberIndex][index - 1].abdulHameed}';
        }
      }
    } else if (quranProvider.selectedTranslation == 'ift') {
      if (widget.suraNumber == 1 || widget.suraNumber == 9) {
        return '${index + 1}. ${quranProvider.allSuraTamilVerses[suraNumberIndex][index].ift}';
      } else {
        if (index == 0) {
          return '${quranProvider.allSuraTamilVerses[0][0].ift}';
        } else {
          return '$index. ${quranProvider.allSuraTamilVerses[suraNumberIndex][index - 1].ift}';
        }
      }
    } else if (quranProvider.selectedTranslation == 'kingFahd') {
      if (widget.suraNumber == 1 || widget.suraNumber == 9) {
        return '${index + 1}. ${quranProvider.allSuraTamilVerses[suraNumberIndex][index].kingFahd}';
      } else {
        if (index == 0) {
          return '${quranProvider.allSuraTamilVerses[0][0].kingFahd}';
        } else {
          return '$index. ${quranProvider.allSuraTamilVerses[suraNumberIndex][index - 1].kingFahd}';
        }
      }
    }
    return '';
  }

  String setArabicVerse(index) {
    // if (widget.suraNumber == 1 || widget.suraNumber == 9) {
    //   return quranProvider
    //       .allSuraArabicVerses[suraNumberIndex][index].arabicVerse;
    // } else {
    //   if (index == 0) {
    return '${quranProvider.allSuraArabicVerses[0][0].arabicVerse}';
    //   } else {
    //     return quranProvider
    //         .allSuraArabicVerses[suraNumberIndex][index - 1].arabicVerse;
    //   }
    // }
  }

  @override
  void initState() {
    super.initState();
  }
}
