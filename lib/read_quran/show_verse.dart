import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_texts/app_widgets_texts.dart';
import '../helpers/bookmark_helper.dart';
import '../helpers/quran_helper.dart';
import '../helpers/verse_helper.dart';
import '../models/bookmark.dart';
import '../models/quran_aya.dart';
import '../providers/quran_provider.dart';

class ShowVerse extends StatefulWidget {
  final QuranAya quranAyaArabic;
  final QuranAya quranAyaTranslation;

  const ShowVerse(
      {required this.quranAyaArabic,
      required this.quranAyaTranslation,
      Key? key})
      : super(key: key);

  @override
  State<ShowVerse> createState() => _ShowVerseState();
}

class _ShowVerseState extends State<ShowVerse> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: widget.quranAyaArabic.ayaIndex == 0
              ? const SizedBox()
              : _buildOptionsRow(),
        ),
        const SizedBox(
          height: 12,
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
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.quranAyaArabic.text,
                          style: TextStyle(
                            fontSize: quranProvider.arabicFontSize,
                            fontFamily: quranProvider.arabicFont,
                            color: quranProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: widget.quranAyaArabic.ayaIndex == 0
                              ? ''
                              : QuranHelper.getVerseEndSymbol(
                                  widget.quranAyaArabic.ayaIndex),
                          style: TextStyle(
                            fontSize: 18,
                            color: quranProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 8),
              Text(
                widget.quranAyaTranslation.text,
                style: TextStyle(
                  fontSize: quranProvider.tamilFontSize,
                  fontFamily: quranProvider.tamilFont,
                  color: quranProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getPopupMenuItem(IconData icon, String title) {
    return ListTile(
      iconColor: quranProvider.isDarkMode ? null : Colors.green.shade700,
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
          '${widget.quranAyaTranslation.ayaIndex}. ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: quranProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        PopupMenuButton<String>(
          color: quranProvider.isDarkMode ? null : Colors.green.shade100,
          onSelected: (String value) {
            switch (value) {
              case 'shareVerse':
                VerseHelper.shareVerse(VerseHelper.getVerseCopy(
                    widget.quranAyaArabic,
                    widget.quranAyaTranslation,
                    quranProvider.selectedSuraNumber,
                    'copy'));
                break;
              case 'addBookmark':
                BookmarkHelper.addBookmark(
                  Bookmark(
                    suraNumber: quranProvider.selectedSuraNumber.toString(),
                    verseNumber: widget.quranAyaTranslation.ayaIndex.toString(),
                  ),
                  context,
                );
                break;
              case 'copy':
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(
                        widget.quranAyaArabic,
                        widget.quranAyaTranslation,
                        quranProvider.selectedSuraNumber,
                        'copy'),
                    context);
                break;
              case 'copy_arabic':
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(
                        widget.quranAyaArabic,
                        widget.quranAyaTranslation,
                        quranProvider.selectedSuraNumber,
                        'copy_arabic'),
                    context);

                break;
              case 'copy_translation':
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(
                        widget.quranAyaArabic,
                        widget.quranAyaTranslation,
                        quranProvider.selectedSuraNumber,
                        'copy_translation'),
                    context);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'shareVerse',
              child: getPopupMenuItem(Icons.share, AppWidgetsTexts.share),
            ),
            PopupMenuItem<String>(
              value: 'addBookmark',
              child: getPopupMenuItem(
                  Icons.bookmark_add_outlined, AppWidgetsTexts.addBookmark),
            ),
            PopupMenuItem<String>(
              value: 'copy',
              child: getPopupMenuItem(
                  Icons.copy, AppWidgetsTexts.copyArabicAndTranslation),
            ),
            PopupMenuItem<String>(
              value: 'copy_arabic',
              child: getPopupMenuItem(Icons.copy, AppWidgetsTexts.copyArabic),
            ),
            PopupMenuItem<String>(
              value: 'copy_translation',
              child:
                  getPopupMenuItem(Icons.copy, AppWidgetsTexts.copyTranslation),
            ),
          ],
          child: const Icon(Icons.more_vert),
        )
      ],
    );
  }
}
