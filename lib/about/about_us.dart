import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:provider/provider.dart';
import '../app_texts/about.dart';
import '../app_config/app_config.dart';
import '../app_config/color_config.dart';
import '../utils/launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../providers/quran_provider.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  String appVersion = '1.0';
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  void initState() {
    getVersionNumber();
    super.initState();
  }

  void getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    List<String> versionParts = packageInfo.version.split('.');

    if (versionParts.length > 1) {
      versionParts.removeLast();
    }

    setState(() {
      appVersion = versionParts.join('.');
    });
  }

  _buildListItem(String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontStyle: FontStyle.italic),
      ),
      // onTap: () {
      //   Launcher.launchWebpage(website);
      // },
    );
  }

  void _showReferencesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'References',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _buildListItem('1. Tamililquran.com'),
                _buildListItem('2. Tanzil.net'),
                _buildListItem('3. QuranEnc.com'),
                _buildListItem('4. Alquran.cloud'),
                _buildListItem('5. Archive.org'),
                _buildListItem('6. Onlinetntj.com'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          quranProvider.isDarkMode ? null : ColorConfig.backgroundColor,
      appBar: AppBar(
        title: const Text(AboutTexts.aboutUs),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _showReferencesDialog(context);
              },
              icon: const Icon(LucideIcons.link))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 40,
                backgroundColor: quranProvider.isDarkMode
                    ? Colors.transparent
                    : ColorConfig.backgroundColor,
                backgroundImage: const AssetImage(AppConfig.appLogoPath),
              ),
              const SizedBox(height: 20),
              const Text(
                AboutTexts.appNameWithTranslation,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'Version $appVersion',
                style: TextStyle(
                    fontSize: 18,
                    color: quranProvider.isDarkMode
                        ? Colors.white70
                        : Colors.grey.shade700),
              ),

              Divider(
                color:
                    quranProvider.isDarkMode ? null : ColorConfig.primaryColor,
              ),
              // const Text(
              //   AboutTexts.aboutUsContent,
              //   style: TextStyle(fontSize: 16),
              //   textAlign: TextAlign.center,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),

              const Text(
                AboutTexts.developedBy,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              Text(
                AboutTexts.developerName,
                style: TextStyle(
                    fontSize: 18,
                    color: quranProvider.isDarkMode
                        ? ColorConfig.textSecondaryDark
                        : ColorConfig.textSecondaryLight),
                textAlign: TextAlign.center,
              ),
              Divider(
                color:
                    quranProvider.isDarkMode ? null : ColorConfig.primaryColor,
              ),
              const Text(
                AboutTexts.sendFeedback,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Divider(),
              const Text(
                AboutTexts.toContact,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Launcher.launchEmail('');
                },
                icon: const Icon(LucideIcons.mail),
                label: const Text(AboutTexts.emailUs),
                style: quranProvider.isDarkMode
                    ? ColorConfig.darkModeButtonStyle
                    : null,
              ),

              ElevatedButton.icon(
                onPressed: () {
                  Launcher.launchWhatsApp();
                },
                icon: const Icon(LucideIcons.messageCircle),
                label: const Text(AboutTexts.whatsAppUs),
                style: quranProvider.isDarkMode
                    ? ColorConfig.darkModeButtonStyle
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
