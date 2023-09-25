import 'package:tamil_quran/models/quran_aya.dart';

class QuranSura {
  final int index;
  final List<QuranAya> listOfAyas;

  QuranSura(this.index, this.listOfAyas);


  List<QuranAya> searchWord(String word) {
    return listOfAyas.where((aya) => aya.text.toLowerCase().contains(word.toLowerCase())).toList();
  }
}