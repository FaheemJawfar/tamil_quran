import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_config/color_config.dart';
import '../app_texts/home_texts.dart';
import '../utils/shared_preferences.dart';
import '../read_quran/sura_details.dart';
import '../read_quran/sura_translation_screen.dart';
import '../providers/quran_provider.dart';

class SuraListTamilScreen extends StatefulWidget {
  const SuraListTamilScreen({Key? key}) : super(key: key);

  @override
  State<SuraListTamilScreen> createState() => _SuraListTamilScreenState();
}

class _SuraListTamilScreenState extends State<SuraListTamilScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          quranProvider.isDarkMode ? null : ColorConfig.backgroundColor,
      body: Column(
        children: [
          _buildContinueReadingButton(),
          _buildSuraListView(),
        ],
      ),
    );
  }

  Widget _buildContinueReadingButton() {
    if (AppPreferences.getInt('lastSeenVerse') != null) {
      return OutlinedButton(
        onPressed: () {
          int? sura = AppPreferences.getInt('lastSeenSura');
          int? verse = AppPreferences.getInt('lastSeenVerse');
          quranProvider.selectedSuraNumber = sura!;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SuraTranslationScreen(
                        goToVerse: verse!,
                      )));
        },
        style: quranProvider.isDarkMode
            ? ColorConfig.darkModeButtonStyle
            : OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green),
              ),
        child: Text(
          HomeTexts.continueReading,
          style: TextStyle(
            color: quranProvider.isDarkMode
                ? Colors.white
                : ColorConfig.primaryColor,
          ),
        ),
      );
    }
    return const SizedBox();
  }

  Widget _buildSuraListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: SuraDetails.suraListAll.length,
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
          color: quranProvider.isDarkMode ? null : ColorConfig.primaryColor,
        ),
        itemBuilder: (BuildContext context, int index) {
          final suraDetails = quranProvider.selectedTranslation == 'pj' ? SuraDetails.suraListPj[index] : SuraDetails.suraListAll[index];

          return ListTile(
            leading: Text(
              '${suraDetails.suraNumber}.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: quranProvider.isDarkMode ? Colors.white: Colors.black45,
              ),
            ),
            title: Text(
              '${suraDetails.tamilName} ${suraDetails.tamilMeaning != null ? '(${suraDetails.tamilMeaning})' : ''}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: quranProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            subtitle:
                Text('${HomeTexts.verseCount} ${suraDetails.verseCount}'),
            trailing: Image.asset(
              'assets/images/sura_headers/Surah_${suraDetails.suraNumber}.png',
              color: quranProvider.isDarkMode ? Colors.white : Colors.black,
            ),
            onTap: () {
              quranProvider.selectedSuraNumber = suraDetails.suraNumber;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SuraTranslationScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
