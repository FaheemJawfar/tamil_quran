import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/helpers/random_number.dart';
import 'package:tamil_quran/screens/sura_namelist.dart';
import '../providers/quran_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List _quranHadithData = [];

  @override
  void initState() {
    readData();
    getQuranDb();
    super.initState();
    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SuraNameScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade900,
        body: showScreen(),
      ),
    );
  }

  showScreen() {
    if (_quranHadithData.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
                flex: 1,
                child: Image.asset(
                  'assets/images/quran_icon.png',
                  width: 100,
                  height: 100,
                )),
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: AutoSizeText(
                        _quranHadithData[RandomNumber()
                            .getRandomNumber(_quranHadithData.length)]['verse'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontFamily: 'MuktaMalar'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SpinKitThreeBounce(
                    color: Colors.white,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Future<void> readData() async {
    final String response =
        await rootBundle.loadString('assets/importance_of_quran.json');
    final data = await json.decode(response);

    _quranHadithData = data["quran_hadith_data"];
  }

  void getQuranDb() async {
    Provider.of<QuranProvider>(context, listen: false).getSuraNamesFromDb();
    Provider.of<QuranProvider>(context, listen: false)
        .getAllArabicVersesFromDb();
    Provider.of<QuranProvider>(context, listen: false)
        .getAllTamilVersesFromDb();
  }
}
