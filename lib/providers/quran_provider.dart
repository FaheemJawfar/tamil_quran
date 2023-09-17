import 'package:flutter/material.dart';
import 'package:tamil_quran/helpers/db_helper.dart';
import '../models/sura_details.dart';
import '../models/quran_aya.dart';

class QuranProvider extends ChangeNotifier {

  final List<QuranAya> _allVersesOfQuran = [];
  get allVersesOfQuran => _allVersesOfQuran;

  int _selectedSura = 0;
  int get selectedSura => _selectedSura;

  set selectedSura(int value) {
    _selectedSura = value;
    notifyListeners();
  }

  List<QuranAya> get selectedSuraContent {
    List<QuranAya> suraContent = [];
    if(selectedSura != 1 && selectedSura != 9){
      suraContent.add(_allVersesOfQuran[0]);
    }
    suraContent.addAll(filterOneSura(_selectedSura));
    return suraContent;
  }

  List<QuranAya> filterOneSura(int sura) {
    return _allVersesOfQuran.where((model) => model.suraNumber == sura).toList();
  }

  QuranAya filterOneVerse(int sura, int aya) {
    return _allVersesOfQuran.firstWhere((model) => model.suraNumber == sura && model.ayaNumber == aya);
  }


  String get selectedSuraName {
    return _suraList[_selectedSura - 1].tamilName;
  }


  void loadQuranData() async {
    final db = await DatabaseHelper().database;
    List<Map<String, dynamic>> queryResult = await db.query('quran_db_all');

    for (var verse in queryResult) {
      _allVersesOfQuran.add(QuranAya.fromMap(verse));
    }
  }






  final List<SuraDetails> _suraList = [
    SuraDetails(
        suraNumber: 1,
        tamilName: 'அல்ஃபாத்திஹா',
        tamilMeaning: 'தோற்றுவாய்',
        arabicName: 'الفاتحة',
        verseCount: 7),
    SuraDetails(
        suraNumber: 2,
        tamilName: 'அல்பகரா',
        tamilMeaning: 'பசு மாடு',
        arabicName: 'البقرة',
        verseCount: 286),
    SuraDetails(
        suraNumber: 3,
        tamilName: 'ஆலஇம்ரான்',
        tamilMeaning: 'இம்ரானின் சந்ததிகள்',
        arabicName: 'آل عمران',
        verseCount: 200),
    SuraDetails(
        suraNumber: 4,
        tamilName: 'அன்னிஸாவு',
        tamilMeaning: 'பெண்கள்',
        arabicName: 'النساء',
        verseCount: 176),
    SuraDetails(
        suraNumber: 5,
        tamilName: 'அல்மாயிதா',
        tamilMeaning: 'உணவு மரவை',
        arabicName: 'المائدة',
        verseCount: 120),
    SuraDetails(
        suraNumber: 6,
        tamilName: 'அல் அன்ஆம்',
        tamilMeaning: 'ஆடு, மாடு, ஒட்டகம்',
        arabicName: 'الأنعام',
        verseCount: 165),
    SuraDetails(
        suraNumber: 7,
        tamilName: 'அல் அஃராஃப்',
        tamilMeaning: 'சிகரங்கள்',
        arabicName: 'الأعراف',
        verseCount: 206),
    SuraDetails(
        suraNumber: 8,
        tamilName: 'அல்அன்ஃபால்',
        tamilMeaning: 'போரில் கிடைத்த வெற்றிப்பொருள்கள்',
        arabicName: 'الأنفال',
        verseCount: 75),
    SuraDetails(
        suraNumber: 9,
        tamilName: 'அத்தவ்பா',
        tamilMeaning: 'மனவருந்தி மன்னிப்பு தேடுதல்',
        arabicName: 'التوبة',
        verseCount: 129),
    SuraDetails(
        suraNumber: 10,
        tamilName: 'யூனுஸ்',
        arabicName: 'يونس',
        verseCount: 109),
    SuraDetails(
        suraNumber: 11, tamilName: 'ஹூது', arabicName: 'هود', verseCount: 123),
    SuraDetails(
        suraNumber: 12,
        tamilName: 'யூஸுஃப்',
        arabicName: 'يوسف',
        verseCount: 111),
    SuraDetails(
        suraNumber: 13,
        tamilName: 'அர்ரஃது',
        tamilMeaning: 'இடி',
        arabicName: 'الرعد',
        verseCount: 43),
    SuraDetails(
        suraNumber: 14,
        tamilName: 'இப்ராஹீம்',
        arabicName: 'ابراهيم',
        verseCount: 52),
    SuraDetails(
        suraNumber: 15,
        tamilName: 'அல்ஹிஜ்ர்',
        tamilMeaning: 'மலைப்பாறை',
        arabicName: 'الحجر',
        verseCount: 99),
    SuraDetails(
        suraNumber: 16,
        tamilName: 'அந்நஹ்ல்',
        tamilMeaning: 'தேனி',
        arabicName: 'النحل',
        verseCount: 128),
    SuraDetails(
        suraNumber: 17,
        tamilName: 'பனீ இஸ்ராயீல்',
        tamilMeaning: 'இஸ்ராயீலின் சந்ததிகள்',
        arabicName: 'الإسراء',
        verseCount: 111),
    SuraDetails(
        suraNumber: 18,
        tamilName: 'அல்கஹ்ஃபு',
        tamilMeaning: 'குகை',
        arabicName: 'الكهف',
        verseCount: 110),
    SuraDetails(
        suraNumber: 19,
        tamilName: 'மர்யம்',
        arabicName: 'مريم',
        verseCount: 98),
    SuraDetails(
        suraNumber: 20,
        tamilName: 'தாஹா',
        arabicName: 'طه',
        verseCount: 135),
    SuraDetails(
        suraNumber: 21,
        tamilName: 'அல்அன்பியா',
        tamilMeaning: 'நபிமார்கள்',
        arabicName: 'الأنبياء',
        verseCount: 112),
    SuraDetails(
        suraNumber: 22,
        tamilName: 'அல்ஹஜ்',
        arabicName: 'الحج',
        verseCount: 78),
    SuraDetails(
        suraNumber: 23,
        tamilName: 'அல் முஃமினூன்',
        tamilMeaning: 'விசுவாசிகள்',
        arabicName: 'المؤمنون',
        verseCount: 118),
    SuraDetails(
        suraNumber: 24,
        tamilName: 'அந்நூர்',
        tamilMeaning: 'பேரொளி',
        arabicName: 'النور',
        verseCount: 64),
    SuraDetails(
        suraNumber: 25,
        tamilName: 'அல்ஃபுர்ஃகான்',
        tamilMeaning: 'பிரித்தறிவித்தல்',
        arabicName: 'الفرقان',
        verseCount: 77),
    SuraDetails(
        suraNumber: 26,
        tamilName: 'அஷ்ஷுஃரா',
        tamilMeaning: 'கவிஞர்கள்',
        arabicName: 'الشعراء',
        verseCount: 227),
    SuraDetails(
        suraNumber: 27,
        tamilName: 'அந்நம்லு',
        tamilMeaning: 'எறும்புகள்',
        arabicName: 'النمل',
        verseCount: 93),
    SuraDetails(
        suraNumber: 28,
        tamilName: 'அல் கஸஸ்',
        tamilMeaning: 'வரலாறுகள்',
        arabicName: 'القصص',
        verseCount: 88),
    SuraDetails(
        suraNumber: 29,
        tamilName: 'அல் அன்கபூத்',
        tamilMeaning: 'சிலந்திப் பூச்சி',
        arabicName: 'العنكبوت',
        verseCount: 69),
    SuraDetails(
        suraNumber: 30,
        tamilName: 'அர்ரூம்',
        tamilMeaning: 'ரோமானியப் பேரரசு',
        arabicName: 'الروم',
        verseCount: 60),
    SuraDetails(
        suraNumber: 31,
        tamilName: 'லுக்மான்',
        arabicName: 'لقمان',
        verseCount: 34),
    SuraDetails(
        suraNumber: 32,
        tamilName: 'அஸ்ஸஜ்தா',
        tamilMeaning: 'சிரம் பணிதல்',
        arabicName: 'السجدة',
        verseCount: 30),
    SuraDetails(
        suraNumber: 33,
        tamilName: 'அல் அஹ்ஜாப்',
        tamilMeaning: 'சதிகார அணியினர்',
        arabicName: 'الأحزاب',
        verseCount: 73),
    SuraDetails(
        suraNumber: 34,
        tamilName: 'ஸபா',
        arabicName: 'سبإ',
        verseCount: 54),
    SuraDetails(
        suraNumber: 35,
        tamilName: 'ஃபாதிர்',
        tamilMeaning: 'படைப்பவன்',
        arabicName: 'فاطر',
        verseCount: 45),
    SuraDetails(
        suraNumber: 36,
        tamilName: 'யாஸீன்',
        arabicName: 'يس',
        verseCount: 83),
    SuraDetails(
        suraNumber: 37,
        tamilName: 'அஸ்ஸாஃப்ஃபாத்',
        tamilMeaning: 'அணிவகுப்புகள்',
        arabicName: 'الصافات',
        verseCount: 182),
    SuraDetails(
        suraNumber: 38,
        tamilName: 'ஸாத்',
        arabicName: 'ص',
        verseCount: 88),
    SuraDetails(
        suraNumber: 39,
        tamilName: 'அல் ஜுமர்',
        tamilMeaning: 'கூட்டங்கள்',
        arabicName: 'الزمر',
        verseCount: 75),
    SuraDetails(
        suraNumber: 40,
        tamilName: 'அல் முஃமின்',
        tamilMeaning: 'ஈமான் கொண்டவர்',
        arabicName: 'غافر',
        verseCount: 85),
    SuraDetails(
        suraNumber: 41,
        tamilName: 'ஹாமீம் ஸஜ்தா',
        arabicName: 'فصلت',
        verseCount: 54),
    SuraDetails(
        suraNumber: 42,
        tamilName: 'அஷ்ஷூறா',
        tamilMeaning: 'கலந்தாலோசித்தல்',
        arabicName: 'الشورى',
        verseCount: 53),
    SuraDetails(
        suraNumber: 43,
        tamilName: 'அல் ஜுக்ருஃப்',
        tamilMeaning: 'பொன் அலங்காரம்',
        arabicName: 'الزخرف',
        verseCount: 89),
    SuraDetails(
        suraNumber: 44,
        tamilName: 'அத் துகான்',
        tamilMeaning: 'புகை',
        arabicName: 'الدخان',
        verseCount: 59),
    SuraDetails(
        suraNumber: 45,
        tamilName: 'அல் ஜாஸியா',
        tamilMeaning: 'முழந்தாளிடுதல்',
        arabicName: 'الجاثية',
        verseCount: 37),
    SuraDetails(
        suraNumber: 46,
        tamilName: 'அல் அஹ்காஃப்',
        tamilMeaning: 'மணல் திட்டுகள்',
        arabicName: 'الأحقاف',
        verseCount: 35),
    SuraDetails(
        suraNumber: 47,
        tamilName: 'முஹம்மது',
        arabicName: 'محمد',
        verseCount: 38),
    SuraDetails(
        suraNumber: 48,
        tamilName: 'அல்ஃபத்ஹ்',
        tamilMeaning: 'வெற்றி',
        arabicName: 'الفتح',
        verseCount: 29),
    SuraDetails(
        suraNumber: 49,
        tamilName: 'அல் ஹுஜுராத்',
        tamilMeaning: 'அறைகள்',
        arabicName: 'الحجرات',
        verseCount: 18),
    SuraDetails(
        suraNumber: 50,
        tamilName: 'ஃகாஃப்',
        arabicName: 'ق', verseCount: 45),
    SuraDetails(
        suraNumber: 51,
        tamilName: 'அத்தாரியாத்',
        tamilMeaning: 'புழுதியைக் கிளப்பும் காற்றுகள்',
        arabicName: 'الذاريات',
        verseCount: 60),
    SuraDetails(
        suraNumber: 52,
        tamilName: 'அத் தூர்',
        tamilMeaning: 'மலை',
        arabicName: 'الطور',
        verseCount: 49),
    SuraDetails(
        suraNumber: 53,
        tamilName: 'அந்நஜ்ம்',
        tamilMeaning: 'நட்சத்திரம்',
        arabicName: 'النجم',
        verseCount: 62),
    SuraDetails(
        suraNumber: 54,
        tamilName: 'அல் கமர்',
        tamilMeaning: 'சந்திரன்',
        arabicName: 'القمر',
        verseCount: 55),
    SuraDetails(
        suraNumber: 55,
        tamilName: 'அர்ரஹ்மான்',
        tamilMeaning: 'அளவற்ற அருளாளன்',
        arabicName: 'الرحمن',
        verseCount: 78),
    SuraDetails(
        suraNumber: 56,
        tamilName: 'அல்வாகிஆ',
        tamilMeaning: 'மாபெரும் நிகழ்ச்சி',
        arabicName: 'الواقعة',
        verseCount: 96),
    SuraDetails(
        suraNumber: 57,
        tamilName: 'அல் ஹதீத்',
        tamilMeaning: 'இரும்பு',
        arabicName: 'الحديد',
        verseCount: 29),
    SuraDetails(
        suraNumber: 58,
        tamilName: 'அல் முஜாதலா',
        tamilMeaning: 'தர்க்கித்தல்',
        arabicName: 'المجادلة',
        verseCount: 22),
    SuraDetails(
        suraNumber: 59,
        tamilName: 'அல் ஹஷ்ர்',
        tamilMeaning: 'ஒன்று கூட்டுதல்',
        arabicName: 'الحشر',
        verseCount: 24),
    SuraDetails(
        suraNumber: 60,
        tamilName: 'அல் மும்தஹினா',
        tamilMeaning: 'பரிசோதித்தல்',
        arabicName: 'الممتحنة',
        verseCount: 13),
    SuraDetails(
        suraNumber: 61,
        tamilName: 'அஸ்ஸஃப்ஃபு',
        tamilMeaning: 'அணிவகுப்பு',
        arabicName: 'الصف',
        verseCount: 14),
    SuraDetails(
        suraNumber: 62,
        tamilName: 'அல் ஜுமுஆ',
        tamilMeaning: 'வெள்ளிக் கிழமை',
        arabicName: 'الجمعة',
        verseCount: 11),
    SuraDetails(
        suraNumber: 63,
        tamilName: 'அல் முனாஃபிஃகூன்',
        tamilMeaning: 'நயவஞ்சகர்கள்',
        arabicName: 'المنافقون',
        verseCount: 11),
    SuraDetails(
        suraNumber: 64,
        tamilName: 'அல் தகாபுன்',
        tamilMeaning: 'நஷ்டம்',
        arabicName: 'التغابن',
        verseCount: 18),
    SuraDetails(
        suraNumber: 65,
        tamilName: 'அத்தலாக்',
        tamilMeaning: 'விவாகரத்து',
        arabicName: 'الطلاق',
        verseCount: 12),
    SuraDetails(
        suraNumber: 66,
        tamilName: 'அத்தஹ்ரீம்',
        tamilMeaning: 'விலக்குதல்',
        arabicName: 'التحريم',
        verseCount: 12),
    SuraDetails(
        suraNumber: 67,
        tamilName: 'அல் முல்க்',
        tamilMeaning: 'ஆட்சி',
        arabicName: 'الملك',
        verseCount: 30),
    SuraDetails(
        suraNumber: 68,
        tamilName: 'அல் கலம்',
        tamilMeaning: 'எழுதுகோல்',
        arabicName: 'القلم',
        verseCount: 52),
    SuraDetails(
        suraNumber: 69,
        tamilName: 'அல் ஹாக்கா',
        tamilMeaning: 'நிச்சயமானது',
        arabicName: 'الحاقة',
        verseCount: 52),
    SuraDetails(
        suraNumber: 70,
        tamilName: 'அல் மஆரிஜ்',
        tamilMeaning: 'உயர்வழிகள்',
        arabicName: 'المعارج',
        verseCount: 44),
    SuraDetails(
        suraNumber: 71,
        tamilName: 'நூஹ்',
        arabicName: 'نوح',
        verseCount: 28),
    SuraDetails(
        suraNumber: 72,
        tamilName: 'அல் ஜின்',
        tamilMeaning: 'ஜின்கள்',
        arabicName: 'الجن',
        verseCount: 28),
    SuraDetails(
        suraNumber: 73,
        tamilName: 'அல் முஸ்ஸம்மில்',
        tamilMeaning: 'போர்வை போர்த்தியவர்',
        arabicName: 'المزمل',
        verseCount: 20),
    SuraDetails(
        suraNumber: 74,
        tamilName: 'அல் முத்தஸ்ஸிர்',
        tamilMeaning: 'போர்த்திக்கொண்டிருப்பவர்',
        arabicName: 'المدثر',
        verseCount: 56),
    SuraDetails(
        suraNumber: 75,
        tamilName: 'அல்கியாமா',
        tamilMeaning: 'மறுமை நாள்',
        arabicName: 'القيامة',
        verseCount: 40),
    SuraDetails(
        suraNumber: 76,
        tamilName: 'அத்தஹ்ரு',
        tamilMeaning: 'காலம்',
        arabicName: 'الانسان',
        verseCount: 31),
    SuraDetails(
        suraNumber: 77,
        tamilName: 'அல்முர்ஸலாத்',
        tamilMeaning: 'அனுப்பப்படுபவை',
        arabicName: 'المرسلات',
        verseCount: 50),
    SuraDetails(
        suraNumber: 78,
        tamilName: 'அந்நபவு',
        tamilMeaning: 'பெரும் செய்தி',
        arabicName: 'النبإ',
        verseCount: 40),
    SuraDetails(
        suraNumber: 79,
        tamilName: 'அந்நாஜிஆத்',
        tamilMeaning: 'பறிப்பவர்கள்',
        arabicName: 'النازعات',
        verseCount: 46),
    SuraDetails(
        suraNumber: 80,
        tamilName: 'அபஸ',
        tamilMeaning: 'கடு கடுத்தார்',
        arabicName: 'عبس',
        verseCount: 42),
    SuraDetails(
        suraNumber: 81,
        tamilName: 'அத்தக்வீர்',
        tamilMeaning: 'சுருட்டுதல்',
        arabicName: 'التكوير',
        verseCount: 29),
    SuraDetails(
        suraNumber: 82,
        tamilName: 'அல் இன்ஃபிதார்',
        tamilMeaning: 'வெடித்துப் போதல்',
        arabicName: 'الإنفطار',
        verseCount: 19),
    SuraDetails(
        suraNumber: 83,
        tamilName: 'அல் முதஃப்ஃபிஃபீன்',
        tamilMeaning: 'அளவு நிறுவையில் மோசம் செய்தல்',
        arabicName: 'المطففين',
        verseCount: 36),
    SuraDetails(
        suraNumber: 84,
        tamilName: 'அல் இன்ஷிகாக்',
        tamilMeaning: 'பிளந்து போதல்',
        arabicName: 'الإنشقاق',
        verseCount: 25),
    SuraDetails(
        suraNumber: 85,
        tamilName: 'அல் புரூஜ்',
        tamilMeaning: 'கிரகங்கள்',
        arabicName: 'البروج',
        verseCount: 22),
    SuraDetails(
        suraNumber: 86,
        tamilName: 'அத்தாரிக்',
        tamilMeaning: 'விடிவெள்ளி',
        arabicName: 'الطارق',
        verseCount: 17),
    SuraDetails(
        suraNumber: 87,
        tamilName: 'அல் அஃலா',
        tamilMeaning: 'மிக்க மேலானவன்',
        arabicName: 'الأعلى',
        verseCount: 19),
    SuraDetails(
        suraNumber: 88,
        tamilName: 'அல் காஷியா',
        tamilMeaning: 'மூடிக் கொள்ளுதல்',
        arabicName: 'الغاشية',
        verseCount: 26),
    SuraDetails(
        suraNumber: 89,
        tamilName: 'அல் ஃபஜ்ர்',
        tamilMeaning: 'விடியற்காலை',
        arabicName: 'الفجر',
        verseCount: 30),
    SuraDetails(
        suraNumber: 90,
        tamilName: 'அல் பலத்',
        tamilMeaning: 'நகரம்',
        arabicName: 'البلد',
        verseCount: 20),
    SuraDetails(
        suraNumber: 91,
        tamilName: 'அஷ்ஷம்ஸ்',
        tamilMeaning: 'சூரியன்',
        arabicName: 'الشمس',
        verseCount: 15),
    SuraDetails(
        suraNumber: 92,
        tamilName: 'அல் லைல்',
        tamilMeaning: 'இரவு',
        arabicName: 'الليل',
        verseCount: 21),
    SuraDetails(
        suraNumber: 93,
        tamilName: 'அள்ளுஹா',
        tamilMeaning: 'முற்பகல்',
        arabicName: 'الضحى',
        verseCount: 11),
    SuraDetails(
        suraNumber: 94,
        tamilName: 'அலம் நஷ்ரஹ்',
        tamilMeaning: 'விரிவாக்கல்',
        arabicName: 'الشرح',
        verseCount: 8),
    SuraDetails(
        suraNumber: 95,
        tamilName: 'அத்தீன்',
        tamilMeaning: 'அத்தி',
        arabicName: 'التين',
        verseCount: 8),
    SuraDetails(
        suraNumber: 96,
        tamilName: 'அல் அலக்',
        tamilMeaning: 'இரத்தக்கட்டி',
        arabicName: 'العلق',
        verseCount: 19),
    SuraDetails(
        suraNumber: 97,
        tamilName: 'அல் கத்ரி',
        tamilMeaning: 'கண்ணியமிக்க இரவு',
        arabicName: 'القدر',
        verseCount: 5),
    SuraDetails(
        suraNumber: 98,
        tamilName: 'அல் பய்யினா',
        tamilMeaning: 'தெளிவான ஆதாரம்',
        arabicName: 'البينة',
        verseCount: 8),
    SuraDetails(
        suraNumber: 99,
        tamilName: 'அல் ஜில்ஜால்',
        tamilMeaning: 'அதிர்ச்சி',
        arabicName: 'الزلزلة',
        verseCount: 8),
    SuraDetails(
        suraNumber: 100,
        tamilName: 'அல் ஆதியாத்',
        tamilMeaning: 'வேகமாகச் செல்லுபவை',
        arabicName: 'العاديات',
        verseCount: 11),
    SuraDetails(
        suraNumber: 101,
        tamilName: 'அல்காரிஆ',
        tamilMeaning: 'திடுக்கிடச் செய்யும் நிகழ்ச்சி',
        arabicName: 'القارعة',
        verseCount: 11),
    SuraDetails(
        suraNumber: 102,
        tamilName: 'அத்தகாஸுர்',
        tamilMeaning: 'பேராசை',
        arabicName: 'التكاثر',
        verseCount: 8),
    SuraDetails(
        suraNumber: 103,
        tamilName: 'அல் அஸ்ர்',
        tamilMeaning: 'காலம்',
        arabicName: 'العصر',
        verseCount: 3),
    SuraDetails(
        suraNumber: 104,
        tamilName: 'அல் ஹுமஜா',
        tamilMeaning: 'புறங்கூறல்',
        arabicName: 'الهمزة',
        verseCount: 9),
    SuraDetails(
        suraNumber: 105,
        tamilName: 'அல் ஃபீல்',
        tamilMeaning: 'யானை',
        arabicName: 'الفيل',
        verseCount: 5),
    SuraDetails(
        suraNumber: 106,
        tamilName: 'குறைஷின்',
        tamilMeaning: 'குறைஷிகள்',
        arabicName: 'قريش',
        verseCount: 4),
    SuraDetails(
        suraNumber: 107,
        tamilName: 'அல் மாஊன்',
        tamilMeaning: 'அற்பப் பொருட்கள்',
        arabicName: 'الماعون',
        verseCount: 7),
    SuraDetails(
        suraNumber: 108,
        tamilName: 'அல் கவ்ஸர்',
        tamilMeaning: 'மிகுந்த நன்மைகள்',
        arabicName: 'الكوثر',
        verseCount: 3),
    SuraDetails(
        suraNumber: 109,
        tamilName: 'அல் காஃபிரூன்',
        tamilMeaning: 'காஃபிர்கள்',
        arabicName: 'الكافرون',
        verseCount: 6),
    SuraDetails(
        suraNumber: 110,
        tamilName: 'அந்நஸ்ர்',
        tamilMeaning: 'உதவி',
        arabicName: 'النصر',
        verseCount: 3),
    SuraDetails(
        suraNumber: 111,
        tamilName: 'தப்பத்',
        tamilMeaning: 'அழிந்துவிட்டது',
        arabicName: 'المسد',
        verseCount: 5),
    SuraDetails(
        suraNumber: 112,
        tamilName: 'அல் இக்லாஸ்',
        tamilMeaning: 'ஏகத்துவம்',
        arabicName: 'الإخلاص',
        verseCount: 4),
    SuraDetails(
        suraNumber: 113,
        tamilName: 'அல் ஃபலக்',
        tamilMeaning: 'அதிகாலை',
        arabicName: 'الفلق',
        verseCount: 5),
    SuraDetails(
        suraNumber: 114,
        tamilName: 'அந்நாஸ்',
        tamilMeaning: 'மனிதர்கள்',
        arabicName: 'الناس',
        verseCount: 6)
  ];

  List<SuraDetails> get suraList => _suraList;
}
