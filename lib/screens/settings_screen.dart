import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import '../providers/settings_provider.dart';
import '../widgets/reciter_selection_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final settingsProvider =
      Provider.of<SettingsProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
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
              /// TODO: Enable or Disable Dark mode
              _buildHeader('மொழிபெயர்ப்பைத் தெரிவு செய்க!'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTranslationSelector(
                      'முஹம்மது ஜான் தமிழாக்கம்', 'mJohn'),
                  _buildTranslationSelector(
                      'மன்னர் ஃபஹத் வளாகம் - சவூதி அரேபியா', 'kingFahd'),
                  _buildTranslationSelector('இஸ்லாமிய நிறுவனம் ட்ரஸ்ட்', 'ift'),
                  _buildTranslationSelector(
                      'அப்துல் ஹமீது பாகவி', 'abdulHameed'),
                ],
              ),
              _buildDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildHeader('தமிழ் எழுத்துருவைத் தெரிவு செய்க:'),
                  DropdownButton<String>(
                    value: settingsProvider.tamilFont,
                    dropdownColor: ColorConfig.popupColor,
                    onChanged: (newValue) {
                      settingsProvider.tamilFont = newValue!;
                    },
                    items: [
                      _buildDropDownMenuItem(
                          'அல்லாஹ்வின் திருப்பெயரால்...', 'MUktaMalar', 15),
                      _buildDropDownMenuItem(
                          'அல்லாஹ்வின் திருப்பெயரால்...', 'HindMadurai', 15),
                      _buildDropDownMenuItem(
                          'அல்லாஹ்வின் திருப்பெயரால்...', 'NotoSansTamil', 15),
                      _buildDropDownMenuItem(
                          'அல்லாஹ்வின் திருப்பெயரால்...', 'MeeraInimai', 15),
                    ],
                  ),
                  _buildDivider(),
                  _buildHeader('அரபு எழுத்துருவைத் தெரிவு செய்க:'),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropdownButton<String>(
                      alignment: AlignmentDirectional.bottomStart,
                      dropdownColor: ColorConfig.popupColor,
                      value: settingsProvider.arabicFont,
                      padding: const EdgeInsets.all(5),
                      onChanged: (newValue) {
                        settingsProvider.arabicFont = newValue!;
                      },
                      
                      items: [
                        _buildDropDownMenuItem(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            'AlQalam',
                            16),
                        _buildDropDownMenuItem(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            'PDMS_Saleem',
                            16),
                        _buildDropDownMenuItem(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            'Arabic',
                            16),
                        _buildDropDownMenuItem(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            'MeezanUni',
                            16),
                        _buildDropDownMenuItem(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            'Uthmani',
                            16),
                        _buildDropDownMenuItem(
                            'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                            'UthmanicScript',
                            16),
                      ],
                    ),
                  ),
                ],
              ),
              _buildDivider(),
              _buildHeader(
                'தமிழ் எழுத்து அளவு:',
              ),
              Text(
                'எல்லாப் புகழும் அல்லாஹ்வுக்கே!',
                style: TextStyle(
                  fontSize: settingsProvider.tamilFontSize,
                ),
                textAlign: TextAlign.center,
              ),
              Slider(
                value: settingsProvider.tamilFontSize,
                min: 15,
                max: 30,
                divisions: 15,
                label: settingsProvider.tamilFontSize.round().toString(),
                onChanged: (newValue) {
                  settingsProvider.tamilFontSize = newValue;
                },
              ),
              _buildHeader(
                'அரபு எழுத்து அளவு:',
              ),
              Text(
                'ٱلْحَمْدُ لِلَّٰهِ',
                style: TextStyle(
                  fontSize: settingsProvider.arabicFontSize,
                  fontFamily: settingsProvider.arabicFont,
                ),
                textAlign: TextAlign.center,
              ),
              Slider(
                value: settingsProvider.arabicFontSize,
                min: 15,
                max: 30,
                divisions: 15,
                label: settingsProvider.arabicFontSize.round().toString(),
                onChanged: (newValue) {
                  settingsProvider.arabicFontSize = newValue;
                },
              ),
              _buildDivider(),
              _buildHeader('கிராஅத் ஓதுபவரைத் தேர்வு செய்க!'),
              OutlinedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ReciterSelectionDialog(
                          reciters: settingsProvider.allReciters,
                          selectedReciter: settingsProvider.selectedReciter,
                          onSelected: (reciterIdentifier) {
                            settingsProvider.selectedReciter =
                                reciterIdentifier;
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.record_voice_over),
                  label: Text(
                    settingsProvider.getRecitersName(),
                    style: const TextStyle(color: Colors.black),
                  )),

              _buildDivider(),
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHeader(
                    'அமைப்புக்களை மீளமைக்க!',
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
                      label: const Text('Reset')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.green.shade800,
      ),
    );
  }

  Widget _buildTranslationSelector(String title, String value) {
    return RadioListTile<String>(
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
      value: value,
      groupValue: settingsProvider.selectedTranslation,
      onChanged: (newValue) {
        settingsProvider.selectedTranslation = newValue!;
      },
    );
  }

  DropdownMenuItem<String> _buildDropDownMenuItem(
      String text, String fontFamily, double fontSize) {
    return DropdownMenuItem<String>(
      value: fontFamily,

      child: Text(
        text,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: ColorConfig.primaryColor,
    );
  }
}
