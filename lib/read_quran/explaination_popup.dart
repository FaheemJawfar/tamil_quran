import 'package:flutter/material.dart';

class ExplanationPopup extends StatelessWidget {
  final String headerText;
  final String bodyText;

  const ExplanationPopup({super.key, required this.headerText, required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              headerText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  bodyText,
                  style: const TextStyle(
                    fontSize: 16,
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
