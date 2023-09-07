import 'package:flutter/material.dart';
import 'package:tamil_quran/helpers/show_toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RateApp extends StatefulWidget {
  const RateApp({super.key});

  @override
  State<RateApp> createState() => _RateAppState();
}

class _RateAppState extends State<RateApp> {
  int selectedRating = 0;
  final feedbackController = TextEditingController();

  void _launchPlayStore() async {
    const appId = 'com.faheemapps.tamil_quran';

    try {
      await launchUrlString("market://details?id=$appId");
    } catch (e) {
      throw 'Could not launch ${e.toString()}';
    }
  }

  void _showFeedbackDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Feedback'),
          content: TextField(
            controller: feedbackController,
            decoration: const InputDecoration(hintText: 'Enter your feedback here'),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if(feedbackController.text.isNotEmpty) {
                  _launchEmail();
                  Navigator.of(context).pop();
                } else {
                  ShowToast.showToast(context, 'Please enter your feedback to submit!');
                }
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _launchEmail() async {

    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'faheemjawfar@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Tamil Quran App - Feedback',
        'body': feedbackController.text,
      }),
    );

    try {
      await launchUrl(emailLaunchUri);
    } catch(e) {
      throw 'Could not launch $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Feedback'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (selectedRating == 5) {
              _launchPlayStore();
            } else {
              _showFeedbackDialog();
            }
          },
          child: const Text('Submit'),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final star = index + 1;
              return IconButton(
                onPressed: () {
                  setState(() {
                    selectedRating = star;
                  });
                },
                icon: Icon(
                  Icons.star,
                  color: star <= selectedRating ? Colors.yellow : Colors.grey,
                ),
              );
            }),
          ),
          Text(
            selectedRating == 5 ? 'Rate us 5 stars on Play Store!' : 'Please give your feedback',
            style: const TextStyle(
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
