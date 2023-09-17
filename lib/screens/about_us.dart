import 'package:flutter/material.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/helpers/launcher.dart';
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
    getVersion();
    super.initState();
  }


  void getVersion() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      appBar: AppBar(
        title: const Text('About Us.'),
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
                backgroundColor: ColorConfig.backgroundColor,
                backgroundImage: const AssetImage('assets/icon/quran_icon.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                'திருக்குர்ஆன் - தமிழாக்கம்',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'Version $appVersion',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 10),
              Divider(
                color: ColorConfig.primaryColor,
              ),
              const Text(
                'இறைவன் மனித சமுதாயத்துக்கு வழங்கிய இறுதி வேதமாகிய திருக்குர்ஆனைப் பொருளுணர்ந்து வாசிப்பதும், அதன் போதனைகளை முஸ்லிம்கள் மற்றும் முஸ்லிம் அல்லாத மக்களுக்கும் எடுத்துச் சொல்வதும் நம்மீது கடமையாக இருக்கின்றது. \nஇந்த இறைப்பணியில் ஒரு சிறு முயற்சியாகத் தான் இந்த அப்ளிகேசன் உருவாக்கப் பட்டுள்ளது. இதன் மூலம் நீங்களும் பயனடைந்து பிறரையும் பயனடையச் செய்வீர்கள் என்று நம்புகிறேன்.',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),

              const Text(
                'App designed & developed by:',
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const Text(
                '- J. பஹீம்',
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: ColorConfig.primaryColor,
              ),
              const Text(
                'இந்த App பற்றிய உங்கள் கருத்துக்களையும் விமர்சனங்களையும் எமக்குத் தெரிவியுங்கள்:',
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Launcher.launchEmail('');
                },
                icon: const Icon(Icons.mail),
                label: const Text('Email Us.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
