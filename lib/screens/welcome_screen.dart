import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/screens/home_screen.dart';
import 'package:tamil_quran/screens/splash_screen.dart';
import '../providers/quran_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool dbInitiated = false;

  @override
  void initState() {
    super.initState();
    loadDb();
    checkQuranDb();
  }

  loadDb() async {
    context.read<QuranProvider>().loadQuranData();
  }

  void checkQuranDb() {
    Timer(const Duration(seconds: 5), () {
      if (context.read<QuranProvider>().allVersesOfQuran.isNotEmpty) {
        setState(() {
          dbInitiated = true;
        });
      } else {
        checkQuranDb();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return dbInitiated ? const HomeScreen() : const SplashScreen();
  }
}
