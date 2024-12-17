import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/read_quran/quran_page_data.dart';
import '../providers/quran_provider.dart';
import 'read_sura_appbar.dart';

class SuraArabicScreen extends StatefulWidget {
  const SuraArabicScreen({Key? key}) : super(key: key);

  @override
  State<SuraArabicScreen> createState() => _SuraArabicScreenState();
}

class _SuraArabicScreenState extends State<SuraArabicScreen> {
  final ScrollController scrollController = ScrollController();
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    int selectedSuraNumber = quranProvider.selectedSuraNumber;
    int selectedSuraNumberStartingPage =
        MadaniDataSource().pageForSuraArray[selectedSuraNumber - 1];
    print(selectedSuraNumberStartingPage);
    return Scaffold(
      appBar: ReadSuraAppBar(
        arabicOnly: true,
        arabicScrollController: scrollController,
      ),
      body: PageView.builder(
        itemCount: 604, // Total Quran pages
        reverse: true, // Right-to-left navigation
        itemBuilder: (context, index) {
          //  final pageNumber = (index + 1).toString().padLeft(3, '0'); // Format with leading zeros
          final pageNumber = (selectedSuraNumberStartingPage + index)
              .toString()
              .padLeft(3, '0'); // Format with leading zeros
          //final pageNumber = selectedSuraNumberStartingPage;
          return Image.asset(
            'assets/quran_pages/page$pageNumber.png',
            // Updated file naming format
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
