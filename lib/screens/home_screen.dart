import 'package:flutter/material.dart';
import 'package:tamil_quran/config/color_config.dart';
import 'package:tamil_quran/screens/boomarks_screen.dart';
import 'package:tamil_quran/screens/quran_audio_screen.dart';
import 'package:tamil_quran/screens/search_screen.dart';
import 'package:tamil_quran/screens/sura_list_screen.dart';
import 'package:tamil_quran/widgets/sura_verse_picker.dart';
import 'package:tamil_quran/widgets/popup_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.backgroundColor,
      appBar: AppBar(
        title: const Text('திருக்குர்ஆன்'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                _showVersePicker(context);
              },
              icon: const Icon(Icons.shuffle_sharp)),
          const QuranPopupMenu(),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.list)),
            Tab(icon: Icon(Icons.queue_music)),
            Tab(icon: Icon(Icons.bookmarks)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          SuraListScreen(),
          QuranAudioPlayerScreen(),
          BookmarksScreen()
        ],
      ),
    );
  }

  void _showVersePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SuraVersePickerScreen();
      },
    );
  }


}
