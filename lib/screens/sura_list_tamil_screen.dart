import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';
import 'package:tamil_quran/screens/sura_translation_screen.dart';
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
      backgroundColor: ColorConfig.backgroundColor,
      body: Column(
        children: [
          _buildContinueReadingButton(),
          _buildSuraListView(),
        ],
      ),
    );
  }

  Widget _buildContinueReadingButton() {
    if (Preferences.getInt('lastSeenVerse') != null) {
      return OutlinedButton(
        onPressed: () {
          int? sura = Preferences.getInt('lastSeenSura');
          int? verse = Preferences.getInt('lastSeenVerse');

          quranProvider.selectedSura = sura!;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SuraTranslationScreen(
                        goToVerse: verse!,
                      )));
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.green),
        ),
        child: Text(
          'வாசிப்பைத் தொடர்க...',
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
      );
    }
    return const SizedBox();
  }

  Widget _buildSuraListView() {
    return Expanded(
      child: ListView.separated(
        itemCount: quranProvider.suraList.length,
        separatorBuilder: (context, index) => Divider(
          thickness: 1,
          color: ColorConfig.primaryColor,
        ),
        itemBuilder: (BuildContext context, int index) {
          final sura = quranProvider.suraList[index];

          return ListTile(
            leading: Text(
              '${sura.suraNumber}.',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            title: Text(
              sura.tamilMeaning == null
                  ? sura.tamilName
                  : '${sura.tamilName} (${sura.tamilMeaning})',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            subtitle: Text('வசனங்கள்: ${sura.verseCount}'),
            trailing: Image.asset(
                'assets/images/sura_headers/Surah_${sura.suraNumber}.png',
                color: Colors.black),
            onTap: () {
              quranProvider.selectedSura = sura.suraNumber;
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
