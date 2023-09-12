import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/reciter.dart';
import '../providers/quran_provider.dart';
import '../providers/settings_provider.dart';
import '../widgets/pop_up_selector.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {


  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);
  late final settingsProvider =
  Provider.of<SettingsProvider>(context, listen: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PopupSelector<Reciter>(
        listOfItems: settingsProvider.allReciters,
        selectedItem: settingsProvider.getSelectedReciterDetails,
        onSelected: (Reciter? reciter) {
          if (reciter != null) {
            settingsProvider.selectedReciter = reciter.identifier;
          }
        },
        displayNameExtractor: (item) {
          return item.englishName;
        },
      ),
    );
  }
}
