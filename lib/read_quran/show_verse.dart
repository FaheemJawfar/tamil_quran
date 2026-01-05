import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../app_config/color_config.dart';
import 'package:tamil_quran/read_quran/pj_thafseer_content.dart';
import 'package:tamil_quran/read_quran/thafseer.dart';
import 'package:tamil_quran/read_quran/thafseer_popup.dart';
import 'package:tamil_quran/read_quran/tntj_thafseer_content.dart';
import '../app_texts/read_quran_texts.dart';
import 'quran_helper.dart';
import 'verse_helper.dart';
import '../bookmarks/bookmark.dart';
import 'quran_aya.dart';
import '../providers/quran_provider.dart';

class ShowVerse extends StatefulWidget {
  final QuranAya quranAyaArabic;
  final QuranAya quranAyaTranslation;
  final Future<void> Function() playAudio;
  final void Function() stopAudio;
  final bool isPlaying;

  const ShowVerse(
      {required this.quranAyaArabic,
      required this.quranAyaTranslation,
      required this.playAudio,
      required this.stopAudio,
      required this.isPlaying,
      Key? key})
      : super(key: key);

  @override
  State<ShowVerse> createState() => _ShowVerseState();
}

class _ShowVerseState extends State<ShowVerse> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  // void seekTo(Duration position) {
  //   QuranAudioPlayerHelper.audioPlayer.seek(position);
  // }

  TextSpan getArabicAyaList(QuranAya quranAya) {
    if (quranProvider.isPJMode) {
      List<int> intList = quranAya.ayaNumberList
          .split(',')
          .map((str) => int.parse(str))
          .toList();

      List<InlineSpan> spans = [];

      for (int ayaNumber in intList) {
        spans.add(
          TextSpan(
            text: quranProvider
                .filterOneAyaArabic(quranAya.suraIndex, ayaNumber)
                .text,
            style: TextStyle(
              fontSize: quranProvider.arabicFontSize,
              fontFamily: quranProvider.arabicFont,
              color: quranProvider.isDarkMode
                  ? ColorConfig.textDark
                  : ColorConfig.textLight,
            ),
          ),
        );
        spans.add(
          TextSpan(
            text: '${QuranHelper.getVerseEndSymbol(ayaNumber)} ',
            style: TextStyle(
              fontSize: 18,
              color: quranProvider.isDarkMode
                  ? ColorConfig.textDark
                  : ColorConfig.textLight,
            ),
          ),
        );
      }

      return TextSpan(children: spans);
    } else {
      return TextSpan(
        children: [
          TextSpan(
            text: widget.quranAyaArabic.text,
            style: TextStyle(
              fontSize: quranProvider.arabicFontSize,
              fontFamily: quranProvider.arabicFont,
              color: quranProvider.isDarkMode
                  ? ColorConfig.textDark
                  : ColorConfig.textLight,
            ),
          ),
          TextSpan(
            text: QuranHelper.getVerseEndSymbol(widget.quranAyaArabic.ayaIndex),
            style: TextStyle(
              fontSize: 18,
              color: quranProvider.isDarkMode
                  ? ColorConfig.textDark
                  : ColorConfig.textLight,
            ),
          ),
        ],
      );
    }
  }

  RichText getTranslationWithTappableNumbers(String text) {
    if (quranProvider.isPJMode) {
      final regex =
          RegExp(r'\d+'); // This regex matches one or more digits in the text.

      final matches = regex.allMatches(text);

      final spans = <InlineSpan>[];
      int previousMatchEnd = 0;

      for (final match in matches) {
        if (match.start > previousMatchEnd) {
          // Add non-tappable text before the number
          spans.add(TextSpan(
            text: text.substring(previousMatchEnd, match.start),
            style: TextStyle(
              fontSize: quranProvider.tamilFontSize,
              fontFamily: quranProvider.tamilFont,
              color: quranProvider.isDarkMode
                  ? ColorConfig.textDark
                  : ColorConfig.textLight,
            ),
          ));
        }

        // Wrap the number in a styled circular badge for better UX
        spans.add(
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: () {
                int tappedNumber =
                    int.parse(text.substring(match.start, match.end));
                showExplanationPopup(context, tappedNumber);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: ColorConfig.primaryColor.withAlpha(40),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorConfig.primaryColor,
                    width: 1,
                  ),
                ),
                child: Text(
                  text.substring(match.start, match.end),
                  style: TextStyle(
                    fontSize: quranProvider.tamilFontSize * 0.6,
                    fontFamily: 'NotoSansTamil',
                    color: quranProvider.isDarkMode
                        ? ColorConfig.textDark
                        : ColorConfig.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );

        previousMatchEnd = match.end;
      }

      // Add any remaining non-tappable text after the last number
      if (previousMatchEnd < text.length) {
        spans.add(TextSpan(
          text: text.substring(previousMatchEnd),
          style: TextStyle(
            fontSize: quranProvider.tamilFontSize,
            fontFamily: quranProvider.tamilFont,
            color: quranProvider.isDarkMode
                ? ColorConfig.textDark
                : ColorConfig.textLight,
          ),
        ));
      }

      return RichText(text: TextSpan(children: spans));
    } else {
      return RichText(
          text: TextSpan(
        text: widget.quranAyaTranslation.text,
        style: TextStyle(
          fontSize: quranProvider.tamilFontSize,
          fontFamily: quranProvider.tamilFont,
          color: quranProvider.isDarkMode
              ? ColorConfig.textDark
              : ColorConfig.textLight,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.quranAyaTranslation.ayaIndex == 0
        ? buildBismi()
        : buildVerse();
  }

  Widget getPopupMenuItem(IconData icon, String title) {
    return ListTile(
      iconColor: quranProvider.isDarkMode ? null : ColorConfig.buttonColor,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
    );
  }

  Widget _buildOptionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${widget.quranAyaTranslation.ayaNumberList}. ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: quranProvider.isDarkMode
                ? ColorConfig.textDark
                : ColorConfig.textLight,
          ),
        ),
        PopupMenuButton<String>(
          color: quranProvider.isDarkMode ? null : ColorConfig.popupColor,
          onSelected: (String value) {
            switch (value) {
              case 'shareVerse':
                Share.share(VerseHelper.getVerseCopy(
                    widget.quranAyaTranslation, 'copy', context));

                break;
              case 'addBookmark':
                quranProvider.addBookmark(
                  Bookmark(
                    suraNumber: quranProvider.selectedSuraNumber.toString(),
                    verseNumber: getFirstVerseInList(
                            widget.quranAyaTranslation.ayaNumberList)
                        .toString(),
                  ),
                  context,
                );
                break;
              case 'copy':
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(
                        widget.quranAyaTranslation, 'copy', context),
                    context);
                break;
              case 'copy_arabic':
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(
                        widget.quranAyaTranslation, 'copy_arabic', context),
                    context);

                break;
              case 'copy_translation':
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(widget.quranAyaTranslation,
                        'copy_translation', context),
                    context);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'shareVerse',
              child: getPopupMenuItem(LucideIcons.share2, ReadQuranTexts.share),
            ),
            PopupMenuItem<String>(
              value: 'addBookmark',
              child: getPopupMenuItem(
                  LucideIcons.bookmarkPlus, ReadQuranTexts.addBookmark),
            ),
            PopupMenuItem<String>(
              value: 'copy',
              child: getPopupMenuItem(
                  LucideIcons.copy, ReadQuranTexts.copyArabicAndTranslation),
            ),
            PopupMenuItem<String>(
              value: 'copy_arabic',
              child:
                  getPopupMenuItem(LucideIcons.copy, ReadQuranTexts.copyArabic),
            ),
            PopupMenuItem<String>(
              value: 'copy_translation',
              child: getPopupMenuItem(
                  LucideIcons.copy, ReadQuranTexts.copyTranslation),
            ),
          ],
          child: const Icon(LucideIcons.ellipsisVertical),
        )
      ],
    );
  }

  Widget buildVerse() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: _buildOptionsRow(),
        ),
        // const SizedBox(
        //   height: 12,
        // ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: InkWell(
                onTap: widget.isPlaying ? widget.stopAudio : widget.playAudio,
                child: widget.isPlaying
                    ? const Icon(
                        LucideIcons.circleStop,
                        color: Colors.red,
                      )
                    : const Icon(
                        LucideIcons.circlePlay,
                        color: ColorConfig.primaryColor,
                      )),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: RichText(
                  textAlign: TextAlign.right,
                  text: getArabicAyaList(widget.quranAyaTranslation),
                ),
              ),
              const SizedBox(height: 8),
              getTranslationWithTappableNumbers(
                  widget.quranAyaTranslation.text),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBismi() {
    String bismiArabic = quranProvider.bismillahArabic.text;
    String bismiTamil = quranProvider.bismillahTranslation.text;

    if (quranProvider.selectedTranslation == 'tntj') {
      RegExp numberPattern = RegExp(r'\d+');
      bismiTamil = bismiTamil.replaceAll(numberPattern, '');
    }

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
                  bismiArabic,
                  style: TextStyle(
                    fontSize: quranProvider.arabicFontSize,
                    fontFamily: quranProvider.arabicFont,
                    color:
                        quranProvider.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                bismiTamil,
                style: TextStyle(
                  fontSize: quranProvider.tamilFontSize,
                  fontFamily: quranProvider.tamilFont,
                  color: quranProvider.isDarkMode
                      ? ColorConfig.textDark
                      : ColorConfig.textLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showExplanationPopup(BuildContext context, int tappedNumber) {
    List thafseerList = quranProvider.selectedTranslation == 'pj'
        ? PJThafseerContent.thafseerList
        : quranProvider.selectedTranslation == 'tntj'
            ? TNTJThafseerContent.thafseerList
            : [];
    Thafseer selectedItem =
        Thafseer.getSelectedExplanation(tappedNumber, thafseerList);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ThafseerPopup(selectedThafseer: selectedItem);
      },
    );
  }

  int getFirstVerseInList(String ayaList) {
    List<int> allVerses =
        ayaList.split(',').map((str) => int.parse(str)).toList();

    return allVerses.first;
  }
}
