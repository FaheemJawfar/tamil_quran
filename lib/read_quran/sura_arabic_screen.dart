import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quran_provider.dart';
import '../utils/shared_preferences.dart';
import 'read_sura_appbar.dart';
import 'quran_page_data.dart';

class SuraArabicScreen extends StatefulWidget {
  final int? initialPageNumber;

  const SuraArabicScreen({Key? key, this.initialPageNumber}) : super(key: key);

  @override
  State<SuraArabicScreen> createState() => _SuraArabicScreenState();
}

class _SuraArabicScreenState extends State<SuraArabicScreen> {
  late final PageController pageController;
  late QuranProvider quranProvider;
  Timer? debounceTimer;
  int? lastPageNumber;

  @override
  void initState() {
    super.initState();
    // Set initial page, default to page 603 if no initialPageNumber is provided
    int initialPage = 604 - (widget.initialPageNumber ?? 0);
    pageController = PageController(initialPage: initialPage);

    pageController.addListener(() {
      int currentPageNumber = (604 - pageController.page!.round()).toInt();

      // Debounce to avoid frequent updates during fast scrolling
      debounceTimer?.cancel();
      debounceTimer = Timer(const Duration(milliseconds: 200), () {
        if (lastPageNumber != currentPageNumber) {
          lastPageNumber = currentPageNumber;
          updateCurrentSura(currentPageNumber);
        }
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      quranProvider = Provider.of<QuranProvider>(context, listen: false);
      if (widget.initialPageNumber == null) {
        // Smooth scroll to the selected Sura's starting page if no initial page is provided
        int selectedSuraNumber = quranProvider.selectedSuraNumber;
        int selectedSuraStartingPage =
            MadaniDataSource().pageForSuraArray[selectedSuraNumber - 1];

        int targetPage = 604 - selectedSuraStartingPage; // Account for reversed navigation
        pageController.animateToPage(
          targetPage,
          duration: const Duration(milliseconds: 10),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    quranProvider = Provider.of<QuranProvider>(context);

    return Scaffold(
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
    debounceTimer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  void updateCurrentSura(int pageNumber) {
    int suraNumber = MadaniDataSource().suraForPageArray[pageNumber - 1];
    AppPreferences.setInt('lastPageNumber', pageNumber);
    AppPreferences.setInt('lastSuraNumber', suraNumber);
    quranProvider.selectedSuraNumber = suraNumber;

    print("Updated Sura Number: $suraNumber");
    print("Updated Page Number: $pageNumber");
  }
}
