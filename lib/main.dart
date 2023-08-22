import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/helpers/shared_preferences.dart';
import 'package:tamil_quran/providers/quran_provider.dart';
import 'package:tamil_quran/screens/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initialize();
  Preferences.setString('tamilFont', 'MuktaMalar');
  debugPrint(Preferences.getString('tamilFont'));
  runApp(const MyApp());
  Preferences.setString('selectedTranslation', 'mJohn');

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
        title: 'Tamil Quran',
        theme: ThemeData(
            primarySwatch: Colors.green,
            brightness: Brightness.light,
            fontFamily: Preferences.getString('tamilFont')),
        debugShowCheckedModeBanner: false,
        home: const WelcomeScreen(),
      ),
    );
  }
}
