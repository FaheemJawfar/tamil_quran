import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'package:tamil_quran/screens/home_screen.dart';
import 'package:tamil_quran/screens/sura_verse_picker.dart';
import 'package:tamil_quran/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuranProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(
            primarySwatch: Colors.green, brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}
