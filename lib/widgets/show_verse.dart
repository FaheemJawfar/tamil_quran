import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';
import 'package:tamil_quran/helpers/bookmark_helper.dart';
import 'package:tamil_quran/helpers/verse_helper.dart';
import 'package:tamil_quran/models/bookmark.dart';
import 'package:tamil_quran/models/verse.dart';
import 'package:tamil_quran/providers/settings_provider.dart';

class ShowVerse extends StatefulWidget {
  final VerseModel verseModel;

  const ShowVerse({required this.verseModel, Key? key}) : super(key: key);

  @override
  State<ShowVerse> createState() => _ShowVerseState();
}

class _ShowVerseState extends State<ShowVerse> {
  late final settingsProvider = Provider.of<SettingsProvider>(context, listen:true);






  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.verseModel.aya}. ',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              PopupMenuButton<String>(
                color: Colors.green.shade100,
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'copy',
                    onTap: () {
                      VerseHelper.copyToClipboard(
                          VerseHelper.getVerseCopy(widget.verseModel, 'copy'),
                          context);
                    },
                    child: getPopupMenuItem(Icons.copy, 'Copy Arabic + Tamil'),
                  ),
                  PopupMenuItem<String>(
                    onTap: () {
                      VerseHelper.shareVerse(
                          VerseHelper.getVerseCopy(widget.verseModel, 'copy'));
                    },
                    child: getPopupMenuItem(Icons.share, 'Share'),
                  ),
                  PopupMenuItem<String>(
                    onTap: () {
                      BookmarkHelper.addBookmark(
                        Bookmark(
                          suraNumber: widget.verseModel.sura.toString(),
                          verseNumber: widget.verseModel.aya.toString(),
                        ),
                        context,
                      );
                    },
                    child: getPopupMenuItem(
                        Icons.bookmark_add_outlined, 'Add Bookmark'),
                  ),
                  PopupMenuItem<String>(
                    onTap: () {
                      VerseHelper.copyToClipboard(
                          VerseHelper.getVerseCopy(
                              widget.verseModel, 'copy_arabic'),
                          context);
                    },
                    child: getPopupMenuItem(Icons.copy, 'Copy Arabic'),
                  ),
                  PopupMenuItem<String>(
                    onTap: () {
                      VerseHelper.copyToClipboard(
                          VerseHelper.getVerseCopy(
                              widget.verseModel, 'copy_tamil'),
                          context);
                    },
                    child: getPopupMenuItem(Icons.copy, 'Copy Tamil'),
                  ),
                ],
                child: const Icon(Icons.more_vert),
              )
            ],
          ),
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
                        text: widget.verseModel.arabic,
                        style: TextStyle(
                          fontSize: settingsProvider.arabicFontSize,
                          fontFamily: settingsProvider.arabicFont,
                            color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: getVerseEndSymbol(widget.verseModel.aya), // No font applied to this portion
                        style: const TextStyle(
                          fontSize: 18,
                            color: Colors.black

                        ),
                      ),
                    ],
                  ),
                )

              ),
              const SizedBox(height: 8),
              Text(
                VerseHelper.getTamilTranslation(widget.verseModel),
                style: TextStyle(
                  fontSize: settingsProvider.tamilFontSize,
                  fontFamily: settingsProvider.tamilFont,

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
}
