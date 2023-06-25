import 'package:flutter/material.dart';
import 'package:tamil_quran/models/sura_list.dart';
import 'package:tamil_quran/screens/read_sura.dart';
import 'package:tamil_quran/screens/search_screen.dart';
import 'package:tamil_quran/screens/sura_verse_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ஸூரா அட்டவணை'),
          centerTitle: true,

          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const SuraVersePickerScreen();
                    },
                  );
                },
                icon: const Icon(Icons.open_in_new)),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.search))
          ],
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
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                      title: Text(
                          sura.tamilMeaning == null ? sura.tamilName : '${sura
                              .tamilName} (${sura.tamilMeaning})',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),

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
                              suraName: sura.tamilName,
                            ),
                          ),
                        );
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
