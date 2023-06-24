import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  late final List<TranslationModel> allVersesOfSura;
  late final bool hasBismi;
  late final _scrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    allVersesOfSura =
        context.read<QuranProvider>().filterBySura(widget.selectedSura);
    hasBismi = widget.selectedSura != 1 && widget.selectedSura != 9;

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

  Widget createAyah(int index) {
    TranslationModel translation = allVersesOfSura[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${translation.aya}. ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              PopupMenuButton<String>(
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'option1',
                    child: Text('Option 1'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'option2',
                    child: Text('Option 2'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'option3',
                    child: Text('Option 3'),
                  ),
                ],
                onSelected: (String value) {
                  switch (value) {
                    case 'option1':
                      // Handle option 1 selection
                      break;
                    case 'option2':
                      // Handle option 2 selection
                      break;
                    case 'option3':
                      // Handle option 3 selection
                      break;
                  }
                },
                child: const Icon(Icons.more_vert),
              )
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  ' ${translation.arabic}${getVerseEndSymbol(translation.aya)}',
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
        Divider(
          color: Colors.black,
        ),
      ],
    );
  }

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
            child: ScrollablePositionedList.builder(
              itemScrollController: _scrollController,
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
                  return createAyah(adjustedIndex);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
