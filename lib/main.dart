import 'package:flutter/material.dart';
import './sura_namelist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tamil Quran',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const SuraNames(),
    );
  }
}
