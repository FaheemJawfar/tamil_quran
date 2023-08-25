import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';
import 'package:tamil_quran/screens/read_sura_screen.dart';

import '../providers/quran_provider.dart';

class SuraListArabicScreen extends StatefulWidget {
  const SuraListArabicScreen({Key? key}) : super(key: key);

  @override
  State<SuraListArabicScreen> createState() => _SuraListArabicScreenState();
}

class _SuraListArabicScreenState extends State<SuraListArabicScreen> {
  late final quranProvider = context.read<QuranProvider>();


  String convertToArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }



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
                trailing: Text(
                  '${convertToArabicNumber(sura.suraNumber.toString())}.',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                title: Text(
                  sura.arabicName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                subtitle: Text('${sura.tamilName}\nவசனங்கள்: ${sura.verseCount}'),
                // trailing: Text(
                //   sura.arabicName,
                //   style: const TextStyle(
                //       fontWeight: FontWeight.bold, fontSize: 16),
                //   textDirection: TextDirection.rtl,
                // ),
                onTap: () {
                  quranProvider.setSelectedSura(sura.suraNumber);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReadSuraScreen(),
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
