import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  late final quranProvider = Provider.of<QuranProvider>(context, listen: false);

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
                      // style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: widget.quranAyaArabic.text,
                          style: TextStyle(
                            fontSize: quranProvider.arabicFontSize,
                            fontFamily: quranProvider.arabicFont,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: widget.quranAyaArabic.ayaIndex == 0
                              ? ''
                              : QuranHelper.getVerseEndSymbol(
                              widget.quranAyaArabic.ayaIndex),
                          // No font applied to this portion
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
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
      iconColor: Colors.green.shade700,
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
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        PopupMenuButton<String>(
          color: Colors.green.shade100,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              onTap: () {
                VerseHelper.shareVerse(
                    VerseHelper.getVerseCopy(
                    widget.quranAyaArabic,
                    widget.quranAyaTranslation,
                    quranProvider.selectedSuraNumber,
                    'copy'));
              },
              child: getPopupMenuItem(Icons.share, 'Share'),
            ),
            PopupMenuItem<String>(
              onTap: () {
                BookmarkHelper.addBookmark(
                  Bookmark(
                    suraNumber: quranProvider.selectedSuraNumber.toString(),
                    verseNumber: widget.quranAyaTranslation.ayaIndex.toString(),
                  ),
                  context,
                );
              },
              child:
              getPopupMenuItem(Icons.bookmark_add_outlined, 'Add Bookmark'),
            ),
            PopupMenuItem<String>(
              value: 'copy',
              onTap: () {
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(
                        widget.quranAyaArabic,
                        widget.quranAyaTranslation,
                        quranProvider.selectedSuraNumber,
                        'copy'),
                    context);
              },
              child: getPopupMenuItem(Icons.copy, 'Copy Arabic + Translation'),
            ),
            PopupMenuItem<String>(
              onTap: () {
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(
                        widget.quranAyaArabic,
                        widget.quranAyaTranslation,
                        quranProvider.selectedSuraNumber,
                        'copy_arabic'),
                    context);
              },
              child: getPopupMenuItem(Icons.copy, 'Copy Arabic'),
            ),
            PopupMenuItem<String>(
              onTap: () {
                VerseHelper.copyToClipboard(
                    VerseHelper.getVerseCopy(
                        widget.quranAyaArabic,
                        widget.quranAyaTranslation,
                        quranProvider.selectedSuraNumber,
                        'copy_translation'),
                    context);
              },
              child: getPopupMenuItem(Icons.copy, 'Copy Translation'),
            ),
          ],
          child: const Icon(Icons.more_vert),
        )
      ],
    );
  }
}
