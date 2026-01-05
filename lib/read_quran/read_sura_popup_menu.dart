import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:provider/provider.dart';
import '../app_texts/common_widget_texts.dart';
import '../app_texts/read_quran_texts.dart';
import '../app_config/color_config.dart';
import 'verse_helper.dart';
import '../providers/quran_provider.dart';
import '../search/search_screen.dart';
import '../home/sura_verse_picker.dart';
import '../settings/settings_screen.dart';

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
          color: quranProvider.isDarkMode ? null : ColorConfig.popupColor,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'settings',
              child: getPopupMenuItem(
                  LucideIcons.settings, CommonWidgetTexts.settingsTranslation),
            ),
            PopupMenuItem<String>(
              value: 'go_to_verse',
              child: getPopupMenuItem(
                  LucideIcons.navigation, ReadQuranTexts.goToVerseTranslation),
            ),
            PopupMenuItem<String>(
              value: 'share_sura',
              child: getPopupMenuItem(
                  LucideIcons.share2, ReadQuranTexts.shareThisChapter),
            ),
            PopupMenuItem<String>(
              value: 'search',
              child: getPopupMenuItem(
                  LucideIcons.search, ReadQuranTexts.searchInQuranTranslation),
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
                VerseHelper.copySura(quranProvider.selectedSuraNumber, context);
                break;
              case 'search':
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SearchScreen()));
                break;
            }
          },
          child: const Icon(LucideIcons.ellipsisVertical),
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
