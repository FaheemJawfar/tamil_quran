import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../app_texts/app_widgets_texts.dart';
import '../config/app_config.dart';
import '../config/color_config.dart';
import '../screens/about_us.dart';
import '../screens/search_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/donation_screen.dart';
import '../screens/quran_audio_screen.dart';
import 'rate_app.dart';
import 'sura_verse_picker.dart';

class QuranAppDrawer extends StatelessWidget {
  const QuranAppDrawer({super.key});

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
      backgroundColor: ColorConfig.backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorConfig.primaryColor,
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
                    AppWidgetsTexts.appNameSubtitle,
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
          _buildListTiles(
              _buildImageIcon('assets/images/quran-audio.png'),
              AppWidgetsTexts.quranAudio,
              context,
              const QuranAudioPlayerScreen()),
          _buildListTiles(const Icon(Icons.search),
              AppWidgetsTexts.searchInQuran, context, const SearchScreen()),
          _buildActionListTiles(
            const Icon(Icons.shuffle_sharp),
            (AppWidgetsTexts.goToVerse),
            context,
            () => _showVersePicker(context),
          ),
          _buildListTiles(
              const Icon(Icons.settings),
              AppWidgetsTexts.settingsTranslation,
              context,
              const SettingsScreen()),
          _buildActionListTiles(const Icon(Icons.share),
              AppWidgetsTexts.shareThisAppTranslation, context, () {
            Share.share(AppWidgetsTexts.shareAppText);
          }),
          _buildActionListTiles(const Icon(Icons.rate_review_outlined),
              AppWidgetsTexts.rateAppTranslation, context, () {
            _showRating(context);
          }),
          _buildListTiles(
              const Icon(Icons.info),
              AppWidgetsTexts.aboutUsTranslation,
              context,
              const AboutUsScreen()),
          _buildListTiles(
              _buildImageIcon('assets/images/heart.png'),
              AppWidgetsTexts.donateUsTranslation,
              context,
              const DonationScreen()),
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

  void _showRating(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const RateApp();
      },
    );
  }
}
