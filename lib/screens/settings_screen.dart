import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/config/color_config.dart';
import '../providers/settings_provider.dart';
import '../widgets/reciter_selector_popup.dart';

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
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildListTile(
              leadingIcon: Icons.language,
              title: 'தமிழ் மொழிபெயர்ப்பு',
              subtitle: translations[settingsProvider.selectedTranslation]!,
              onTap: () => _showPopup(
                child: ShowTranslationSelector(
                  translations: translations,
                  selectedTranslation: settingsProvider.selectedTranslation,
                  onSelected: (value) =>
                      settingsProvider.selectedTranslation = value,
                ),
              ),
            ),
            _buildDivider(),
            _buildImageIconListTile(
              leadingIcon:
                  const ImageIcon(AssetImage('assets/images/tamil.png')),
              title: 'தமிழ் எழுத்துரு ( Tamil Font )',
              subtitle: 'அல்லாஹ்வின் திருப் பெயரால் ...',
              selectedFont: settingsProvider.tamilFont,
              onTap: () => _showPopup(
                child: ShowFontSelector(
                  selectedFont: settingsProvider.tamilFont,
                  tamilFonts: const [
                    'MUktaMalar',
                    'HindMadurai',
                    'NotoSansTamil',
                    'MeeraInimai'
                  ],
                  label: 'அல்லாஹ்வின் திருப் பெயரால் ...',
                  onSelected: (value) => settingsProvider.tamilFont = value,
                ),
              ),
            ),
            _buildDivider(),
            _buildImageIconListTile(
              leadingIcon:
                  const ImageIcon(AssetImage('assets/images/arabic.png')),
              title: 'அரபு எழுத்துரு (Arabic Font)',
              subtitle: 'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
              selectedFont: settingsProvider.arabicFont,
              onTap: () => _showPopup(
                child: ShowFontSelector(
                  selectedFont: settingsProvider.arabicFont,
                  tamilFonts: const [
                    'AlQalam',
                    'PDMS_Saleem',
                    'Arabic',
                    'MeezanUni',
                    'Uthmani',
                    'UthmanicScript'
                  ],
                  label: 'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                  onSelected: (value) => settingsProvider.arabicFont = value,
                ),
              ),
            ),
            _buildDivider(),
            _buildListTile(
              leadingIcon: Icons.text_fields,
              title: 'தமிழ் எழுத்து அளவு (Tamil Font Size)',
              subtitle: settingsProvider.tamilFontSize.floor().toString(),
              onTap: () => _showPopup(
                  child: FontSizeSelector(
                fontSize: settingsProvider.tamilFontSize,
                text: 'அல்லாஹ்வின் திருப் பெயரால் ...',
                fontFamily: settingsProvider.tamilFont,
                onChanged: (value) {
                  settingsProvider.tamilFontSize = value;
                },
              )),
            ),
            _buildDivider(),
            _buildListTile(
              leadingIcon: Icons.text_fields,
              title: 'அரபு எழுத்து அளவு (Arabic Font Size)',
              subtitle: settingsProvider.arabicFontSize.floor().toString(),
              onTap: () => _showPopup(
                  child: FontSizeSelector(
                fontSize: settingsProvider.arabicFontSize,
                fontFamily: settingsProvider.arabicFont,
                text: 'بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ',
                onChanged: (value) {
                  settingsProvider.arabicFontSize = value;
                },
              )),
            ),
            _buildDivider(),
            _buildListTile(
              leadingIcon: Icons.record_voice_over,
              title: 'குர்ஆன் - கிராஅத் (ஓதுபவர்)',
              subtitle:
                  settingsProvider.getSelectedReciterDetails.englishName,
              onTap: () => _showPopup(
                child: ReciterSelectorPopup(
                  reciters: settingsProvider.allReciters,
                  selectedReciter:
                      settingsProvider.getSelectedReciterDetails.identifier,
                  onSelected: (value) {
                    settingsProvider.selectedReciter = value;
                  },
                ),
              ),
            ),
            _buildDivider(),
            _buildListTile(
              leadingIcon: Icons.restore,
              title: 'அமைப்புக்களை மீளமைத்தல்',
              subtitle: 'Reset Settings to Default',
              onTap: () => _showPopup(
                child: AlertDialog(
                  title: const Text('அமைப்புக்களை மீளமைக்க வேண்டுமா?'),
                  content: const SizedBox(
                    width: double.maxFinite,
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('இல்லை'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      child: const Text('ஆம்!'),
                      onPressed: () {
                        settingsProvider.clearSettings();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),

            _buildDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
      {required IconData leadingIcon,
      required String title,
      required String subtitle,
      required Function() onTap}) {
    return ListTile(
      dense: true,
      leading: Icon(leadingIcon),
      title: Text(title, style: const TextStyle(fontSize: 16),),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 15),),
      onTap: onTap,
    );
  }

  Widget _buildImageIconListTile(
      {required ImageIcon leadingIcon,
      required String title,
      required String subtitle,
        required String selectedFont,
      required Function() onTap}) {
    return ListTile(
      dense: true,
      leading: leadingIcon,
      title: Text(title, style: const TextStyle(fontSize: 16),),
      subtitle: Text(subtitle, style: TextStyle(fontFamily: selectedFont, fontSize: 15),),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
    );
  }

  _showPopup({Widget? child}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return child ?? const SizedBox();
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

class ShowFontSelector extends StatefulWidget {
  final List<String> tamilFonts;
  final String selectedFont;
  final String label;
  final ValueChanged<String> onSelected;

  const ShowFontSelector(
      {required this.tamilFonts,
      required this.selectedFont,
      required this.label,
      required this.onSelected,
      super.key});

  @override
  State<ShowFontSelector> createState() => _ShowFontSelectorState();
}

class _ShowFontSelectorState extends State<ShowFontSelector> {
  late String selectedFont = widget.selectedFont;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('எழுத்துருவைத் தேர்வு செய்க'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: widget.tamilFonts.map((String font) {
            return RadioListTile(
              title: Text(
                widget.label,
                style: TextStyle(fontFamily: font),
              ),
              value: font,
              groupValue: selectedFont,
              onChanged: (value) {
                setState(() {
                  selectedFont = value as String;
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
            widget.onSelected(selectedFont);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class FontSizeSelector extends StatefulWidget {
  final double fontSize;
  final String text;
  final String fontFamily;
  final ValueChanged<double> onChanged;

  const FontSizeSelector(
      {required this.fontSize,
      required this.text,
      required this.fontFamily,
      required this.onChanged,
      super.key});

  @override
  State<FontSizeSelector> createState() => _FontSizeSelectorState();
}

class _FontSizeSelectorState extends State<FontSizeSelector> {
  late double fontSize = widget.fontSize;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: widget.fontFamily,
            ),
            textAlign: TextAlign.center,
          ),
          Slider(
            value: fontSize,
            min: 15,
            max: 30,
            divisions: 15,
            label: fontSize.round().toString(),
            onChanged: (newValue) {
              setState(() {
                fontSize = newValue;
              });
            },
          ),
        ],
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
            widget.onChanged(fontSize);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
