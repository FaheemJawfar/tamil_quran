import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsProvider =
    Provider.of<SettingsProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      appBar: AppBar(
        title: const Text('அமைப்புக்கள்'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'மொழிபெயர்ப்பைத் தெரிவு செய்க!',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text(
                      'முஹம்மது ஜான் தமிழாக்கம்',
                      style: TextStyle(fontSize: 15),
                    ),
                    value: 'mJohn',
                    groupValue: settingsProvider.selectedTranslation,
                    onChanged: (newValue) {
                      settingsProvider.selectedTranslation = newValue!;
                    },
                  ),
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text(
                      'மன்னர் ஃபஹத் வளாகம் - சவூதி அரேபியா',
                      style: TextStyle(fontSize: 15),
                    ),
                    value: 'kingFahd',
                    groupValue: settingsProvider.selectedTranslation,
                    onChanged: (newValue) {
                      settingsProvider.selectedTranslation = newValue!;
                    },
                  ),
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text(
                      'இஸ்லாமிய நிறுவனம் ட்ரஸ்ட்',
                      style: TextStyle(fontSize: 15),
                    ),
                    value: 'ift',
                    groupValue: settingsProvider.selectedTranslation,
                    onChanged: (newValue) {
                      settingsProvider.selectedTranslation = newValue!;
                    },
                  ),
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: const Text(
                      'அப்துல் ஹமீது பாகவி',
                      style: TextStyle(fontSize: 15),
                    ),
                    value: 'abdulHameed',
                    groupValue: settingsProvider.selectedTranslation,
                    onChanged: (newValue) {
                      settingsProvider.selectedTranslation = newValue!;
                    },
                  ),
                ],
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'தமிழ் எழுத்துருவைத் தெரிவு செய்க:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  DropdownButton<String>(
                    value: settingsProvider.tamilFont,
                    dropdownColor: ColorConfig.popupColor,
                    onChanged: (newValue) {
                      settingsProvider.tamilFont = newValue!;
                    },
                    items: const [
                      DropdownMenuItem<String>(
                        value: 'MUktaMalar',
                        child: Text(
                          'அல்லாஹ்வின் திருப்பெயரால்...',
                          style: TextStyle(
                            fontFamily: 'MUktaMalar',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'HindMadurai',
                        child: Text(
                          'அல்லாஹ்வின் திருப்பெயரால்...',
                          style: TextStyle(
                            fontFamily: 'HindMadurai',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'NotoSansTamil',
                        child: Text(
                          'அல்லாஹ்வின் திருப்பெயரால்...',
                          style: TextStyle(
                            fontFamily: 'NotoSansTamil',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      DropdownMenuItem<String>(
                        value: 'MeeraInimai',
                        child: Text(
                          'அல்லாஹ்வின் திருப்பெயரால்...',
                          style: TextStyle(
                            fontFamily: 'MeeraInimai',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    'அரபு எழுத்துருவைத் தெரிவு செய்க:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropdownButton<String>(
                      alignment: AlignmentDirectional.bottomStart,
                      dropdownColor: ColorConfig.popupColor,
                      value: settingsProvider.arabicFont,
                      onChanged: (newValue) {
                        settingsProvider.arabicFont = newValue!;
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'AlQalam',
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Text(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            style: TextStyle(fontFamily: 'AlQalam'),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'PDMS_Saleem',
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Text(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            style: TextStyle(fontFamily: 'PDMS_Saleem'),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Arabic',
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Text(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            style: TextStyle(fontFamily: 'Arabic'),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'MeezanUni',
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Text(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            style: TextStyle(fontFamily: 'MeezanUni'),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Uthmani',
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Text(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            style: TextStyle(fontFamily: 'Uthmani'),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'UthmanicScript',
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Text(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            style: TextStyle(fontFamily: 'UthmanicScript'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'தமிழ் எழுத்துரு அளவு:',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800),
                  ),
                  Text(
                    'எல்லாப் புகழும் அல்லாஹ்வுக்கே!',
                    style: TextStyle(
                      fontSize: settingsProvider.tamilFontSize,
                    ),
                  ),
                  Slider(
                    divisions: 24,
                    value: settingsProvider.tamilFontSize,
                    onChanged: (newValue) {
                      settingsProvider.tamilFontSize = newValue;
                    },
                    min: 12,
                    max: 24,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'அரபு எழுத்துரு அளவு:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  Text(
                    'ٱلْحَمْدُ لِلَّٰهِ',
                    style: TextStyle(
                      fontSize: settingsProvider.arabicFontSize,
                      fontFamily: settingsProvider.arabicFont,
                    ),
                  ),
                  Slider(
                    divisions: 24,
                    value: settingsProvider.arabicFontSize,
                    onChanged: (newValue) {
                      settingsProvider.arabicFontSize = newValue;
                    },
                    min: 12,
                    max: 24,
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'அமைப்புக்களை மீளமைக்க!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  ElevatedButton.icon(
                      icon: const Icon(Icons.warning_rounded),
                      onPressed: () {
                        settingsProvider.clearSettings();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        Colors.red.shade400, // Background color
                      ),
                      label: const Text('Reset'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
