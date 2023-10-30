import 'package:flutter/material.dart';
import 'package:tamil_quran/app_texts/home_texts.dart';
import 'package:tamil_quran/read_quran/pj_thafseer.dart';
import 'package:tamil_quran/read_quran/read_thafseer_screen.dart';

class ThafseerScreen extends StatefulWidget {
  const ThafseerScreen({Key? key}) : super(key: key);

  @override
  State<ThafseerScreen> createState() => _ThafseerScreenState();
}

class _ThafseerScreenState extends State<ThafseerScreen> {
  // Define a list of titles
  final List<String> titles = [
    'Title 1',
    'Title 2',
    'Title 3',
    'Title 4',
    // Add more titles as needed
  ];

  @override
  Widget build(BuildContext context) {
    List<PJExplanation> allThafseer = PJExplanation.getAllThafseer();
    return Scaffold(
      appBar: AppBar(
        title: const Text(HomeTexts.explanation),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: allThafseer.length,
        itemBuilder: (context, index) {
          String thafseerHeader = '${index + 1}. ${allThafseer[index].header}';
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(thafseerHeader, style: const TextStyle(fontSize: 18),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReadThafseerScreen(
                    header: thafseerHeader,
                    content: allThafseer[index].content,
                    thafseerNumber: index + 1,
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
