import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_texts/common_widget_texts.dart';
import '../app_texts/quran_audio_texts.dart';
import '../app_config/color_config.dart';
import 'reciter.dart';
import '../providers/quran_provider.dart';

class ReciterSelectorPopup extends StatefulWidget {
  final List<Reciter> reciters;
  final String selectedReciter;
  final ValueChanged<String> onSelected;

  const ReciterSelectorPopup({
    required this.reciters,
    required this.selectedReciter,
    required this.onSelected,
    super.key,
  });

  @override
  State<ReciterSelectorPopup> createState() => _ReciterSelectorPopupState();
}

class _ReciterSelectorPopupState extends State<ReciterSelectorPopup> {
  late String selectedReciter;
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  @override
  void initState() {
    super.initState();
    selectedReciter = widget.selectedReciter;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(QuranAudioTexts.chooseReciter),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: widget.reciters.map((reciter) {
            return RadioListTile(
              title: Text(reciter.name),
              value: reciter.identifier,
              groupValue: selectedReciter,
              onChanged: (value) {
                setState(() {
                  selectedReciter = value as String;
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style:
              quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
          child: const Text(CommonWidgetTexts.popUpCancel),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSelected(selectedReciter);
            Navigator.of(context).pop();
          },
          style:
              quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
          child: const Text(CommonWidgetTexts.popUpSelect),
        ),
      ],
    );
  }
}
