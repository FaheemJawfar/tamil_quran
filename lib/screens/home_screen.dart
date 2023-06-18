import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/models/sura_list.dart';
import 'package:tamil_quran/models/translation_model.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'package:tamil_quran/screens/read_sura.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    loadDb();
  }

  loadDb() async {
    context.read<QuranProvider>().loadTranslationsFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ஸூரா அட்டவணை'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: QuranData.suras.length,
                itemBuilder: (BuildContext context, int index) {
                  final sura = QuranData.suras[index];

                  return Card(
                    child: ListTile(
                      leading: Text(
                        '${sura.suraNumber}.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(sura.tamilName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text('வசனங்கள்: ${sura.verseCount}'),
                      ),
                      trailing: Text(
                        sura.arabicName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      onTap: () {
                        if (context
                            .read<QuranProvider>()
                            .translations
                            .isNotEmpty) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReadSuraScreen(
                                        selectedSura: sura.suraNumber,
                                        suraName: sura.tamilName,
                                      )));
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
