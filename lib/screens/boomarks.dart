import 'package:flutter/material.dart';

class QuranBookmarkScreen extends StatelessWidget {
  const QuranBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3, // Assuming you have 30 bookmarks
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.bookmark), // Display bookmark number
            ),
            title: Text('Surah Name'), // Display the name of the Surah
            subtitle: Text('Verse Number'), // Display the verse number
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Handle delete bookmark action
                // You can add your own logic here to remove the bookmark
              },
            ),
          );
        },
      ),
    );
  }
}
