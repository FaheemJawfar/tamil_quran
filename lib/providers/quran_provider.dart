import 'package:flutter/material.dart';
import 'package:tamil_quran/helpers/db_helper.dart';
import '../models/sura_list.dart';
import '../models/verse_model.dart';

class QuranProvider extends ChangeNotifier {

  final List<VerseModel> _allVersesOfQuran = [];

  get allVersesOfQuran => _allVersesOfQuran;



  void loadQuranData() async {
    final db = await DatabaseHelper().database;
    List<Map<String, dynamic>> queryResult = await db.query('quran_db_all');

    for (var verse in queryResult) {
      _allVersesOfQuran.add(VerseModel.fromMap(verse));
    }

    print('Quran verses loaded: ${_allVersesOfQuran.length}');
  }


  List<VerseModel> filterBySura(int sura) {
    return _allVersesOfQuran.where((model) => model.sura == sura).toList();
  }




  final List<SuraModel> _suraList = [
    SuraModel(
        suraNumber: 1,
        tamilName: 'அல்ஃபாத்திஹா',
        tamilMeaning: 'தோற்றுவாய்',
        arabicName: 'الفاتحة',
        verseCount: 7),
    SuraModel(
        suraNumber: 2,
        tamilName: 'அல்பகரா',
        tamilMeaning: 'பசு மாடு',
        arabicName: 'البقرة',
        verseCount: 286),
    SuraModel(
        suraNumber: 3,
        tamilName: 'ஆலஇம்ரான்',
        tamilMeaning: 'இம்ரானின் சந்ததிகள்',
        arabicName: 'آل عمران',
        verseCount: 200),
    SuraModel(
        suraNumber: 4,
        tamilName: 'அன்னிஸாவு',
        tamilMeaning: 'பெண்கள்',
        arabicName: 'النساء',
        verseCount: 176),
    SuraModel(
        suraNumber: 5,
        tamilName: 'அல்மாயிதா',
        tamilMeaning: 'உணவு மரவை',
        arabicName: 'المائدة',
        verseCount: 120),
    SuraModel(
        suraNumber: 6,
        tamilName: 'அல் அன்ஆம்',
        tamilMeaning: 'ஆடு, மாடு, ஒட்டகம்',
        arabicName: 'الأنعام',
        verseCount: 165),
    SuraModel(
        suraNumber: 7,
        tamilName: 'அல் அஃராஃப்',
        tamilMeaning: 'சிகரங்கள்',
        arabicName: 'الأعراف',
        verseCount: 206),
    SuraModel(
        suraNumber: 8,
        tamilName: 'அல்அன்ஃபால்',
        tamilMeaning: 'போரில் கிடைத்த வெற்றிப்பொருள்கள்',
        arabicName: 'الأنفال',
        verseCount: 75),
    SuraModel(
        suraNumber: 9,
        tamilName: 'அத்தவ்பா',
        tamilMeaning: 'மனவருந்தி மன்னிப்பு தேடுதல்',
        arabicName: 'التوبة',
        verseCount: 129),
    SuraModel(
        suraNumber: 10,
        tamilName: 'யூனுஸ்',
        arabicName: 'يونس',
        verseCount: 109),
    SuraModel(
        suraNumber: 11, tamilName: 'ஹூது', arabicName: 'هود', verseCount: 123),
    SuraModel(
        suraNumber: 12,
        tamilName: 'யூஸுஃப்',
        arabicName: 'يوسف',
        verseCount: 111),
    SuraModel(
        suraNumber: 13,
        tamilName: 'அர்ரஃது',
        tamilMeaning: 'இடி',
        arabicName: 'الرعد',
        verseCount: 43),
    SuraModel(
        suraNumber: 14,
        tamilName: 'இப்ராஹீம்',
        arabicName: 'ابراهيم',
        verseCount: 52),
    SuraModel(
        suraNumber: 15,
        tamilName: 'அல்ஹிஜ்ர்',
        tamilMeaning: 'மலைப்பாறை',
        arabicName: 'الحجر',
        verseCount: 99),
    SuraModel(
        suraNumber: 16,
        tamilName: 'அந்நஹ்ல்',
        tamilMeaning: 'தேனி',
        arabicName: 'النحل',
        verseCount: 128),
    SuraModel(
        suraNumber: 17,
        tamilName: 'பனீ இஸ்ராயீல்',
        tamilMeaning: 'இஸ்ராயீலின் சந்ததிகள்',
        arabicName: 'الإسراء',
        verseCount: 111),
    SuraModel(
        suraNumber: 18,
        tamilName: 'அல்கஹ்ஃபு',
        tamilMeaning: 'குகை',
        arabicName: 'الكهف',
        verseCount: 110),
    SuraModel(
        suraNumber: 19,
        tamilName: 'மர்யம்',
        arabicName: 'مريم',
        verseCount: 98),
    SuraModel(
        suraNumber: 20,
        tamilName: 'தாஹா',
        arabicName: 'طه',
        verseCount: 135),
    SuraModel(
        suraNumber: 21,
        tamilName: 'அல்அன்பியா',
        tamilMeaning: 'நபிமார்கள்',
        arabicName: 'الأنبياء',
        verseCount: 112),
    SuraModel(
        suraNumber: 22,
        tamilName: 'அல்ஹஜ்',
        arabicName: 'الحج',
        verseCount: 78),
    SuraModel(
        suraNumber: 23,
        tamilName: 'அல் முஃமினூன்',
        tamilMeaning: 'விசுவாசிகள்',
        arabicName: 'المؤمنون',
        verseCount: 118),
    SuraModel(
        suraNumber: 24,
        tamilName: 'அந்நூர்',
        tamilMeaning: 'பேரொளி',
        arabicName: 'النور',
        verseCount: 64),
    SuraModel(
        suraNumber: 25,
        tamilName: 'அல்ஃபுர்ஃகான்',
        tamilMeaning: 'பிரித்தறிவித்தல்',
        arabicName: 'الفرقان',
        verseCount: 77),
    SuraModel(
        suraNumber: 26,
        tamilName: 'அஷ்ஷுஃரா',
        tamilMeaning: 'கவிஞர்கள்',
        arabicName: 'الشعراء',
        verseCount: 227),
    SuraModel(
        suraNumber: 27,
        tamilName: 'அந்நம்லு',
        tamilMeaning: 'எறும்புகள்',
        arabicName: 'النمل',
        verseCount: 93),
    SuraModel(
        suraNumber: 28,
        tamilName: 'அல் கஸஸ்',
        tamilMeaning: 'வரலாறுகள்',
        arabicName: 'القصص',
        verseCount: 88),
    SuraModel(
        suraNumber: 29,
        tamilName: 'அல் அன்கபூத்',
        tamilMeaning: 'சிலந்திப் பூச்சி',
        arabicName: 'العنكبوت',
        verseCount: 69),
    SuraModel(
        suraNumber: 30,
        tamilName: 'அர்ரூம்',
        tamilMeaning: 'ரோமானியப் பேரரசு',
        arabicName: 'الروم',
        verseCount: 60),
    SuraModel(
        suraNumber: 31,
        tamilName: 'லுக்மான்',
        arabicName: 'لقمان',
        verseCount: 34),
    SuraModel(
        suraNumber: 32,
        tamilName: 'அஸ்ஸஜ்தா',
        tamilMeaning: 'சிரம் பணிதல்',
        arabicName: 'السجدة',
        verseCount: 30),
    SuraModel(
        suraNumber: 33,
        tamilName: 'அல் அஹ்ஜாப்',
        tamilMeaning: 'சதிகார அணியினர்',
        arabicName: 'الأحزاب',
        verseCount: 73),
    SuraModel(
        suraNumber: 34,
        tamilName: 'ஸபா',
        arabicName: 'سبإ',
        verseCount: 54),
    SuraModel(
        suraNumber: 35,
        tamilName: 'ஃபாதிர்',
        tamilMeaning: 'படைப்பவன்',
        arabicName: 'فاطر',
        verseCount: 45),
    SuraModel(
        suraNumber: 36,
        tamilName: 'யாஸீன்',
        arabicName: 'يس',
        verseCount: 83),
    SuraModel(
        suraNumber: 37,
        tamilName: 'அஸ்ஸாஃப்ஃபாத்',
        tamilMeaning: 'அணிவகுப்புகள்',
        arabicName: 'الصافات',
        verseCount: 182),
    SuraModel(
        suraNumber: 38,
        tamilName: 'ஸாத்',
        arabicName: 'ص',
        verseCount: 88),
    SuraModel(
        suraNumber: 39,
        tamilName: 'அல் ஜுமர்',
        tamilMeaning: 'கூட்டங்கள்',
        arabicName: 'الزمر',
        verseCount: 75),
    SuraModel(
        suraNumber: 40,
        tamilName: 'அல் முஃமின்',
        tamilMeaning: 'ஈமான் கொண்டவர்',
        arabicName: 'غافر',
        verseCount: 85),
    SuraModel(
        suraNumber: 41,
        tamilName: 'ஹாமீம் ஸஜ்தா',
        arabicName: 'فصلت',
        verseCount: 54),
    SuraModel(
        suraNumber: 42,
        tamilName: 'அஷ்ஷூறா',
        tamilMeaning: 'கலந்தாலோசித்தல்',
        arabicName: 'الشورى',
        verseCount: 53),
    SuraModel(
        suraNumber: 43,
        tamilName: 'அல் ஜுக்ருஃப்',
        tamilMeaning: 'பொன் அலங்காரம்',
        arabicName: 'الزخرف',
        verseCount: 89),
    SuraModel(
        suraNumber: 44,
        tamilName: 'அத் துகான்',
        tamilMeaning: 'புகை',
        arabicName: 'الدخان',
        verseCount: 59),
    SuraModel(
        suraNumber: 45,
        tamilName: 'அல் ஜாஸியா',
        tamilMeaning: 'முழந்தாளிடுதல்',
        arabicName: 'الجاثية',
        verseCount: 37),
    SuraModel(
        suraNumber: 46,
        tamilName: 'அல் அஹ்காஃப்',
        tamilMeaning: 'மணல் திட்டுகள்',
        arabicName: 'الأحقاف',
        verseCount: 35),
    SuraModel(
        suraNumber: 47,
        tamilName: 'முஹம்மது',
        arabicName: 'محمد',
        verseCount: 38),
    SuraModel(
        suraNumber: 48,
        tamilName: 'அல்ஃபத்ஹ்',
        tamilMeaning: 'வெற்றி',
        arabicName: 'الفتح',
        verseCount: 29),
    SuraModel(
        suraNumber: 49,
        tamilName: 'அல் ஹுஜுராத்',
        tamilMeaning: 'அறைகள்',
        arabicName: 'الحجرات',
        verseCount: 18),
    SuraModel(
        suraNumber: 50,
        tamilName: 'ஃகாஃப்',
        arabicName: 'ق', verseCount: 45),
    SuraModel(
        suraNumber: 51,
        tamilName: 'அத்தாரியாத்',
        tamilMeaning: 'புழுதியைக் கிளப்பும் காற்றுகள்',
        arabicName: 'الذاريات',
        verseCount: 60),
    SuraModel(
        suraNumber: 52,
        tamilName: 'அத் தூர்',
        tamilMeaning: 'மலை',
        arabicName: 'الطور',
        verseCount: 49),
    SuraModel(
        suraNumber: 53,
        tamilName: 'அந்நஜ்ம்',
        tamilMeaning: 'நட்சத்திரம்',
        arabicName: 'النجم',
        verseCount: 62),
    SuraModel(
        suraNumber: 54,
        tamilName: 'அல் கமர்',
        tamilMeaning: 'சந்திரன்',
        arabicName: 'القمر',
        verseCount: 55),
    SuraModel(
        suraNumber: 55,
        tamilName: 'அர்ரஹ்மான்',
        tamilMeaning: 'அளவற்ற அருளாளன்',
        arabicName: 'الرحمن',
        verseCount: 78),
    SuraModel(
        suraNumber: 56,
        tamilName: 'அல்வாகிஆ',
        tamilMeaning: 'மாபெரும் நிகழ்ச்சி',
        arabicName: 'الواقعة',
        verseCount: 96),
    SuraModel(
        suraNumber: 57,
        tamilName: 'அல் ஹதீத்',
        tamilMeaning: 'இரும்பு',
        arabicName: 'الحديد',
        verseCount: 29),
    SuraModel(
        suraNumber: 58,
        tamilName: 'அல் முஜாதலா',
        tamilMeaning: 'தர்க்கித்தல்',
        arabicName: 'المجادلة',
        verseCount: 22),
    SuraModel(
        suraNumber: 59,
        tamilName: 'அல் ஹஷ்ர்',
        tamilMeaning: 'ஒன்று கூட்டுதல்',
        arabicName: 'الحشر',
        verseCount: 24),
    SuraModel(
        suraNumber: 60,
        tamilName: 'அல் மும்தஹினா',
        tamilMeaning: 'பரிசோதித்தல்',
        arabicName: 'الممتحنة',
        verseCount: 13),
    SuraModel(
        suraNumber: 61,
        tamilName: 'அஸ்ஸஃப்ஃபு',
        tamilMeaning: 'அணிவகுப்பு',
        arabicName: 'الصف',
        verseCount: 14),
    SuraModel(
        suraNumber: 62,
        tamilName: 'அல் ஜுமுஆ',
        tamilMeaning: 'வெள்ளிக் கிழமை',
        arabicName: 'الجمعة',
        verseCount: 11),
    SuraModel(
        suraNumber: 63,
        tamilName: 'அல் முனாஃபிஃகூன்',
        tamilMeaning: 'நயவஞ்சகர்கள்',
        arabicName: 'المنافقون',
        verseCount: 11),
    SuraModel(
        suraNumber: 64,
        tamilName: 'அல் தகாபுன்',
        tamilMeaning: 'நஷ்டம்',
        arabicName: 'التغابن',
        verseCount: 18),
    SuraModel(
        suraNumber: 65,
        tamilName: 'அத்தலாக்',
        tamilMeaning: 'விவாகரத்து',
        arabicName: 'الطلاق',
        verseCount: 12),
    SuraModel(
        suraNumber: 66,
        tamilName: 'அத்தஹ்ரீம்',
        tamilMeaning: 'விலக்குதல்',
        arabicName: 'التحريم',
        verseCount: 12),
    SuraModel(
        suraNumber: 67,
        tamilName: 'அல் முல்க்',
        tamilMeaning: 'ஆட்சி',
        arabicName: 'الملك',
        verseCount: 30),
    SuraModel(
        suraNumber: 68,
        tamilName: 'அல் கலம்',
        tamilMeaning: 'எழுதுகோல்',
        arabicName: 'القلم',
        verseCount: 52),
    SuraModel(
        suraNumber: 69,
        tamilName: 'அல் ஹாக்கா',
        tamilMeaning: 'நிச்சயமானது',
        arabicName: 'الحاقة',
        verseCount: 52),
    SuraModel(
        suraNumber: 70,
        tamilName: 'அல் மஆரிஜ்',
        tamilMeaning: 'உயர்வழிகள்',
        arabicName: 'المعارج',
        verseCount: 44),
    SuraModel(
        suraNumber: 71,
        tamilName: 'நூஹ்',
        arabicName: 'نوح',
        verseCount: 28),
    SuraModel(
        suraNumber: 72,
        tamilName: 'அல் ஜின்',
        tamilMeaning: 'ஜின்கள்',
        arabicName: 'الجن',
        verseCount: 28),
    SuraModel(
        suraNumber: 73,
        tamilName: 'அல் முஸ்ஸம்மில்',
        tamilMeaning: 'போர்வை போர்த்தியவர்',
        arabicName: 'المزمل',
        verseCount: 20),
    SuraModel(
        suraNumber: 74,
        tamilName: 'அல் முத்தஸ்ஸிர்',
        tamilMeaning: 'போர்த்திக்கொண்டிருப்பவர்',
        arabicName: 'المدثر',
        verseCount: 56),
    SuraModel(
        suraNumber: 75,
        tamilName: 'அல்கியாமா',
        tamilMeaning: 'மறுமை நாள்',
        arabicName: 'القيامة',
        verseCount: 40),
    SuraModel(
        suraNumber: 76,
        tamilName: 'அத்தஹ்ரு',
        tamilMeaning: 'காலம்',
        arabicName: 'الانسان',
        verseCount: 31),
    SuraModel(
        suraNumber: 77,
        tamilName: 'அல்முர்ஸலாத்',
        tamilMeaning: 'அனுப்பப்படுபவை',
        arabicName: 'المرسلات',
        verseCount: 50),
    SuraModel(
        suraNumber: 78,
        tamilName: 'அந்நபவு',
        tamilMeaning: 'பெரும் செய்தி',
        arabicName: 'النبإ',
        verseCount: 40),
    SuraModel(
        suraNumber: 79,
        tamilName: 'அந்நாஜிஆத்',
        tamilMeaning: 'பறிப்பவர்கள்',
        arabicName: 'النازعات',
        verseCount: 46),
    SuraModel(
        suraNumber: 80,
        tamilName: 'அபஸ',
        tamilMeaning: 'கடு கடுத்தார்',
        arabicName: 'عبس',
        verseCount: 42),
    SuraModel(
        suraNumber: 81,
        tamilName: 'அத்தக்வீர்',
        tamilMeaning: 'சுருட்டுதல்',
        arabicName: 'التكوير',
        verseCount: 29),
    SuraModel(
        suraNumber: 82,
        tamilName: 'அல் இன்ஃபிதார்',
        tamilMeaning: 'வெடித்துப் போதல்',
        arabicName: 'الإنفطار',
        verseCount: 19),
    SuraModel(
        suraNumber: 83,
        tamilName: 'அல் முதஃப்ஃபிஃபீன்',
        tamilMeaning: 'அளவு நிறுவையில் மோசம் செய்தல்',
        arabicName: 'المطففين',
        verseCount: 36),
    SuraModel(
        suraNumber: 84,
        tamilName: 'அல் இன்ஷிகாக்',
        tamilMeaning: 'பிளந்து போதல்',
        arabicName: 'الإنشقاق',
        verseCount: 25),
    SuraModel(
        suraNumber: 85,
        tamilName: 'அல் புரூஜ்',
        tamilMeaning: 'கிரகங்கள்',
        arabicName: 'البروج',
        verseCount: 22),
    SuraModel(
        suraNumber: 86,
        tamilName: 'அத்தாரிக்',
        tamilMeaning: 'விடிவெள்ளி',
        arabicName: 'الطارق',
        verseCount: 17),
    SuraModel(
        suraNumber: 87,
        tamilName: 'அல் அஃலா',
        tamilMeaning: 'மிக்க மேலானவன்',
        arabicName: 'الأعلى',
        verseCount: 19),
    SuraModel(
        suraNumber: 88,
        tamilName: 'அல் காஷியா',
        tamilMeaning: 'மூடிக் கொள்ளுதல்',
        arabicName: 'الغاشية',
        verseCount: 26),
    SuraModel(
        suraNumber: 89,
        tamilName: 'அல் ஃபஜ்ர்',
        tamilMeaning: 'விடியற்காலை',
        arabicName: 'الفجر',
        verseCount: 30),
    SuraModel(
        suraNumber: 90,
        tamilName: 'அல் பலத்',
        tamilMeaning: 'நகரம்',
        arabicName: 'البلد',
        verseCount: 20),
    SuraModel(
        suraNumber: 91,
        tamilName: 'அஷ்ஷம்ஸ்',
        tamilMeaning: 'சூரியன்',
        arabicName: 'الشمس',
        verseCount: 15),
    SuraModel(
        suraNumber: 92,
        tamilName: 'அல் லைல்',
        tamilMeaning: 'இரவு',
        arabicName: 'الليل',
        verseCount: 21),
    SuraModel(
        suraNumber: 93,
        tamilName: 'அள்ளுஹா',
        tamilMeaning: 'முற்பகல்',
        arabicName: 'الضحى',
        verseCount: 11),
    SuraModel(
        suraNumber: 94,
        tamilName: 'அலம் நஷ்ரஹ்',
        tamilMeaning: 'விரிவாக்கல்',
        arabicName: 'الشرح',
        verseCount: 8),
    SuraModel(
        suraNumber: 95,
        tamilName: 'அத்தீன்',
        tamilMeaning: 'அத்தி',
        arabicName: 'التين',
        verseCount: 8),
    SuraModel(
        suraNumber: 96,
        tamilName: 'அல் அலக்',
        tamilMeaning: 'இரத்தக்கட்டி',
        arabicName: 'العلق',
        verseCount: 19),
    SuraModel(
        suraNumber: 97,
        tamilName: 'அல் கத்ரி',
        tamilMeaning: 'கண்ணியமிக்க இரவு',
        arabicName: 'القدر',
        verseCount: 5),
    SuraModel(
        suraNumber: 98,
        tamilName: 'அல் பய்யினா',
        tamilMeaning: 'தெளிவான ஆதாரம்',
        arabicName: 'البينة',
        verseCount: 8),
    SuraModel(
        suraNumber: 99,
        tamilName: 'அல் ஜில்ஜால்',
        tamilMeaning: 'அதிர்ச்சி',
        arabicName: 'الزلزلة',
        verseCount: 8),
    SuraModel(
        suraNumber: 100,
        tamilName: 'அல் ஆதியாத்',
        tamilMeaning: 'வேகமாகச் செல்லுபவை',
        arabicName: 'العاديات',
        verseCount: 11),
    SuraModel(
        suraNumber: 101,
        tamilName: 'அல்காரிஆ',
        tamilMeaning: 'திடுக்கிடச் செய்யும் நிகழ்ச்சி',
        arabicName: 'القارعة',
        verseCount: 11),
    SuraModel(
        suraNumber: 102,
        tamilName: 'அத்தகாஸுர்',
        tamilMeaning: 'பேராசை',
        arabicName: 'التكاثر',
        verseCount: 8),
    SuraModel(
        suraNumber: 103,
        tamilName: 'அல் அஸ்ர்',
        tamilMeaning: 'காலம்',
        arabicName: 'العصر',
        verseCount: 3),
    SuraModel(
        suraNumber: 104,
        tamilName: 'அல் ஹுமஜா',
        tamilMeaning: 'புறங்கூறல்',
        arabicName: 'الهمزة',
        verseCount: 9),
    SuraModel(
        suraNumber: 105,
        tamilName: 'அல் ஃபீல்',
        tamilMeaning: 'யானை',
        arabicName: 'الفيل',
        verseCount: 5),
    SuraModel(
        suraNumber: 106,
        tamilName: 'குறைஷின்',
        tamilMeaning: 'குறைஷிகள்',
        arabicName: 'قريش',
        verseCount: 4),
    SuraModel(
        suraNumber: 107,
        tamilName: 'அல் மாஊன்',
        tamilMeaning: 'அற்பப் பொருட்கள்',
        arabicName: 'الماعون',
        verseCount: 7),
    SuraModel(
        suraNumber: 108,
        tamilName: 'அல் கவ்ஸர்',
        tamilMeaning: 'மிகுந்த நன்மைகள்',
        arabicName: 'الكوثر',
        verseCount: 3),
    SuraModel(
        suraNumber: 109,
        tamilName: 'அல் காஃபிரூன்',
        tamilMeaning: 'காஃபிர்கள்',
        arabicName: 'الكافرون',
        verseCount: 6),
    SuraModel(
        suraNumber: 110,
        tamilName: 'அந்நஸ்ர்',
        tamilMeaning: 'உதவி',
        arabicName: 'النصر',
        verseCount: 3),
    SuraModel(
        suraNumber: 111,
        tamilName: 'தப்பத்',
        tamilMeaning: 'அழிந்துவிட்டது',
        arabicName: 'المسد',
        verseCount: 5),
    SuraModel(
        suraNumber: 112,
        tamilName: 'அல் இக்லாஸ்',
        tamilMeaning: 'ஏகத்துவம்',
        arabicName: 'الإخلاص',
        verseCount: 4),
    SuraModel(
        suraNumber: 113,
        tamilName: 'அல் ஃபலக்',
        tamilMeaning: 'அதிகாலை',
        arabicName: 'الفلق',
        verseCount: 5),
    SuraModel(
        suraNumber: 114,
        tamilName: 'அந்நாஸ்',
        tamilMeaning: 'மனிதர்கள்',
        arabicName: 'الناس',
        verseCount: 6)
  ];

  List<SuraModel> get suraList => _suraList;
}
