import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';

import '../models/translation_model.dart';
import '../providers/quran_provider.dart';

class ReadSuraScreen extends StatefulWidget {
  final int selectedSura;
  final String suraName;

  const ReadSuraScreen({
    required this.selectedSura,
    required this.suraName,
    Key? key,
  }) : super(key: key);

  @override
  _ReadSuraScreenState createState() => _ReadSuraScreenState();
}

class _ReadSuraScreenState extends State<ReadSuraScreen> {
  late final List<TranslationModel> allVersesOfSura =
      context.read<QuranProvider>().filterBySura(widget.selectedSura);

  late final bool hasBismi =
      widget.selectedSura != 1 && widget.selectedSura != 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.suraName,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: allVersesOfSura.length + (hasBismi ? 1 : 0),
              itemBuilder: (BuildContext context, int index) {
                if (hasBismi && index == 0) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'அளவற்ற அருளாளனும், நிகரற்ற அன்புடையோனுமாகிய அல்லாஹ்வின் திருப்பெயரால்(துவங்குகிறேன்)',
                          style: TextStyle(fontSize: 14),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                      ],
                    ),
                  );
                } else {
                  int adjustedIndex = hasBismi ? index - 1 : index;
                  // print(getVerseEndSymbol(translation.aya));
                  return createAyah(adjustedIndex);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget createAyah(int index) {
    TranslationModel translation = allVersesOfSura[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${translation.aya}. ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  ' ${translation.arabic} ${getVerseEndSymbol(translation.aya)}',
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 8),
              Text(
                translation.mJohn,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
