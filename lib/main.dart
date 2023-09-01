import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'package:tamil_quran/providers/settings_provider.dart';
import 'package:tamil_quran/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initialize();
 //Preferences.clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuranProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: MaterialApp(
        title: 'Tamil Quran',
        theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.light,
          fontFamily: 'MuktaMalar',
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
