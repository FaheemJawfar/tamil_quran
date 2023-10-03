import 'package:flutter/material.dart';
import 'package:tamil_quran/config/app_config.dart';
import 'package:tamil_quran/helpers/launcher.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('நன்கொடைகள் அனுப்ப...'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40,),
              Image.asset(
                'assets/images/donation.png',
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'எமது இந்த திருக்குர்ஆன் தமிழாக்கம் அப்ளிகேசனை நாம் இலவசமாக வழங்கி வருகிறோம். இதில் நாம் விளம்பரங்கள் எதையும் காட்சிப் படுத்துவதில்லை. \n\nஎங்களுக்கு ஏதாவது உதவிகளை வழங்க வேண்டும் என்று நீங்கள் விரும்பினால் கீழே உள்ள முறைகளில் உங்கள் நன்கொடைகளை அனுப்பலாம்.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Credit/Debit Card மூலம் அனுப்ப...',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Launcher.launchWebpage(AppConfig.buyMeACoffee);
                  },
                  icon: const ImageIcon(AssetImage('assets/images/heart.png')),
                  label: const Text(
                    'Donate us!',
                  )),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'வங்கிக் கணக்கு மூலம் அனுப்ப...',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Show bank account details popup
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Bank Account Details'),
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: J. Faheem',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Account Number: 231020082879',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Bank: Hatton National Bank (HNB)',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Branch: Kekirawa',
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Swift Code: HBLILKLX',
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
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.list),
                label: const Text('வங்கிக் கணக்கு விபரங்கள்'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
