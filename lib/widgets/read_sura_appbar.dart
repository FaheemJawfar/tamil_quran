import 'package:flutter/material.dart';

class ReadSuraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function() onBookIconPressed;
  final void Function() onNavigatePreviousPressed;
  final void Function() onNavigateNextPressed;

  const ReadSuraAppBar({super.key, 
    required this.title,
    required this.onBookIconPressed,
    required this.onNavigateNextPressed,
    required this.onNavigatePreviousPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: onBookIconPressed,
          icon: const Icon(Icons.menu_book),
        ),
        IconButton(
          onPressed: onNavigatePreviousPressed,
          icon: const Icon(Icons.navigate_before),
        ),
        IconButton(
          onPressed: onNavigateNextPressed,
          icon: const Icon(Icons.navigate_next),
        ),
      ],
    );
  }
}
