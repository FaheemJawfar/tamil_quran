import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/screens/read_sura_screen.dart';

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
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: quranProvider.suraList.length,
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              color: ColorConfig.primaryColor,
            ),
            itemBuilder: (BuildContext context, int index) {
              final sura = quranProvider.suraList[index];

              return ListTile(
                leading: Text('${sura.suraNumber}. ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),

                ),
                title: Text(
                  sura.tamilName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),

                ),
                subtitle: Text('வசனங்கள்: ${sura.verseCount}'),
                trailing: Image.asset('assets/images/sura_headers/Surah_${sura.suraNumber}.png'),
                onTap: () {
                  quranProvider.setSelectedSura(sura.suraNumber);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReadSuraScreen(arabicOnly: true,),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
