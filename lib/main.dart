import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_config/app_config.dart';
import 'utils/shared_preferences.dart';
import '../providers/quran_provider.dart';
import 'home/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.initialize();
  updatePreferencesForUsersUpdatingFromV1();
  runApp(const MyApp());
}


void updatePreferencesForUsersUpdatingFromV1(){
  String? selectedTranslation = AppPreferences.getString('selectedTranslation');

  if(selectedTranslation == 'mJohn' || selectedTranslation == 'm_john'){
    AppPreferences.setString('selectedTranslation', 'john_trust');
  }
  else if(selectedTranslation == 'kingFahd'){
    AppPreferences.setString('selectedTranslation', 'king_fahd');
  }
  else if(selectedTranslation == 'abdulHameed'){
    AppPreferences.setString('selectedTranslation', 'abdul_hameed');
  }
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
