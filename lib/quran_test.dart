import 'package:flutter/material.dart';


class QuranTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: PageView.builder(
          itemCount: 604, // Total Quran pages
          reverse: true, // Right-to-left navigation
          itemBuilder: (context, index) {
            final pageNumber = (index + 1).toString().padLeft(3, '0'); // Format with leading zeros
            print(pageNumber);
            return Image.asset(
              'assets/quran_pages/page$pageNumber.png', // Updated file naming format
              fit: BoxFit.contain,
            );
          },
        ),
      ),
    );
  }
}
