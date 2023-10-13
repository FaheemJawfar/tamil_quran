import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_texts/donation_texts.dart';
import '../app_config/color_config.dart';
import '../app_config/app_config.dart';
import '../utils/launcher.dart';
import '../providers/quran_provider.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(DonationTexts.donateUs),
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
                DonationTexts.donationScreenContent,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                DonationTexts.sendUsingCreditDebitCards,
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
                    DonationTexts.donateUsButtonLabel,
                  )),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                DonationTexts.sendViaBankTransfer,
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
                        title: const Text(DonationTexts.bankAccountDetails),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DonationTexts.bankAccName,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              DonationTexts.bankAccNumber,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              DonationTexts.bankName,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              DonationTexts.bankBranchName,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              DonationTexts.bankSwiftCode,
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
                label: const Text(DonationTexts.bankAccountDetailsTranslation),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
