import 'package:flutter/material.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import '../app_texts/home_texts.dart';
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
        return HomeTexts.translation;

      case 1:
        return HomeTexts.onlyArabic;

      case 2:
        return HomeTexts.bookmarks;

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
              style: const TextStyle(fontSize: 16),
            )),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(LucideIcons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
              icon: const Icon(LucideIcons.search)),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuranAudioPlayerScreen()));
            },
            icon: const Icon(LucideIcons.headphones),
          ),
          IconButton(
            onPressed: () {
              _showVersePicker(context);
            },
            icon: const Icon(LucideIcons.navigation),
          ),
          const HomeScreenPopupMenu(),
        ],
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
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tabController.index,
        onDestinationSelected: (int index) {
          setState(() {
            _tabController.index = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: ImageIcon(AssetImage('assets/images/read_quran.png')),
            label: HomeTexts.translation,
          ),
          NavigationDestination(
            icon: ImageIcon(AssetImage('assets/images/quran_book.png')),
            label: HomeTexts.onlyArabic,
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark),
            label: HomeTexts.bookmarks,
          ),
        ],
      ),
    );
  }
}
