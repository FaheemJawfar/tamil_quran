import 'package:flutter/material.dart';
import '../models/reciter.dart';


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

  @override
  void initState() {
    super.initState();
    selectedReciter = widget.selectedReciter;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('ஓதுபவரைத் தேர்வு செய்க...'),
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
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Select'),
          onPressed: () {
            widget.onSelected(selectedReciter);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}