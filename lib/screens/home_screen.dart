import 'package:flutter/material.dart';
import 'package:tamil_quran/screens/boomarks.dart';
import 'package:tamil_quran/screens/quran_audio_screen.dart';
import 'package:tamil_quran/screens/sura_list.dart';

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
      appBar: AppBar(
        title: const Text('திருக்குர்ஆன்'),
        actions: [
          Padding(
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
          ),
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
          QuranBookmarkScreen()
        ],
      ),
    );
  }
}
