import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';
import 'package:tamil_quran/screens/read_sura_screen.dart';

import '../providers/quran_provider.dart';

class SuraListScreen extends StatefulWidget {
  const SuraListScreen({Key? key}) : super(key: key);

  @override
  State<SuraListScreen> createState() => _SuraListScreenState();
}

class _SuraListScreenState extends State<SuraListScreen> {
  late final quranProvider = context.read<QuranProvider>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Preferences.getInt('lastSeenVerse') != null)
          OutlinedButton(
            onPressed: () {
              int? sura = Preferences.getInt('lastSeenSura');
              int? verse = Preferences.getInt('lastSeenVerse');

              Provider.of<QuranProvider>(context, listen:  false).setSelectedSura(sura!);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReadSuraScreen(
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
                //fontFamily: _selectedTamilFont,
              ),
            ),
          ),
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
                    fontSize: 16,
                  ),
                ),
                subtitle: Text('வசனங்கள்: ${sura.verseCount}'),
                trailing: Text(
                  sura.arabicName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textDirection: TextDirection.rtl,
                ),
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