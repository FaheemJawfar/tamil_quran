import 'package:flutter/material.dart';
import 'package:tamil_quran/read_quran/thafseer.dart';

class ThafseerPopup extends StatelessWidget {
  final Thafseer selectedThafseer;

  const ThafseerPopup({
    required this.selectedThafseer,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(25),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${selectedThafseer.index}. ${selectedThafseer.header}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  selectedThafseer.content,
                  style: const TextStyle(
                    fontSize: 18,
                  ),

                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
