import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/app_config/update_config.dart';
import 'app_config/app_config.dart';
import 'utils/shared_preferences.dart';
import '../providers/quran_provider.dart';
import 'home/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.initialize();
  UpdateAppConfig.updatePreferencesFromV1();
  runApp(const MyApp());
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
