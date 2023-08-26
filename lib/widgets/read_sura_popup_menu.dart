import 'package:flutter/material.dart';


class ReadSuraPopupMenu extends StatefulWidget {
  const ReadSuraPopupMenu({super.key});

  @override
  State<ReadSuraPopupMenu> createState() => _ReadSuraPopupMenuState();
}

class _ReadSuraPopupMenuState extends State<ReadSuraPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: PopupMenuButton<String>(
        color: Colors.green.shade100,
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            onTap: () => print('settings'),
            child: getPopupMenuItem(Icons.settings, 'அமைப்புகள்'),
          ),
          PopupMenuItem<String>(
            child: getPopupMenuItem(Icons.shuffle, 'வசனத்திற்குச் செல்க'),
          ),
          PopupMenuItem<String>(
            child: getPopupMenuItem(
                Icons.text_increase, 'எழுத்துரு அளவு +'),
          ),

          PopupMenuItem<String>(
            child: getPopupMenuItem(
                Icons.text_decrease, 'எழுத்துரு அளவு -'),
          ),
        ],

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
