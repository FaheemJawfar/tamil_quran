import 'package:flutter/material.dart';
import '../app_texts/app_widgets_texts.dart';
import '../helpers/show_toast.dart';
import '../helpers/launcher.dart';

class RateApp extends StatefulWidget {
  const RateApp({super.key});

  @override
  State<RateApp> createState() => _RateAppState();
}

class _RateAppState extends State<RateApp> {
  int selectedRating = 0;
  final feedbackController = TextEditingController();

  void _showFeedbackDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppWidgetsTexts.feedback),
          content: TextField(
            controller: feedbackController,
            decoration:
                const InputDecoration(hintText: AppWidgetsTexts.enterFeedback),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(AppWidgetsTexts.ratingCancel),
            ),
            TextButton(
              onPressed: () {
                if (feedbackController.text.isNotEmpty) {
                  Launcher.launchEmail(feedbackController.text);
                  Navigator.of(context).pop();
                } else {
                  ShowToast.showToast(
                      context, AppWidgetsTexts.pleaseEnterFeedback);
                }
              },
              child: const Text(AppWidgetsTexts.ratingSubmit),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppWidgetsTexts.feedback),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(AppWidgetsTexts.ratingCancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (selectedRating == 5) {
              Launcher.launchPlayStore();
            } else {
              _showFeedbackDialog();
            }
          },
          child: const Text(AppWidgetsTexts.ratingSubmit),
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
            selectedRating == 5
                ? AppWidgetsTexts.rate5Starts
                : AppWidgetsTexts.pleaseGiveFeedback,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
