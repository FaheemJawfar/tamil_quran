import 'package:flutter/material.dart';
import 'package:tamil_quran/screens/boomarks_screen.dart';
import 'package:tamil_quran/screens/quran_audio_screen.dart';
import 'package:tamil_quran/screens/search_screen.dart';
import 'package:tamil_quran/screens/sura_list_arabic_screen.dart';
import 'package:tamil_quran/screens/sura_list_tamil_screen.dart';
import 'package:tamil_quran/widgets/sura_verse_picker.dart';
import 'package:tamil_quran/widgets/home_popup_menu.dart';

import '../widgets/quran_drawer.dart';

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
        return 'மொழிபெயர்ப்பு';

      case 1:
        return 'அரபு மூலம்';

      case 2:
        return 'புத்தகக்குறிகள்';

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
        title: FittedBox(fit: BoxFit.contain, child: Text(_appBarTitle)),
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
            ),),

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
            // Tab(
            //   icon: ImageIcon(
            //     AssetImage('assets/images/audio-book.png'),
            //   ),
            // ),
            Tab(icon: Icon(Icons.bookmarks)),
          ],
        ),
      ),

      drawer: const CustomDrawer(),
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
