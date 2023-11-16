import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tamil_quran/read_quran/thafseer_screen.dart';
import '../app_texts/home_texts.dart';
import '../app_config/app_config.dart';
import '../app_config/color_config.dart';
import '../providers/quran_provider.dart';
import '../about/about_us.dart';
import '../search/search_screen.dart';
import '../settings/settings_screen.dart';
import '../support_us/support_screen.dart';
import '../quran_audio/quran_audio_screen.dart';
import 'sura_verse_picker.dart';

class QuranAppDrawer extends StatefulWidget {
  const QuranAppDrawer({super.key});

  @override
  State<QuranAppDrawer> createState() => _QuranAppDrawerState();
}

class _QuranAppDrawerState extends State<QuranAppDrawer> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  ListTile _buildListTiles(
      Widget icon, String title, BuildContext context, Widget screen) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }

  ListTile _buildActionListTiles(
      Widget icon, String title, BuildContext context, VoidCallback onTap) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:
          quranProvider.isDarkMode ? null : ColorConfig.backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: quranProvider.isDarkMode
                  ? Colors.black45
                  : ColorConfig.primaryColor,
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppConfig.appName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    HomeTexts.appNameSubtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          if(quranProvider.isPJMode) _buildListTiles(const Icon(Icons.notes),
              HomeTexts.explanation, context, const ThafseerScreen()),

          _buildListTiles(
              _buildImageIcon('assets/images/quran-audio.png'),
              HomeTexts.quranAudio,
              context,
              const QuranAudioPlayerScreen()),
          _buildListTiles(const Icon(Icons.search),
              HomeTexts.searchInQuran, context, const SearchScreen()),
          _buildActionListTiles(
            _buildImageIcon('assets/images/fast-forward.png'),
            (HomeTexts.goToVerse),
            context,
            () => _showVersePicker(context),
          ),
          _buildListTiles(
              const Icon(Icons.settings),
              HomeTexts.settingsTranslation,
              context,
              const SettingsScreen()),
          _buildActionListTiles(const Icon(Icons.share),
              HomeTexts.shareThisAppTranslation, context, () {
            Share.share(HomeTexts.shareAppText);
          }),

          _buildListTiles(
              const Icon(Icons.info),
              HomeTexts.aboutUsTranslation,
              context,
              const AboutUsScreen()),
          _buildListTiles(
              _buildImageIcon('assets/images/donation.png'),
              HomeTexts.donateUsTranslation,
              context,
              const SupportUsScreen()),
          // _buildActionListTiles(const Icon(Icons.update),
          //     HomeTexts.checkForUpdates, context, () {
          //   Launcher.findDeviceModelAndLaunchAppStore();
          // }),
        ],
      ),
    );
  }

  Widget _buildImageIcon(String imagePath) {
    return ImageIcon(
      AssetImage(imagePath),
    );
  }

  void _showVersePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SuraVersePickerScreen();
      },
    );
  }

  // void _showRating(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const RateApp();
  //     },
  //   );
  // }
}
