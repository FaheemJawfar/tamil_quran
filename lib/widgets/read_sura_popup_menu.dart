import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import '../app_texts/app_widgets_texts.dart';
import '../helpers/verse_helper.dart';
import '../providers/quran_provider.dart';
import '../screens/search_screen.dart';
import '../widgets/sura_verse_picker.dart';
import '../screens/settings_screen.dart';

class ReadSuraPopupMenu extends StatefulWidget {
  const ReadSuraPopupMenu({super.key});

  @override
  State<ReadSuraPopupMenu> createState() => _ReadSuraPopupMenuState();
}

class _ReadSuraPopupMenuState extends State<ReadSuraPopupMenu> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: PopupMenuButton<String>(
          color: quranProvider.isDarkMode ? null : Colors.green.shade100,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'settings',
              child: getPopupMenuItem(
                  Icons.settings, AppWidgetsTexts.settingsTranslation),
            ),
            PopupMenuItem<String>(
              value: 'go_to_verse',
              child: getPopupMenuItem(
                  Icons.shuffle, AppWidgetsTexts.goToVerseTranslation),
            ),
            PopupMenuItem<String>(
              value: 'share_sura',
              child: getPopupMenuItem(
                  Icons.mobile_screen_share, AppWidgetsTexts.shareThisChapter),
            ),
            PopupMenuItem<String>(
              value: 'search',
              child: getPopupMenuItem(
                  Icons.search, AppWidgetsTexts.searchInQuranTranslation),
            ),
          ],
          onSelected: (String value) {
            switch (value) {
              case 'settings':
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()));
                break;
              case 'go_to_verse':
                _showVersePicker(context);
                break;
              case 'share_sura':
                VerseHelper.copySura(
                    quranProvider.selectedSuraArabic,
                    quranProvider.selectedSuraTranslation,
                    quranProvider.selectedSuraNumber,
                    quranProvider.selectedTranslationName,
                    context);
                break;
              case 'search':
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SearchScreen()));
                break;
            }
          },
          child: const Icon(Icons.more_vert),
        ));
  }

  Widget getPopupMenuItem(IconData icon, String title) {
    return ListTile(
      iconColor: quranProvider.isDarkMode ? null : ColorConfig.buttonColor,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
    );
  }

  void _showVersePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SuraVersePickerScreen();
      },
    );
  }
}
