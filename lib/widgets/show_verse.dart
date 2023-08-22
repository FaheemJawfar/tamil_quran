import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/helpers/bookmark_helper.dart';
import 'package:tamil_quran/helpers/verse_options.dart';
import 'package:tamil_quran/models/bookmark.dart';
import 'package:tamil_quran/models/verse.dart';

class ShowVerse extends StatefulWidget {
  final VerseModel verseModel;

  const ShowVerse({required this.verseModel, Key? key}) : super(key: key);

  @override
  State<ShowVerse> createState() => _ShowVerseState();
}

class _ShowVerseState extends State<ShowVerse> {
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
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              PopupMenuButton<String>(
                color: Colors.green.shade100,
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'copy',
                    child: getPopupMenuItem(Icons.copy, 'Copy Arabic + Tamil'),
                  ),
                  PopupMenuItem<String>(
                    value: 'share',
                    child: getPopupMenuItem(Icons.share, 'Share'),
                  ),
                  PopupMenuItem<String>(
                    value: 'bookmark',
                    child: getPopupMenuItem(
                        Icons.bookmark_add_outlined, 'Add Bookmark'),
                  ),
                  PopupMenuItem<String>(
                    value: 'copy_arabic',
                    child: getPopupMenuItem(Icons.copy, 'Copy Arabic'),
                  ),
                  PopupMenuItem<String>(
                    value: 'copy_tamil',
                    child: getPopupMenuItem(Icons.copy, 'Copy Tamil'),
                  ),
                ],
                onSelected: (String value) {
                  switch (value) {
                    case 'copy':
                      VerseHelper.copyToClipboard(
                          VerseHelper.getVerseCopy(widget.verseModel, 'copy') );
                      break;
                    case 'share':
                      VerseHelper.shareVerse(VerseHelper.getVerseCopy(widget.verseModel, 'copy'));
                      break;
                    case 'bookmark':
                      BookmarkHelper.addBookmark(Bookmark(
                          suraNumber: widget.verseModel.sura.toString(),
                          verseNumber: widget.verseModel.aya.toString()));
                      break;
                    case 'copy_arabic':
                      VerseHelper.copyToClipboard(
                        VerseHelper.getVerseCopy(widget.verseModel, 'copy_arabic'), );
                      break;
                    case 'copy_tamil':
                      VerseHelper.copyToClipboard(
                        VerseHelper.getVerseCopy(widget.verseModel,  'copy_tamil'),);
                      break;
                  }
                },
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
                child: Text(
                  '${widget.verseModel.arabic}${getVerseEndSymbol(widget.verseModel.aya)}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                VerseHelper.getTamilTranslation(widget.verseModel),
                style: const TextStyle(fontSize: 14),
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
