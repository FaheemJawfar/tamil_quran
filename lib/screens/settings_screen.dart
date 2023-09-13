import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import '../models/reciter.dart';
import '../providers/settings_provider.dart';
import '../widgets/pop_up_selector.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final settingsProvider =
      Provider.of<SettingsProvider>(context, listen: true);

  Map<String, String> translations = {
    'mJohn': 'முஹம்மது ஜான் தமிழாக்கம்',
    'kingFahd': 'மன்னர் ஃபஹத் வளாகம் - சவூதி அரேபியா',
    'ift': 'இஸ்லாமிய நிறுவனம் ட்ரஸ்ட்',
    'abdulHameed': 'அப்துல் ஹமீது பாகவி',
  };

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('தமிழ் மொழிபெயர்ப்பு'),
                subtitle: Text(
                  translations[settingsProvider.selectedTranslation]!,
                ),
                onTap: () {
                  _showPopup(ShowTranslationSelector(
                    translations: translations,
                    selectedTranslation: settingsProvider.selectedTranslation,
                    onSelected: (value) {
                      settingsProvider.selectedTranslation = value;
                    },
                  ));
                },
              ),
              _buildDivider(),
              _buildOptionImageIcon(
                const ImageIcon(AssetImage('assets/images/tamil.png')),
                'தமிழ் எழுத்துரு ( Tamil Font )',
                'அல்லாஹ்வின் திருப்பெயரால்...',
                settingsProvider.tamilFont,
              ),
              _buildDivider(),
              _buildOptionImageIcon(
                const ImageIcon(AssetImage('assets/images/arabic.png')),
                'அரபு எழுத்துரு ( Arabic Font )',
                'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                settingsProvider.arabicFont,
              ),

              _buildDivider(),

              ListTile(
                leading: const Icon(Icons.text_fields),
                title: const Text('தமிழ் எழுத்து அளவு ( Tamil Font Size)'),
                subtitle: Text(
                  settingsProvider.tamilFontSize.floor().toString(),
                ),
                onTap: () {
                  print('tapped');
                },
              ),

              _buildDivider(),

              ListTile(
                leading: const Icon(Icons.text_fields),
                title: const Text(
                  'அரபு எழுத்து அளவு ( Arabic Font Size)',
                ),
                subtitle: Text(
                  settingsProvider.arabicFontSize.floor().toString(),
                ),
                onTap: () {
                  print('tapped');
                },
              ),
              _buildDivider(),

              ListTile(
                leading: const Icon(Icons.record_voice_over),
                title: const Text('குர்ஆன் - கிராஅத் ( ஓதுபவர் )'),
                subtitle: Text(
                  settingsProvider.getSelectedReciterDetails.englishName,
                ),
                onTap: () {
                  print('tapped');
                },
              ),

              /// TODO: Delete all below


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
                        return PopupSelector<Reciter>(
                          listOfItems: settingsProvider.allReciters,
                          selectedItem:
                              settingsProvider.getSelectedReciterDetails,
                          onSelected: (Reciter? reciter) {
                            if (reciter != null) {
                              settingsProvider.selectedReciter =
                                  reciter.identifier;
                            }
                          },
                          displayNameExtractor: (item) {
                            return item.englishName;
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.record_voice_over),
                  label: Text(
                    settingsProvider.getSelectedReciterDetails.englishName,
                    style: const TextStyle(color: Colors.black),
                  )),

              _buildDivider(),
              const SizedBox(
                height: 20,
              ),

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

  Widget _buildOptionImageIcon(ImageIcon imageIcon, String option, String value,
      [String? subtitleFont]) {
    return ListTile(
      leading: imageIcon,
      title: Text(option),
      subtitle: Text(
        value,
        style: TextStyle(fontFamily: subtitleFont),
      ),
      onTap: () {
        print('tapped');
      },
    );
  }

  _showPopup(Widget child) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return child;
      },
    );
  }
}

class ShowTranslationSelector extends StatefulWidget {
  final Map<String, String> translations;
  final String selectedTranslation;
  final ValueChanged<String> onSelected;

  const ShowTranslationSelector(
      {required this.translations,
      required this.selectedTranslation,
      required this.onSelected,
      super.key});

  @override
  State<ShowTranslationSelector> createState() =>
      _ShowTranslationSelectorState();
}

class _ShowTranslationSelectorState extends State<ShowTranslationSelector> {
  late String selectedTranslation = widget.selectedTranslation;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('ஓதுபவரைத் தேர்வு செய்க...'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: widget.translations.keys.map((String key) {
            return RadioListTile(
              title: Text(widget.translations[key]!),
              value: key,
              groupValue: selectedTranslation,
              onChanged: (value) {
                setState(() {
                  selectedTranslation = value as String;
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Select'),
          onPressed: () {
            widget.onSelected(selectedTranslation);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
