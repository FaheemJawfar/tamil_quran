import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:provider/provider.dart';
import '../app_config/color_config.dart';
import '../app_texts/home_texts.dart';
import '../read_quran/sura_details.dart';
import '../read_quran/sura_arabic_screen.dart';
import '../providers/quran_provider.dart';
import '../utils/shared_preferences.dart';

class SuraListArabicScreen extends StatefulWidget {
  const SuraListArabicScreen({Key? key}) : super(key: key);

  @override
  State<SuraListArabicScreen> createState() => _SuraListArabicScreenState();
}

class _SuraListArabicScreenState extends State<SuraListArabicScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          quranProvider.isDarkMode ? null : ColorConfig.backgroundColor,
      body: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              int pageNumber = AppPreferences.getInt('lastPageNumber') ?? 1;
              int suraNumber = AppPreferences.getInt('lastSuraNumber') ?? 1;
              quranProvider.selectedSuraNumber = suraNumber;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SuraArabicScreen(initialPageNumber: pageNumber),
                ),
              );
            },
            label: const Text('Continue...'),
            icon: const Icon(LucideIcons.bookOpen),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  ColorConfig.primaryColor, // Replace with your desired color
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: SuraDetails.suraListAll.length,
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color:
                    quranProvider.isDarkMode ? null : ColorConfig.primaryColor,
              ),
              itemBuilder: (BuildContext context, int index) {
                final sura = quranProvider.selectedTranslation == 'pj'
                    ? SuraDetails.suraListPj[index]
                    : SuraDetails.suraListAll[index];

                return ListTile(
                  leading: Text(
                    '${sura.suraNumber}. ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: quranProvider.isDarkMode
                          ? Colors.white
                          : ColorConfig.textSecondaryLight,
                    ),
                  ),
                  title: Text(
                    sura.tamilName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: quranProvider.isDarkMode
                          ? Colors.white
                          : ColorConfig.textLight,
                    ),
                  ),
                  subtitle: Text('${HomeTexts.verseCount} ${sura.verseCount}'),
                  trailing: Image.asset(
                    'assets/images/sura_headers/Surah_${sura.suraNumber}.png',
                    color: quranProvider.isDarkMode
                        ? ColorConfig.textDark
                        : ColorConfig.textLight,
                  ),
                  onTap: () {
                    quranProvider.selectedSuraNumber = sura.suraNumber;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SuraArabicScreen(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
