import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/app_config.dart';
import '../app_texts/app_screen_texts.dart';
import '../config/color_config.dart';
import '../helpers/shared_preferences.dart';
import '../models/sura_details.dart';
import '../screens/sura_translation_screen.dart';
import '../providers/quran_provider.dart';

class SuraListTamilScreen extends StatefulWidget {
  const SuraListTamilScreen({Key? key}) : super(key: key);

  @override
  State<SuraListTamilScreen> createState() => _SuraListTamilScreenState();
}

class _SuraListTamilScreenState extends State<SuraListTamilScreen> {
  late final quranProvider = context.read<QuranProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppConfig.isDarkMode ? null : ColorConfig.backgroundColor,
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
        style: AppConfig.isDarkMode ? ColorConfig.darkModeButtonStyle : OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.green),
        ),
        child: Text(
          AppScreenTexts.continueReading,
          style: TextStyle(
            color: AppConfig.isDarkMode ? Colors.white : ColorConfig.primaryColor,
          ),
        ),
      );
    }
    return const SizedBox();
  }

  Widget _buildSuraListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: SuraDetails.suraList.length,
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
          color: AppConfig.isDarkMode ? null : ColorConfig.primaryColor,
        ),
        itemBuilder: (BuildContext context, int index) {
          final suraDetails = SuraDetails.suraList[index];

          return ListTile(
            leading: Text(
              '${suraDetails.suraNumber}.',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            title: Text(
              '${suraDetails.tamilName} ${suraDetails.tamilMeaning != null ? '(${suraDetails.tamilMeaning})' : ''}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            subtitle:
                Text('${AppScreenTexts.verseCount} ${suraDetails.verseCount}'),
            trailing: Image.asset(
              'assets/images/sura_headers/Surah_${suraDetails.suraNumber}.png',
              color: AppConfig.isDarkMode ? Colors.white : Colors.black,
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
