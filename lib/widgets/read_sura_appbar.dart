import 'package:flutter/material.dart';
import 'package:tamil_quran/screens/home_screen.dart';
import 'package:tamil_quran/widgets/read_sura_popup_menu.dart';

class ReadSuraAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  //final void Function() onBookIconPressed;
  final void Function() onNavigatePreviousPressed;
  final void Function() onNavigateNextPressed;

  const ReadSuraAppBar({super.key, 
    required this.title,
   // required this.onBookIconPressed,
    required this.onNavigateNextPressed,
    required this.onNavigatePreviousPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const HomeScreen()));

      }, icon: Icon(Icons.arrow_back)),
      actions: [
        IconButton(
          onPressed: onNavigatePreviousPressed,
          icon: const Icon(Icons.navigate_before),
        ),
        IconButton(
          onPressed: onNavigateNextPressed,
          icon: const Icon(Icons.navigate_next),
        ),

        const ReadSuraPopupMenu()
      ],
    );
  }
}
