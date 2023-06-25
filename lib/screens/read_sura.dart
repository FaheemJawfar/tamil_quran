import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:tamil_quran/models/sura_list.dart';
import 'package:tamil_quran/screens/read_sura_only_arabic.dart';
import 'package:tamil_quran/widgets/show_verse.dart';

import '../models/translation_model.dart';
import '../providers/quran_provider.dart';

class ReadSuraScreen extends StatefulWidget {
  final int selectedSura;
  final String suraName;
  final int scrollTo;

  const ReadSuraScreen({
    required this.selectedSura,
    required this.suraName,
    this.scrollTo = 0,
    Key? key,
  }) : super(key: key);

  @override
  State<ReadSuraScreen> createState() => _ReadSuraScreenState();
}

class _ReadSuraScreenState extends State<ReadSuraScreen> {
  List<TranslationModel> allVersesOfSura = [];
  late final bool hasBismi =
      widget.selectedSura != 1 && widget.selectedSura != 9;
  final _scrollController = ItemScrollController();
  bool arabicOnly = false;

  @override
  void initState() {
    super.initState();
    allVersesOfSura =
        context.read<QuranProvider>().filterBySura(widget.selectedSura);

    if (widget.scrollTo > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToIndex(hasBismi ? widget.scrollTo : widget.scrollTo - 1);
      });
    }
  }

  void scrollToIndex(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.suraName),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  arabicOnly = !arabicOnly;
                });
              },
              icon: const Icon(Icons.menu_book)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.navigate_before)),
          IconButton(
              onPressed: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ReadSuraScreen(
                //         selectedSura: SuraList, suraName: suraName),
                //   ),
                // );
              },
              icon: const Icon(Icons.navigate_next)),
        ],
      ),
      body: arabicOnly
          ? ReadSuraOnlyArabic(allVersesOfSura: allVersesOfSura)
          : Column(
              children: [
                Expanded(
                  child: ScrollablePositionedList.builder(
                    itemScrollController: _scrollController,
                    itemCount: allVersesOfSura.length + (hasBismi ? 1 : 0),
                    itemBuilder: (BuildContext context, int index) {
                      if (hasBismi && index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
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
                        return ShowVerse(
                          verseModel: allVersesOfSura[adjustedIndex],
                        );
                      }
                    },
            ),
          ),
        ],
      ),
    );
  }
}
