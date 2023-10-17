import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_texts/read_quran_texts.dart';
import '../bookmarks/bookmark_helper.dart';
import 'quran_helper.dart';
import 'verse_helper.dart';
import '../bookmarks/bookmark.dart';
import 'quran_aya.dart';
import '../providers/quran_provider.dart';

class ShowVersePJ extends StatefulWidget {
  final QuranAya quranAyaArabic;
  final QuranAya quranAyaTranslation;

  const ShowVersePJ(
      {required this.quranAyaArabic,
      required this.quranAyaTranslation,
      Key? key})
      : super(key: key);

  @override
  State<ShowVersePJ> createState() => _ShowVersePJState();
}

class _ShowVersePJState extends State<ShowVersePJ> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);



  TextSpan getArabicAyaList(QuranAya quranAya) {
    List<int> intList = quranAya.ayaNumberList.split(',').map((str) => int.parse(str)).toList();

    List<InlineSpan> spans = [];

    for (int ayaNumber in intList) {
      spans.add(
        TextSpan(
          text: quranProvider.filterOneAyaArabic(quranAya.suraIndex, ayaNumber).text,
          style: TextStyle(
            fontSize: quranProvider.arabicFontSize,
            fontFamily: quranProvider.arabicFont,
            color: quranProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      );

      if (ayaNumber != 0) {
        spans.add(
          TextSpan(
            text: '${QuranHelper.getVerseEndSymbol(ayaNumber)} ',
            style: TextStyle(
              fontSize: 18,
              color: quranProvider.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        );
      }
    }

    return TextSpan(children: spans);
  }


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
                    text: getArabicAyaList(widget.quranAyaTranslation),
                  ),
              ),
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
          '${widget.quranAyaTranslation.ayaNumberList}. ',
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
              child: getPopupMenuItem(Icons.share, ReadQuranTexts.share),
            ),
            PopupMenuItem<String>(
              value: 'addBookmark',
              child: getPopupMenuItem(
                  Icons.bookmark_add_outlined, ReadQuranTexts.addBookmark),
            ),
            PopupMenuItem<String>(
              value: 'copy',
              child: getPopupMenuItem(
                  Icons.copy, ReadQuranTexts.copyArabicAndTranslation),
            ),
            PopupMenuItem<String>(
              value: 'copy_arabic',
              child: getPopupMenuItem(Icons.copy, ReadQuranTexts.copyArabic),
            ),
            PopupMenuItem<String>(
              value: 'copy_translation',
              child:
                  getPopupMenuItem(Icons.copy, ReadQuranTexts.copyTranslation),
            ),
          ],
          child: const Icon(Icons.more_vert),
        )
      ],
    );
  }
}
