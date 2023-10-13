import 'package:flutter/material.dart';
import '../app_texts/app_screen_texts.dart';
import '../bookmarks/bookmarks_screen.dart';
import '../quran_audio/quran_audio_screen.dart';
import '../search/search_screen.dart';
import 'sura_list_arabic_screen.dart';
import 'sura_list_tamil_screen.dart';
import 'sura_verse_picker.dart';
import 'home_popup_menu.dart';
import 'quran_app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 3, vsync: this);
  late String _appBarTitle = getAppbarTitle();

  @override
  void initState() {
    super.initState();
    _tabController.addListener(_updateTitle);
  }

  @override
  void dispose() {
    _tabController.removeListener(_updateTitle);
    _tabController.dispose();
    super.dispose();
  }

  void _updateTitle() {
    setState(() {
      _appBarTitle = getAppbarTitle();
    });
  }

  String getAppbarTitle() {
    switch (_tabController.index) {
      case 0:
        return AppScreenTexts.translation;

      case 1:
        return AppScreenTexts.onlyArabic;

      case 2:
        return AppScreenTexts.bookmarks;

      default:
        return '';
    }
  }

  void _showVersePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const SuraVersePickerScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              _appBarTitle,
              style: TextStyle(fontSize: 16),
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
              icon: const Icon(Icons.search_sharp)),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuranAudioPlayerScreen()));
            },
            icon: const ImageIcon(
              AssetImage('assets/images/quran-audio.png'),
            ),
          ),
          IconButton(
              onPressed: () {
                _showVersePicker(context);
              },
              icon: const Icon(Icons.shuffle_sharp)),
          const HomeScreenPopupMenu(),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: ImageIcon(
                AssetImage('assets/images/quran_book.png'),
              ),
            ),
            Tab(
              icon: ImageIcon(
                AssetImage('assets/images/read_quran.png'),
              ),
            ),
            Tab(icon: Icon(Icons.bookmarks)),
          ],
        ),
      ),
      drawer: const QuranAppDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          SuraListTamilScreen(),
          SuraListArabicScreen(),
          BookmarksScreen(),
        ],
      ),
    );
  }
}
