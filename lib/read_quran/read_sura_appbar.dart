import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'read_sura_popup_menu.dart';
import 'sura_details.dart';
import '../providers/quran_provider.dart';

class ReadSuraAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ItemScrollController? tamilScrollController;
  final ScrollController? arabicScrollController;
  final bool arabicOnly;

  const ReadSuraAppBar({
    super.key,
    this.tamilScrollController,
    this.arabicScrollController,
    this.arabicOnly = false,
  });

  @override
  State<ReadSuraAppBar> createState() => _ReadSuraAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ReadSuraAppBarState extends State<ReadSuraAppBar> {
  late final quranProvider = Provider.of<QuranProvider>(context, listen: true);

  void _navigateSura(int increment) {
    final newSura = quranProvider.selectedSuraNumber + increment;
    if (newSura >= 1 && newSura <= 114) {
      quranProvider.selectedSuraNumber = newSura;

      if (widget.arabicOnly) {
       // scrollToStartArabic();
      } else {
        widget.tamilScrollController?.scrollTo(
          index: 0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  scrollToStartArabic() {
    if (widget.arabicOnly) {
      widget.arabicScrollController?.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FittedBox(
        fit: BoxFit.contain,
        child: Text(
            quranProvider.selectedTranslation == 'pj' ? SuraDetails.suraListPj[quranProvider.selectedSuraNumber-1].tamilName:
            SuraDetails.suraListAll[quranProvider.selectedSuraNumber - 1].tamilName),
      ),
      automaticallyImplyLeading: true,
      actions: [
        if(quranProvider.selectedTranslation == 'pj') IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: () => showSuraInfo(context),
          iconSize: 20,
          icon: const Icon(
              Icons.info_outlined),
        ),
        if (!widget.arabicOnly) IconButton(
          onPressed: () => _navigateSura(-1),
          icon: const Icon(Icons.navigate_before),
        ),
        if (!widget.arabicOnly) IconButton(
          onPressed: () => _navigateSura(1),
          icon: const Icon(Icons.navigate_next),
        ),
        const ReadSuraPopupMenu()
      ],
    );
  }



  void showSuraInfo(BuildContext context,) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(25),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '${SuraDetails.suraListPj[quranProvider.selectedSuraNumber-1].tamilName} - ${SuraDetails.suraListPj[quranProvider.selectedSuraNumber-1].tamilMeaning}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                // Wrap the Text widget with Flexible and Expanded for scrolling
                Flexible(
                  child: SingleChildScrollView(
                    child: Text(
                      SuraDetails.suraListPj[quranProvider.selectedSuraNumber-1].reasonForName!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the popup
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



}
