import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tamil_quran/screens/about_us.dart';
import 'package:tamil_quran/widgets/rate_app.dart';

import '../screens/settings_screen.dart';


class HomeScreenPopupMenu extends StatefulWidget {
  const HomeScreenPopupMenu({super.key});

  @override
  State<HomeScreenPopupMenu> createState() => _HomeScreenPopupMenuState();
}

class _HomeScreenPopupMenuState extends State<HomeScreenPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: PopupMenuButton<String>(
        color: Colors.green.shade100,
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'settings',
            child: getPopupMenuItem(Icons.settings, 'Settings'),
          ),
          PopupMenuItem<String>(
            value: 'share_app',
            child: getPopupMenuItem(Icons.share, 'Share this App'),
          ),
          PopupMenuItem<String>(
            value: 'rate_app',
            child: getPopupMenuItem(Icons.share, 'Rate this App'),
          ),
          PopupMenuItem<String>(
            value: 'about_us',
            child: getPopupMenuItem(
                Icons.info, 'About us'),
          ),
        ],
        onSelected: (String value) {
          switch (value) {
            case 'settings':
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
              break;
            case 'rate_app':
              _showRating(context);
              break;
            case 'share_app':
              Share.share('திருக்குர்ஆன் தமிழாக்கம் Android App இனை இப்போதே Playstore இலிருந்து பதிவிறக்கம் செய்து பயன் படுத்துங்கள்: \nhttps://play.google.com/store/apps/details?id=com.faheemapps.tamil_quran');
              break;
            case 'about_us':
              Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutUsScreen()));

              break;
          }
        },
        child: const Icon(Icons.more_vert),
      )
    );
  }

  Widget getPopupMenuItem(IconData icon, String title) {
    return ListTile(
      iconColor: Colors.green.shade700,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
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
