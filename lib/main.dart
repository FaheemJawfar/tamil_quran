import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/app_config.dart';
import '../helpers/shared_preferences.dart';
import '../providers/quran_provider.dart';
import '../screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.initialize();
  runApp(const MyApp());

  //AppPreferences.setBool('isDarkMode', true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuranProvider()),
      ],

      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: AppConfig.appName,
            debugShowCheckedModeBanner: false,
            theme: context.watch<QuranProvider>().quranTheme,
            home: const SplashScreen(),
          );
        }
      ),
    );
  }
}
