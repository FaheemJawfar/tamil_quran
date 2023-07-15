import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:tamil_quran/models/sura_list.dart';
import 'package:tamil_quran/screens/boomarks.dart';
import 'package:tamil_quran/screens/quran_audio_screen.dart';
import 'package:tamil_quran/screens/read_sura.dart';
import 'package:tamil_quran/screens/search_screen.dart';
import 'package:tamil_quran/screens/sura_list.dart';
import 'package:tamil_quran/screens/sura_verse_picker.dart';

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
        primary: false,
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.queue_music)),
              Tab(icon: Icon(Icons.open_in_new)),
            ],
          ),
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
