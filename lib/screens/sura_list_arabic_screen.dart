import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/models/sura_details.dart';
import 'package:tamil_quran/screens/sura_arabic_screen.dart';
import '../providers/quran_provider.dart';

class SuraListArabicScreen extends StatefulWidget {
  const SuraListArabicScreen({Key? key}) : super(key: key);

  @override
  State<SuraListArabicScreen> createState() => _SuraListArabicScreenState();
}

class _SuraListArabicScreenState extends State<SuraListArabicScreen> {
  late final quranProvider = context.read<QuranProvider>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: SuraDetails.suraList.length,
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: ColorConfig.primaryColor,
              ),
              itemBuilder: (BuildContext context, int index) {
                final sura = SuraDetails.suraList[index];

                return ListTile(
                  leading: Text(
                    '${sura.suraNumber}. ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey),
                  ),
                  title: Text(
                    sura.tamilName,
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
