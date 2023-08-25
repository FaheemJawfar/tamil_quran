import 'package:flutter/material.dart';


class HomeScreenPopupMenu extends StatefulWidget {
  const HomeScreenPopupMenu({super.key});

  @override
  State<HomeScreenPopupMenu> createState() => _HomeScreenPopupMenuState();
}

class _HomeScreenPopupMenuState extends State<HomeScreenPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: PopupMenuButton<String>(
        color: Colors.green.shade100,
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'settings',
            child: getPopupMenuItem(Icons.settings, 'Settings'),
          ),
          PopupMenuItem<String>(
            value: 'share_app',
            child: getPopupMenuItem(Icons.share, 'Share App'),
          ),
          PopupMenuItem<String>(
            value: 'about_us',
            child: getPopupMenuItem(
                Icons.info, 'About us'),
          ),
        ],
        onSelected: (String value) {
          switch (value) {
            case 'settings':

              break;
            case 'share_app':

              break;
            case 'about_us':

              break;
          }
        },
        child: const Icon(Icons.more_vert),
      )
    );
  }

  Widget getPopupMenuItem(IconData icon, String title) {
    return ListTile(
      iconColor: Colors.green.shade700,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
