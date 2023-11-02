import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/app_texts/home_texts.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'package:tamil_quran/read_quran/pj_thafseer_content.dart';
import 'package:tamil_quran/read_quran/read_thafseer_screen.dart';
import 'package:tamil_quran/read_quran/thafseer.dart';
import 'package:tamil_quran/read_quran/tntj_thafseer_content.dart';

class ThafseerScreen extends StatefulWidget {
  const ThafseerScreen({Key? key}) : super(key: key);

  @override
  State<ThafseerScreen> createState() => _ThafseerScreenState();
}

class _ThafseerScreenState extends State<ThafseerScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {

    List allThafseer = quranProvider.selectedTranslation == 'pj'
        ? Thafseer.getAllThafseer(PJThafseerContent.thafseerList)
        : quranProvider.selectedTranslation == 'tntj'
            ?  Thafseer.getAllThafseer(TNTJThafseerContent.thafseerList)
            : [];
    return Scaffold(
      appBar: AppBar(
        title: const Text(HomeTexts.explanation),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: allThafseer.length,
        itemBuilder: (context, index) {
          String thafseerHeader =
              '${allThafseer[index].index}. ${allThafseer[index].header}';
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  thafseerHeader,
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReadThafseerScreen(
                               selectedThafseer: allThafseer[index],
                               writtenBy: quranProvider.translations[quranProvider.selectedTranslation]!,
                              )));
                },
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
            ],
          );
        },
      ),
    );
  }
}
