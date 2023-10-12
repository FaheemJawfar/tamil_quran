import 'package:flutter/material.dart';
import '../app_texts/app_screen_texts.dart';
import '../config/app_config.dart';
import '../config/color_config.dart';
import '../helpers/launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  String appVersion = '1.0';

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig.isDarkMode ? null: ColorConfig.backgroundColor,
      appBar: AppBar(
        title: const Text(AppScreenTexts.aboutUs),
        centerTitle: true,
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
                backgroundColor: AppConfig.isDarkMode ? null: ColorConfig.backgroundColor,
                backgroundImage: const AssetImage(AppConfig.appLogoPath),
              ),
              const SizedBox(height: 20),
              const Text(
                AppScreenTexts.appNameWithTranslation,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'Version $appVersion',
                style: TextStyle(fontSize: 18, color: AppConfig.isDarkMode ? Colors.white70: Colors.grey.shade700),
              ),

              Divider(
                color: AppConfig.isDarkMode ? null: ColorConfig.primaryColor,
              ),
              const Text(
                AppScreenTexts.aboutUsContent,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),

              const Text(
                AppScreenTexts.developedBy,
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const Text(
                AppScreenTexts.developerName,
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: AppConfig.isDarkMode ? null: ColorConfig.primaryColor,
              ),
              const Text(
                AppScreenTexts.sendFeedback,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Launcher.launchEmail('');
                },
                icon: const Icon(Icons.mail),
                label: const Text(AppScreenTexts.emailUs),

                style: AppConfig.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
