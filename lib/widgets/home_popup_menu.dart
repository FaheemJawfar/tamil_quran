import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tamil_quran/config/color_config.dart';
import '../app_texts/app_widgets_texts.dart';
import '../providers/quran_provider.dart';
import '../screens/about_us.dart';
import '../screens/donation_screen.dart';
import '../widgets/rate_app.dart';
import '../screens/settings_screen.dart';

class HomeScreenPopupMenu extends StatefulWidget {
  const HomeScreenPopupMenu({super.key});

  @override
  State<HomeScreenPopupMenu> createState() => _HomeScreenPopupMenuState();
}

class _HomeScreenPopupMenuState extends State<HomeScreenPopupMenu> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: PopupMenuButton<String>(
          color: quranProvider.isDarkMode ? null : Colors.green.shade100,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'settings',
              child: getPopupMenuItem(const Icon(Icons.settings),
                  AppWidgetsTexts.settings),
            ),
            PopupMenuItem<String>(
              value: 'share_app',
              child: getPopupMenuItem(
                  const Icon(Icons.share), AppWidgetsTexts.shareThisApp),
            ),
            PopupMenuItem<String>(
              value: 'rate_app',
              child: getPopupMenuItem(const Icon(Icons.rate_review_outlined),
                  AppWidgetsTexts.rateThisApp),
            ),
            PopupMenuItem<String>(
              value: 'about_us',
              child: getPopupMenuItem(
                  const Icon(Icons.info), AppWidgetsTexts.aboutUs),
            ),
            PopupMenuItem<String>(
              value: 'donate_us',
              child: getPopupMenuItem(
                  const ImageIcon(
                    AssetImage('assets/images/heart.png'),
                  ),
                  AppWidgetsTexts.donateUs),
            ),
          ],
          onSelected: (String value) {
            switch (value) {
              case 'settings':
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()));
                break;
              case 'rate_app':
                _showRating(context);
                break;
              case 'share_app':
                Share.share(AppWidgetsTexts.shareAppText);
                break;
              case 'about_us':
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AboutUsScreen()));
                break;

              case 'donate_us':
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const DonationScreen()));
                break;
            }
          },
          child: const Icon(Icons.more_vert),
        ));
  }

  Widget getPopupMenuItem(Widget icon, String title) {
    return ListTile(
      iconColor: quranProvider.isDarkMode ? null : ColorConfig.buttonColor,
      contentPadding: EdgeInsets.zero,
      leading: icon,
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
