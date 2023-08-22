import 'package:flutter/material.dart';


class QuranPopupMenu extends StatefulWidget {
  const QuranPopupMenu({super.key});

  @override
  State<QuranPopupMenu> createState() => _QuranPopupMenuState();
}

class _QuranPopupMenuState extends State<QuranPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'option1',
            child: Text('Option 1'),
          ),
          const PopupMenuItem<String>(
            value: 'option2',
            child: Text('Option 2'),
          ),
          const PopupMenuItem<String>(
            value: 'option3',
            child: Text('Option 3'),
          ),
        ],
        onSelected: (String value) {
          switch (value) {
            case 'option1':
            // Handle option 1 selection
              break;
            case 'option2':
            // Handle option 2 selection
              break;
            case 'option3':
            // Handle option 3 selection
              break;
          }
        },
        child: const Icon(Icons.more_vert),
      ),
    );
  }
}
