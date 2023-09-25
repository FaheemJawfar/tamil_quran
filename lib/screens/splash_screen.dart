import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/models/quran_hadith_about_quran.dart';
import 'package:tamil_quran/widgets/loading_indicator.dart';
import '../providers/quran_provider.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  bool isLoading = false;
  late final quranProvider = Provider.of<QuranProvider>(context, listen: false);
  int selectedQuoteNumber = 0;

  @override
  void initState() {
    super.initState();
    loadQuranData();
    getRandomQuote();
    checkQuranDb();
  }

  void loadQuranData() async {
    setState(() {
      isLoading = true;
    });
    await quranProvider.loadQuranArabic();
    await quranProvider.loadTranslation();
    isLoading = false;
  }

  getRandomQuote() {
    selectedQuoteNumber =
        Random().nextInt(QuranHadithAboutQuran.listOfVersesAndHadhiths.length);
  }

  void checkQuranDb() {
    Timer(const Duration(seconds: 5), () {
      if (isLoading) {
        checkQuranDb();
      } else {
        setState(() {});
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading ? _buildSplash() : const HomeScreen(),
      ),
    );
  }


  Widget _buildSplash() {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorConfig.backgroundColor,
              ColorConfig.primaryColor,
              Colors.green.shade600,
              Colors.green.shade900,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 25),
          child: Column(
            children: [
              Image.asset(
                'assets/icon/quran_icon.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'திருக்குர்ஆன்',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'அரபு மூலம் மற்றும் மொழிபெயர்ப்பு',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const Divider(),
              const Spacer(),
              Text(
                QuranHadithAboutQuran
                    .listOfVersesAndHadhiths[selectedQuoteNumber].quote,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                QuranHadithAboutQuran
                    .listOfVersesAndHadhiths[selectedQuoteNumber].reference,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              const LoadingIndicator(
                size: 25,
              ),
            ],
          ),
        ),
      
    );
  }
}
