import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/screens/about_us.dart';
import 'package:tamil_quran/screens/boomarks_screen.dart';
import 'package:tamil_quran/screens/search_screen.dart';
import 'package:tamil_quran/screens/settings_screen.dart';

import '../screens/quran_audio_screen.dart';
import 'rate_app.dart';
import 'sura_verse_picker.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
                    'Tamil Quran',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    '(திருக்குர்ஆன் தமிழாக்கம்)',
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
          _buildListTiles(_buildImageIcon('assets/images/quran-audio.png'),
              'திருக்குர்ஆன் - ஆடியோ', context, const QuranAudioPlayerScreen()),
          _buildListTiles(const Icon(Icons.search), 'திருக்குர்ஆனில் தேடுக',
              context, const SearchScreen()),
          _buildActionListTiles(
            const Icon(Icons.shuffle_sharp),
            ('வசனத்திற்குச் செல்க'),
            context,
            () => _showVersePicker(context),
          ),
          _buildActionListTiles(
              const Icon(Icons.share), 'செயலியைப் பகிர்க', context, () {
            Share.share(
                'திருக்குர்ஆன் தமிழாக்கம் Android App இனை இப்போதே Playstore இலிருந்து பதிவிறக்கம் செய்து பயன் படுத்துங்கள்: \nhttps://play.google.com/store/apps/details?id=com.faheemapps.tamil_quran');
          }),
          _buildListTiles(
              const Icon(Icons.settings), 'அமைப்புகள்', context, const SettingsScreen()),
          _buildActionListTiles(const Icon(Icons.rate_review_outlined),
              'செயலியைத் தரப்படுத்துக', context, () {
            _showRating(context);
          }),
          _buildListTiles(
              const Icon(Icons.info), 'எம்மைப்பற்றி', context, const AboutUsScreen()),
        ],
      ),
    );
  }

  Widget _buildImageIcon(String imagePath) {
    return const ImageIcon(
      AssetImage('assets/images/quran-audio.png'),
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
