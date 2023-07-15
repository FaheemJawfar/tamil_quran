import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/screens/read_sura.dart';

import '../models/sura_list.dart';
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
    return ListView.builder(
      itemCount: quranProvider.suraList.length,
      itemBuilder: (BuildContext context, int index) {
        final sura = quranProvider.suraList[index];

        return Card(
          child: ListTile(
            leading: Text(
              '${sura.suraNumber}.',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            title: Text(
              sura.tamilMeaning == null
                  ? sura.tamilName
                  : '${sura.tamilName} (${sura.tamilMeaning})',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text('வசனங்கள்: ${sura.verseCount}'),
            ),
            trailing: Text(
              sura.arabicName,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReadSuraScreen(
                    selectedSura: sura.suraNumber,
                    // suraName: sura.tamilName,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
