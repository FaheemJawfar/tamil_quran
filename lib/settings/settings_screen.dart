
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamil_quran/app_texts/settings_texts.dart';
import '../app_config/color_config.dart';
import '../providers/quran_provider.dart';
import '../quran_audio/reciter_selector_popup.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          quranProvider.isDarkMode ? null : ColorConfig.backgroundColor,
      appBar: AppBar(
        title: const Text(SettingsTexts.settings),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text(SettingsTexts.darkMode),
              trailing: Switch(
                activeColor: quranProvider.isDarkMode ? Colors.grey: ColorConfig.primaryColor,
                  value: quranProvider.isDarkMode,
                  onChanged: (value) {
                    quranProvider.isDarkMode = value;
                  }),
            ),
            _buildDivider(),
            _buildListTile(
              leadingIcon: Icons.language,
              title: SettingsTexts.languageTranslation,
              subtitle: quranProvider.selectedTranslationName,
              onTap: () => _showPopup(
                child: ShowTranslationSelector(
                  translations: quranProvider.translations,
                  selectedTranslation: quranProvider.selectedTranslation,
                  onSelected: (value) =>
                      quranProvider.selectedTranslation = value,
                ),
              ),
            ),
            _buildDivider(),
            _buildImageIconListTile(
              leadingIcon: const ImageIcon(
                  AssetImage(SettingsTexts.translationIconPath)),
              title: SettingsTexts.translationFont,
              subtitle: SettingsTexts.bismillahTranslation,
              selectedFont: quranProvider.tamilFont,
              onTap: () => _showPopup(
                child: ShowFontSelector(
                  selectedFont: quranProvider.tamilFont,
                  translationFonts: quranProvider.languageFontsList,
                  label: SettingsTexts.bismillahTranslation,
                  onSelected: (value) => quranProvider.tamilFont = value,
                ),
              ),
            ),
            _buildDivider(),
            _buildImageIconListTile(
              leadingIcon:
                  const ImageIcon(AssetImage(SettingsTexts.arabicIconPath)),
              title: SettingsTexts.arabicFont,
              subtitle: SettingsTexts.bismillahInArabic,
              selectedFont: quranProvider.arabicFont,
              onTap: () => _showPopup(
                child: ShowFontSelector(
                  selectedFont: quranProvider.arabicFont,
                  translationFonts: quranProvider.arabicFontsList,
                  label: SettingsTexts.bismillahInArabic,
                  onSelected: (value) => quranProvider.arabicFont = value,
                ),
              ),
            ),
            _buildDivider(),
            _buildListTile(
              leadingIcon: Icons.text_fields,
              title: SettingsTexts.translationFontSize,
              subtitle: quranProvider.tamilFontSize.floor().toString(),
              onTap: () => _showPopup(
                  child: FontSizeSelector(
                fontSize: quranProvider.tamilFontSize,
                text: SettingsTexts.bismillahTranslation,
                fontFamily: quranProvider.tamilFont,
                onChanged: (value) {
                  quranProvider.tamilFontSize = value;
                },
              )),
            ),
            _buildDivider(),
            _buildListTile(
              leadingIcon: Icons.text_fields,
              title: SettingsTexts.arabicFontSize,
              subtitle: quranProvider.arabicFontSize.floor().toString(),
              onTap: () => _showPopup(
                  child: FontSizeSelector(
                fontSize: quranProvider.arabicFontSize,
                fontFamily: quranProvider.arabicFont,
                text: SettingsTexts.bismillahInArabic,
                onChanged: (value) {
                  quranProvider.arabicFontSize = value;
                },
              )),
            ),
            _buildDivider(),
            _buildListTile(
              leadingIcon: Icons.record_voice_over,
              title: SettingsTexts.quranReciter,
              subtitle: quranProvider.selectedReciterDetails.name,
              onTap: () => _showPopup(
                child: ReciterSelectorPopup(
                  reciters: quranProvider.allReciters,
                  selectedReciter:
                      quranProvider.selectedReciterDetails.identifier,
                  onSelected: (value) {
                    quranProvider.selectedReciter = value;
                  },
                ),
              ),
            ),
            _buildDivider(),
            _buildListTile(
              leadingIcon: Icons.restore,
              title: SettingsTexts.resetSettings,
              subtitle: SettingsTexts.resetSettingsInfo,
              onTap: () => _showPopup(
                child: AlertDialog(
                  title: const Text(SettingsTexts.resetConfirmation),
                  content: const SizedBox(
                    width: double.maxFinite,
                    child: Text(SettingsTexts.resetConfirmationTranslation),
                  ),
                  actions: <Widget>[
                    TextButton(
                      style: quranProvider.isDarkMode
                          ? ColorConfig.darkModeButtonStyle
                          : null,
                      child: const Text(SettingsTexts.no),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ElevatedButton(
                      style: quranProvider.isDarkMode
                          ? ColorConfig.darkModeButtonStyle
                          : null,
                      child: const Text(SettingsTexts.yes),
                      onPressed: () {
                        quranProvider.clearSettings();
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
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 15),
      ),
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
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontFamily: selectedFont, fontSize: 15),
      ),
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
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(SettingsTexts.selectTranslation),
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
          style:
              quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
          child: const Text(SettingsTexts.popUpCancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          style:
              quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
          child: const Text(SettingsTexts.popUpSelect),
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
  final List<String> translationFonts;
  final String selectedFont;
  final String label;
  final ValueChanged<String> onSelected;

  const ShowFontSelector(
      {required this.translationFonts,
      required this.selectedFont,
      required this.label,
      required this.onSelected,
      super.key});

  @override
  State<ShowFontSelector> createState() => _ShowFontSelectorState();
}

class _ShowFontSelectorState extends State<ShowFontSelector> {
  late String selectedFont = widget.selectedFont;
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(SettingsTexts.selectFont),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: widget.translationFonts.map((String font) {
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
          style:
              quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
          child: const Text(SettingsTexts.popUpCancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          style:
              quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
          child: const Text(SettingsTexts.popUpSelect),
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
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

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
          style:
              quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
          child: const Text(SettingsTexts.popUpCancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          style:
              quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
          child: const Text(SettingsTexts.popUpSelect),
          onPressed: () {
            widget.onChanged(fontSize);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
