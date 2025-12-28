import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/read_quran/quran_page_data.dart';
import '../providers/quran_provider.dart';
import '../utils/shared_preferences.dart';
import 'read_sura_appbar.dart';

class SuraArabicScreen extends StatefulWidget {
  const SuraArabicScreen({Key? key}) : super(key: key);

  @override
  State<SuraArabicScreen> createState() => _SuraArabicScreenState();
}

class _SuraArabicScreenState extends State<SuraArabicScreen> {
  late final PageController pageController;
  late QuranProvider quranProvider;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 603); // Open on page001 (reversed)

    // Listen to page changes
    pageController.addListener(() {
      int pageNumber = (604 - pageController.page!.round()).toInt(); // Get current page number
      updateCurrentSura(pageNumber); // Update selected Sura
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      quranProvider = Provider.of<QuranProvider>(context, listen: false);
      int selectedSuraNumber = quranProvider.selectedSuraNumber;
      int selectedSuraStartingPage =
      MadaniDataSource().pageForSuraArray[selectedSuraNumber - 1];

      // Smooth scroll to the selected Sura's starting page
      int targetPage = 604 - selectedSuraStartingPage; // Account for reversed navigation
      pageController.animateToPage(
        targetPage,
        duration: const Duration(milliseconds: 10),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    quranProvider = Provider.of<QuranProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ReadSuraAppBar(
        arabicOnly: true,
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: 604, // Total Quran pages
        itemBuilder: (context, index) {
          final pageNumber = (604 - index).toString().padLeft(3, '0'); // Format with leading zeros
          return Image.asset(
            'assets/quran_pages/page$pageNumber.png',
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  void updateCurrentSura(int pageNumber) {
    print(pageNumber);
    int suraNumber = MadaniDataSource().suraForPageArray[pageNumber - 1];
    if (quranProvider.selectedSuraNumber != suraNumber) {
      quranProvider.selectedSuraNumber = suraNumber;
      print("Updated Sura Number: $suraNumber");
    }
      AppPreferences.setInt('lastSeenPageArabic', pageNumber);
      print(AppPreferences.getInt("lastSeenPageArabic"));


  }



  void updateCurrentSura2(int pageNumber) {
    // Find the sura corresponding to the page number using pageForSuraArray
    int suraNumber = 1; // Default to first sura (assuming Sura 1 starts on page 1)

    // Iterate through pageForSuraArray to find the sura number for the given page number
    for (int i = 0; i < MadaniDataSource().pageForSuraArray.length; i++) {
      if (pageNumber >= MadaniDataSource().pageForSuraArray[i]) {
        suraNumber = i + 1; // Sura numbers are 1-based
      } else {
        break;
      }
    }

    // Only update if the sura number has changed
    if (quranProvider.selectedSuraNumber != suraNumber) {
      quranProvider.selectedSuraNumber = suraNumber;
      print("Updated Sura Number: $suraNumber");
    }
  }

}
