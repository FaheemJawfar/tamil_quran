import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../widgets/read_sura_popup_menu.dart';
import '../models/sura_details.dart';
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
  late final quranProvider = Provider.of<QuranProvider>(context, listen: false);

  void _navigateSura(int increment) {
    final newSura = quranProvider.selectedSuraNumber + increment;
    if (newSura >= 1 && newSura <= 114) {
      quranProvider.selectedSuraNumber = newSura;

      if (widget.arabicOnly) {
        scrollToStartArabic();
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
      title: Text(
          SuraDetails.suraList[quranProvider.selectedSuraNumber - 1].tamilName),
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
          onPressed: () => _navigateSura(-1),
          icon: const Icon(Icons.navigate_before),
        ),
        IconButton(
          onPressed: () => _navigateSura(1),
          icon: const Icon(Icons.navigate_next),
        ),
        const ReadSuraPopupMenu()
      ],
    );
  }
}
