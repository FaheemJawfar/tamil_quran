import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_texts/support_us_texts.dart';
import '../app_config/color_config.dart';
import '../app_config/app_config.dart';
import '../utils/launcher.dart';
import '../providers/quran_provider.dart';

class SupportUsScreen extends StatefulWidget {
  const SupportUsScreen({super.key});

  @override
  State<SupportUsScreen> createState() => _SupportUsScreenState();
}

class _SupportUsScreenState extends State<SupportUsScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(SupportUsTexts.donateUs),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/donation.png',
                width: 80,
                height: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                SupportUsTexts.donationScreenContent,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const Divider(),
              const Text(
                SupportUsTexts.sendUsingCreditDebitCards,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                radius: 100,
                onTap: () {
              Launcher.launchWebpage(AppConfig.buyMeACoffee);
                },
                child: Ink.image(
                  image: const AssetImage('assets/images/bmc-button.png'),
                  height: 50,
                  width: 150,
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                SupportUsTexts.sendViaBankTransfer,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                        title: const Text(SupportUsTexts.bankAccountDetails),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              SupportUsTexts.bankAccName,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              SupportUsTexts.bankAccNumber,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              SupportUsTexts.bankName,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              SupportUsTexts.bankBranchName,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              SupportUsTexts.bankSwiftCode,
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
                label: const Text(SupportUsTexts.bankAccountDetailsTranslation, style: TextStyle(fontSize: 16),),
              ),
              const Divider(),
              const Text(
                SupportUsTexts.sendViaPayPal,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ElevatedButton.icon(
                  style: quranProvider.isDarkMode
                      ? ColorConfig.darkModeButtonStyle
                      : null,
                  onPressed: () {
                    Launcher.launchWebpage(AppConfig.payPalProfileLink);
                  },
                  icon: const Icon(Icons.paypal),
                  label: const Text(
                    SupportUsTexts.payPalButtonLabel,
                    style: TextStyle(fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}