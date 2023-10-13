import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/app_texts/app_screen_texts.dart';
import 'package:tamil_quran/config/color_config.dart';
import '../config/app_config.dart';
import '../helpers/launcher.dart';
import '../providers/quran_provider.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {

  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppScreenTexts.donateUs),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/images/donation.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                AppScreenTexts.donationScreenContent,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                AppScreenTexts.sendUsingCreditDebitCards,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                  style: quranProvider.isDarkMode
                      ? ColorConfig.darkModeButtonStyle
                      : null,
                  onPressed: () {
                    Launcher.launchWebpage(AppConfig.buyMeACoffee);
                  },
                  icon: const ImageIcon(AssetImage('assets/images/heart.png')),
                  label: const Text(
                    AppScreenTexts.donateUsButtonLabel,
                  )),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                AppScreenTexts.sendViaBankTransfer,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                style: quranProvider.isDarkMode
                    ? ColorConfig.darkModeButtonStyle
                    : null,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(AppScreenTexts.bankAccountDetails),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppScreenTexts.bankAccName,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              AppScreenTexts.bankAccNumber,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              AppScreenTexts.bankName,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              AppScreenTexts.bankBranchName,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              AppScreenTexts.bankSwiftCode,
                              style: TextStyle(fontSize: 18),
                            ),
                            // Add more details as needed
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: quranProvider.isDarkMode
                                ? ColorConfig.darkModeButtonStyle
                                : null,
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.list),
                label: const Text(AppScreenTexts.bankAccountDetailsTranslation),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
