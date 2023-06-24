import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/screens/home_screen.dart';
import 'package:tamil_quran/screens/read_sura.dart';

import '../models/sura_list.dart';
import '../providers/quran_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    loadDb();
    checkConditionAndNavigate();
    super.initState();
  }

  loadDb() async {
    context.read<QuranProvider>().loadTranslationsFromDatabase();
  }

  void checkConditionAndNavigate() {
    Timer? timer;
    timer = Timer(const Duration(seconds: 2), () {
      print('running after 2 sec');
      if (context.read<QuranProvider>().translations.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        checkConditionAndNavigate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF398AE5),
              Color(0xFF478DE0),
              Color(0xFF4A90DB),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quran_icon.png',
              // Replace with your app logo asset
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Quran Tamil Translation',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Explore the Holy Quran in Tamil',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            SpinKitFadingCircle(
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
