import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_texts/home_texts.dart';
import '../app_config/color_config.dart';
import '../common_widgets/show_toast.dart';
import '../utils/launcher.dart';
import '../providers/quran_provider.dart';

class RateApp extends StatefulWidget {
  const RateApp({super.key});

  @override
  State<RateApp> createState() => _RateAppState();
}

class _RateAppState extends State<RateApp> {
  int selectedRating = 0;
  final feedbackController = TextEditingController();
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  void _showFeedbackDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(HomeTexts.feedback),
          content: TextField(
            controller: feedbackController,
            decoration:
                const InputDecoration(hintText: HomeTexts.enterFeedback),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(HomeTexts.ratingCancel),
            ),
            TextButton(
              onPressed: () {
                if (feedbackController.text.isNotEmpty) {
                  Launcher.launchEmail(feedbackController.text);
                  Navigator.of(context).pop();
                } else {
                  ShowToast.showToast(context, HomeTexts.pleaseEnterFeedback);
                }
              },
              child: const Text(HomeTexts.ratingSubmit),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(HomeTexts.feedback),
      actions: [
        OutlinedButton(
          style:
              quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(HomeTexts.ratingCancel),
        ),
        OutlinedButton(
          style:
              quranProvider.isDarkMode ? ColorConfig.darkModeButtonStyle : null,
          onPressed: () {
            Navigator.of(context).pop();
            if (selectedRating == 5) {
              Launcher.launchPlayStore();
            } else {
              _showFeedbackDialog();
            }
          },
          child: const Text(HomeTexts.ratingSubmit),
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
                ? HomeTexts.rate5Starts
                : HomeTexts.pleaseGiveFeedback,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
