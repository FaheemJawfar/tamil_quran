class SuraList {
  final int suraNumber;
  final String tamilName;
  final String arabicName;
  final int verseCount;

  SuraList({
    required this.suraNumber,
    required this.tamilName,
    required this.arabicName,
    required this.verseCount,
  });
}

class QuranData {
  static List<SuraList> suras = [
    SuraList(
        suraNumber: 1,
        tamilName: 'அல்ஃபாத்திஹா (தோற்றுவாய்)',
        arabicName: 'الفاتحة',
        verseCount: 7),
    SuraList(
        suraNumber: 2,
        tamilName: 'அல்பகரா (பசு மாடு)',
        arabicName: 'البقرة',
        verseCount: 286),
    SuraList(
        suraNumber: 3,
        tamilName: 'ஆலஇம்ரான் (இம்ரானின் சந்ததிகள்)',
        arabicName: 'آل عمران',
        verseCount: 200),
    SuraList(
        suraNumber: 4,
        tamilName: 'அன்னிஸாவு (பெண்கள்)',
        arabicName: 'النساء',
        verseCount: 176),
    SuraList(
        suraNumber: 5,
        tamilName: 'அல்மாயிதா (ஆகாரம்) (உணவு மரவை)',
        arabicName: 'المائدة',
        verseCount: 120),
    SuraList(
        suraNumber: 6,
        tamilName: 'அல் அன்ஆம் (ஆடு, மாடு, ஒட்டகம்)',
        arabicName: 'الأنعام',
        verseCount: 165),
    SuraList(
        suraNumber: 7,
        tamilName: 'அல் அஃராஃப் (சிகரங்கள்)',
        arabicName: 'الأعراف',
        verseCount: 206),
    SuraList(
        suraNumber: 8,
        tamilName: 'அல்அன்ஃபால் (போரில் கிடைத்த வெற்றிப்பொருள்கள்)',
        arabicName: 'الأنفال',
        verseCount: 75),
    SuraList(
        suraNumber: 9,
        tamilName: 'அத்தவ்பா (மனவருந்தி மன்னிப்பு தேடுதல்)',
        arabicName: 'التوبة',
        verseCount: 129),
    SuraList(
        suraNumber: 10,
        tamilName: 'யூனுஸ் (நபி)',
        arabicName: 'يونس',
        verseCount: 109),
    SuraList(
        suraNumber: 11, tamilName: 'ஹூது', arabicName: 'هود', verseCount: 123),
    SuraList(
        suraNumber: 12,
        tamilName: 'யூஸுஃப் ',
        arabicName: 'يوسف',
        verseCount: 111),
    SuraList(
        suraNumber: 13,
        tamilName: 'அர்ரஃது (இடி)',
        arabicName: 'الرعد',
        verseCount: 43),
    SuraList(
        suraNumber: 14,
        tamilName: 'இப்ராஹீம்',
        arabicName: 'ابراهيم',
        verseCount: 52),
    SuraList(
        suraNumber: 15,
        tamilName: 'அல்ஹிஜ்ர் (மலைப்பாறை) ',
        arabicName: 'الحجر',
        verseCount: 99),
    SuraList(
        suraNumber: 16,
        tamilName: 'அந்நஹ்ல் (தேனி)',
        arabicName: 'النحل',
        verseCount: 128),
    SuraList(
        suraNumber: 17,
        tamilName: 'பனீ இஸ்ராயீல் (இஸ்ராயீலின் சந்ததிகள்)',
        arabicName: 'الإسراء',
        verseCount: 111),
    SuraList(
        suraNumber: 18,
        tamilName: 'அல்கஹ்ஃபு (குகை) ',
        arabicName: 'الكهف',
        verseCount: 110),
    SuraList(
        suraNumber: 19,
        tamilName: 'மர்யம்',
        arabicName: 'مريم',
        verseCount: 98),
    SuraList(
        suraNumber: 20, tamilName: 'தாஹா', arabicName: 'طه', verseCount: 135),
    SuraList(
        suraNumber: 21,
        tamilName: 'அல்அன்பியா (நபிமார்கள்) ',
        arabicName: 'الأنبياء',
        verseCount: 112),
    SuraList(
        suraNumber: 22,
        tamilName: 'அல்ஹஜ்',
        arabicName: 'الحج',
        verseCount: 78),
    SuraList(
        suraNumber: 23,
        tamilName: 'அல் முஃமினூன் (விசுவாசிகள்)',
        arabicName: 'المؤمنون',
        verseCount: 118),
    SuraList(
        suraNumber: 24,
        tamilName: 'அந்நூர் (பேரொளி)',
        arabicName: 'النور',
        verseCount: 64),
    SuraList(
        suraNumber: 25,
        tamilName: 'அல்ஃபுர்ஃகான் (பிரித்தறிவித்தல்)',
        arabicName: 'الفرقان',
        verseCount: 77),
    SuraList(
        suraNumber: 26,
        tamilName: 'அஷ்ஷுஃரா (கவிஞர்கள்)',
        arabicName: 'الشعراء',
        verseCount: 227),
    SuraList(
        suraNumber: 27,
        tamilName: 'அந்நம்லு (எறும்புகள்)',
        arabicName: 'النمل',
        verseCount: 93),
    SuraList(
        suraNumber: 28,
        tamilName: 'அல் கஸஸ் (வரலாறுகள்)',
        arabicName: 'القصص',
        verseCount: 88),
    SuraList(
        suraNumber: 29,
        tamilName: 'அல் அன்கபூத் (சிலந்திப் பூச்சி)',
        arabicName: 'العنكبوت',
        verseCount: 69),
    SuraList(
        suraNumber: 30,
        tamilName: 'அர்ரூம் (ரோமானியப் பேரரசு)',
        arabicName: 'الروم',
        verseCount: 60),
    SuraList(
        suraNumber: 31,
        tamilName: 'லுக்மான்',
        arabicName: 'لقمان',
        verseCount: 34),
    SuraList(
        suraNumber: 32,
        tamilName: 'அஸ்ஸஜ்தா (சிரம் பணிதல்)',
        arabicName: 'السجدة',
        verseCount: 30),
    SuraList(
        suraNumber: 33,
        tamilName: 'அல் அஹ்ஜாப் (சதிகார அணியினர்)',
        arabicName: 'الأحزاب',
        verseCount: 73),
    SuraList(
        suraNumber: 34, tamilName: 'ஸபா', arabicName: 'سبإ', verseCount: 54),
    SuraList(
        suraNumber: 35,
        tamilName: 'ஃபாதிர் (படைப்பவன்)',
        arabicName: 'فاطر',
        verseCount: 45),
    SuraList(
        suraNumber: 36, tamilName: 'யாஸீன்', arabicName: 'يس', verseCount: 83),
    SuraList(
        suraNumber: 37,
        tamilName: 'அஸ்ஸாஃப்ஃபாத் (அணிவகுப்புகள்)',
        arabicName: 'الصافات',
        verseCount: 182),
    SuraList(
        suraNumber: 38, tamilName: 'ஸாத்', arabicName: 'ص', verseCount: 88),
    SuraList(
        suraNumber: 39,
        tamilName: 'அல் ஜுமர் (கூட்டங்கள்)',
        arabicName: 'الزمر',
        verseCount: 75),
    SuraList(
        suraNumber: 40,
        tamilName: 'அல் முஃமின் (ஈமான் கொண்டவர்)',
        arabicName: 'غافر',
        verseCount: 85),
    SuraList(
        suraNumber: 41,
        tamilName: 'ஹாமீம் ஸஜ்தா',
        arabicName: 'فصلت',
        verseCount: 54),
    SuraList(
        suraNumber: 42,
        tamilName: 'அஷ்ஷூறா (கலந்தாலோசித்தல்)',
        arabicName: 'الشورى',
        verseCount: 53),
    SuraList(
        suraNumber: 43,
        tamilName: 'அல் ஜுக்ருஃப் (பொன் அலங்காரம்)',
        arabicName: 'الزخرف',
        verseCount: 89),
    SuraList(
        suraNumber: 44,
        tamilName: 'அத் துகான் (புகை)',
        arabicName: 'الدخان',
        verseCount: 59),
    SuraList(
        suraNumber: 45,
        tamilName: 'அல் ஜாஸியா (முழந்தாளிடுதல்)',
        arabicName: 'الجاثية',
        verseCount: 37),
    SuraList(
        suraNumber: 46,
        tamilName: 'அல் அஹ்காஃப் (மணல் திட்டுகள்)',
        arabicName: 'الأحقاف',
        verseCount: 35),
    SuraList(
        suraNumber: 47,
        tamilName: 'முஹம்மது (ஸல்)',
        arabicName: 'محمد',
        verseCount: 38),
    SuraList(
        suraNumber: 48,
        tamilName: 'அல்ஃபத்ஹ் (வெற்றி)',
        arabicName: 'الفتح',
        verseCount: 29),
    SuraList(
        suraNumber: 49,
        tamilName: 'அல் ஹுஜுராத் (அறைகள்)',
        arabicName: 'الحجرات',
        verseCount: 18),
    SuraList(
        suraNumber: 50, tamilName: 'ஃகாஃப்', arabicName: 'ق', verseCount: 45),
    SuraList(
        suraNumber: 51,
        tamilName: 'அத்தாரியாத் (புழுதியைக் கிளப்பும் காற்றுகள்)',
        arabicName: 'الذاريات',
        verseCount: 60),
    SuraList(
        suraNumber: 52,
        tamilName: 'அத் தூர் (மலை)',
        arabicName: 'الطور',
        verseCount: 49),
    SuraList(
        suraNumber: 53,
        tamilName: 'அந்நஜ்ம் (நட்சத்திரம்)',
        arabicName: 'النجم',
        verseCount: 62),
    SuraList(
        suraNumber: 54,
        tamilName: 'அல் கமர் (சந்திரன்)',
        arabicName: 'القمر',
        verseCount: 55),
    SuraList(
        suraNumber: 55,
        tamilName: 'அர்ரஹ்மான் (அளவற்ற அருளாளன்)',
        arabicName: 'الرحمن',
        verseCount: 78),
    SuraList(
        suraNumber: 56,
        tamilName: 'அல்வாகிஆ (மாபெரும் நிகழ்ச்சி)',
        arabicName: 'الواقعة',
        verseCount: 96),
    SuraList(
        suraNumber: 57,
        tamilName: 'அல் ஹதீத் (இரும்பு)',
        arabicName: 'الحديد',
        verseCount: 29),
    SuraList(
        suraNumber: 58,
        tamilName: 'அல் முஜாதலா (தர்க்கித்தல்)',
        arabicName: 'المجادلة',
        verseCount: 22),
    SuraList(
        suraNumber: 59,
        tamilName: 'அல் ஹஷ்ர் (ஒன்று கூட்டுதல்)',
        arabicName: 'الحشر',
        verseCount: 24),
    SuraList(
        suraNumber: 60,
        tamilName: 'அல் மும்தஹினா (பரிசோதித்தல்)',
        arabicName: 'الممتحنة',
        verseCount: 13),
    SuraList(
        suraNumber: 61,
        tamilName: 'அஸ்ஸஃப்ஃபு (அணிவகுப்பு)',
        arabicName: 'الصف',
        verseCount: 14),
    SuraList(
        suraNumber: 62,
        tamilName: 'அல் ஜுமுஆ (வெள்ளிக் கிழமை)',
        arabicName: 'الجمعة',
        verseCount: 11),
    SuraList(
        suraNumber: 63,
        tamilName: 'அல் முனாஃபிஃகூன் (நயவஞ்சகர்கள்)',
        arabicName: 'المنافقون',
        verseCount: 11),
    SuraList(
        suraNumber: 64,
        tamilName: 'அல் தகாபுன் (நஷ்டம்)',
        arabicName: 'التغابن',
        verseCount: 18),
    SuraList(
        suraNumber: 65,
        tamilName: 'அத்தலாக் (விவாகரத்து)',
        arabicName: 'الطلاق',
        verseCount: 12),
    SuraList(
        suraNumber: 66,
        tamilName: 'அத்தஹ்ரீம் (விலக்குதல்)',
        arabicName: 'التحريم',
        verseCount: 12),
    SuraList(
        suraNumber: 67,
        tamilName: 'அல் முல்க் (ஆட்சி)',
        arabicName: 'الملك',
        verseCount: 30),
    SuraList(
        suraNumber: 68,
        tamilName: 'அல் கலம் (எழுதுகோல்)',
        arabicName: 'القلم',
        verseCount: 52),
    SuraList(
        suraNumber: 69,
        tamilName: 'அல் ஹாக்கா (நிச்சயமானது)',
        arabicName: 'الحاقة',
        verseCount: 52),
    SuraList(
        suraNumber: 70,
        tamilName: 'அல் மஆரிஜ் (உயர்வழிகள்)',
        arabicName: 'المعارج',
        verseCount: 44),
    SuraList(
        suraNumber: 71, tamilName: 'நூஹ்', arabicName: 'نوح', verseCount: 28),
    SuraList(
        suraNumber: 72,
        tamilName: 'அல் ஜின் (ஜின்கள்)',
        arabicName: 'الجن',
        verseCount: 28),
    SuraList(
        suraNumber: 73,
        tamilName: 'அல் முஸ்ஸம்மில் (போர்வை போர்த்தியவர்)',
        arabicName: 'المزمل',
        verseCount: 20),
    SuraList(
        suraNumber: 74,
        tamilName: 'அல் முத்தஸ்ஸிர் (போர்த்திக்கொண்டிருப்பவர்)',
        arabicName: 'المدثر',
        verseCount: 56),
    SuraList(
        suraNumber: 75,
        tamilName: 'அல்கியாமா (மறுமை நாள்)',
        arabicName: 'القيامة',
        verseCount: 40),
    SuraList(
        suraNumber: 76,
        tamilName: 'அத்தஹ்ரு (காலம்)',
        arabicName: 'الانسان',
        verseCount: 31),
    SuraList(
        suraNumber: 77,
        tamilName: 'அல்முர்ஸலாத் (அனுப்பப்படுபவை)',
        arabicName: 'المرسلات',
        verseCount: 50),
    SuraList(
        suraNumber: 78,
        tamilName: 'அந்நபவு (பெரும் செய்தி)',
        arabicName: 'النبإ',
        verseCount: 40),
    SuraList(
        suraNumber: 79,
        tamilName: 'அந்நாஜிஆத் (பறிப்பவர்கள்)',
        arabicName: 'النازعات',
        verseCount: 46),
    SuraList(
        suraNumber: 80,
        tamilName: 'அபஸ (கடு கடுத்தார்)',
        arabicName: 'عبس',
        verseCount: 42),
    SuraList(
        suraNumber: 81,
        tamilName: 'அத்தக்வீர் (சுருட்டுதல்)',
        arabicName: 'التكوير',
        verseCount: 29),
    SuraList(
        suraNumber: 82,
        tamilName: 'அல் இன்ஃபிதார்(வெடித்துப் போதல்)',
        arabicName: 'الإنفطار',
        verseCount: 19),
    SuraList(
        suraNumber: 83,
        tamilName: 'அல் முதஃப்ஃபிஃபீன் (அளவு நிறுவையில் மோசம் செய்தல்) ',
        arabicName: 'المطففين',
        verseCount: 36),
    SuraList(
        suraNumber: 84,
        tamilName: 'அல் இன்ஷிகாக் (பிளந்து போதல்)',
        arabicName: 'الإنشقاق',
        verseCount: 25),
    SuraList(
        suraNumber: 85,
        tamilName: 'அல் புரூஜ்(கிரகங்கள்)',
        arabicName: 'البروج',
        verseCount: 22),
    SuraList(
        suraNumber: 86,
        tamilName: 'அத்தாரிக் (விடிவெள்ளி)',
        arabicName: 'الطارق',
        verseCount: 17),
    SuraList(
        suraNumber: 87,
        tamilName: 'அல் அஃலா (மிக்க மேலானவன்)',
        arabicName: 'الأعلى',
        verseCount: 19),
    SuraList(
        suraNumber: 88,
        tamilName: 'அல் காஷியா (மூடிக் கொள்ளுதல்)',
        arabicName: 'الغاشية',
        verseCount: 26),
    SuraList(
        suraNumber: 89,
        tamilName: 'அல் ஃபஜ்ர் (விடியற்காலை)',
        arabicName: 'الفجر',
        verseCount: 30),
    SuraList(
        suraNumber: 90,
        tamilName: 'அல் பலத் (நகரம்)',
        arabicName: 'البلد',
        verseCount: 20),
    SuraList(
        suraNumber: 91,
        tamilName: 'அஷ்ஷம்ஸ் (சூரியன்)',
        arabicName: 'الشمس',
        verseCount: 15),
    SuraList(
        suraNumber: 92,
        tamilName: 'அல் லைல் (இரவு)',
        arabicName: 'الليل',
        verseCount: 21),
    SuraList(
        suraNumber: 93,
        tamilName: 'அள்ளுஹா (முற்பகல்)',
        arabicName: 'الضحى',
        verseCount: 11),
    SuraList(
        suraNumber: 94,
        tamilName: 'அலம் நஷ்ரஹ் (விரிவாக்கல்)',
        arabicName: 'الشرح',
        verseCount: 8),
    SuraList(
        suraNumber: 95,
        tamilName: 'அத்தீன் (அத்தி)',
        arabicName: 'التين',
        verseCount: 8),
    SuraList(
        suraNumber: 96,
        tamilName: 'அல் அலக் (இரத்தக்கட்டி)',
        arabicName: 'العلق',
        verseCount: 19),
    SuraList(
        suraNumber: 97,
        tamilName: 'அல் கத்ரி (கண்ணியமிக்க இரவு)',
        arabicName: 'القدر',
        verseCount: 5),
    SuraList(
        suraNumber: 98,
        tamilName: 'அல் பய்யினா (தெளிவான ஆதாரம்)',
        arabicName: 'البينة',
        verseCount: 8),
    SuraList(
        suraNumber: 99,
        tamilName: 'அல் ஜில்ஜால் (அதிர்ச்சி)',
        arabicName: 'الزلزلة',
        verseCount: 8),
    SuraList(
        suraNumber: 100,
        tamilName: 'அல் ஆதியாத் (வேகமாகச் செல்லுபவை)',
        arabicName: 'العاديات',
        verseCount: 11),
    SuraList(
        suraNumber: 101,
        tamilName: 'அல்காரிஆ (திடுக்கிடச் செய்யும் நிகழ்ச்சி)',
        arabicName: 'القارعة',
        verseCount: 11),
    SuraList(
        suraNumber: 102,
        tamilName: 'அத்தகாஸுர் (பேராசை)',
        arabicName: 'التكاثر',
        verseCount: 8),
    SuraList(
        suraNumber: 103,
        tamilName: 'அல் அஸ்ர் (காலம்)',
        arabicName: 'العصر',
        verseCount: 3),
    SuraList(
        suraNumber: 104,
        tamilName: 'அல் ஹுமஜா (புறங்கூறல்)',
        arabicName: 'الهمزة',
        verseCount: 9),
    SuraList(
        suraNumber: 105,
        tamilName: 'அல் ஃபீல் (யானை)',
        arabicName: 'الفيل',
        verseCount: 5),
    SuraList(
        suraNumber: 106,
        tamilName: 'குறைஷின் (குறைஷிகள்)',
        arabicName: 'قريش',
        verseCount: 4),
    SuraList(
        suraNumber: 107,
        tamilName: 'அல் மாஊன் (அற்பப் பொருட்கள்)',
        arabicName: 'الماعون',
        verseCount: 7),
    SuraList(
        suraNumber: 108,
        tamilName: 'அல் கவ்ஸர் (மிகுந்த நன்மைகள்)',
        arabicName: 'الكوثر',
        verseCount: 3),
    SuraList(
        suraNumber: 109,
        tamilName: 'அல் காஃபிரூன் (காஃபிர்கள்)',
        arabicName: 'الكافرون',
        verseCount: 6),
    SuraList(
        suraNumber: 110,
        tamilName: 'அந்நஸ்ர் (உதவி)',
        arabicName: 'النصر',
        verseCount: 3),
    SuraList(
        suraNumber: 111,
        tamilName: 'தப்பத் (அழிந்துவிட்டது)',
        arabicName: 'المسد',
        verseCount: 5),
    SuraList(
        suraNumber: 112,
        tamilName: 'அல் இக்லாஸ் (ஏகத்துவம்)',
        arabicName: 'الإخلاص',
        verseCount: 4),
    SuraList(
        suraNumber: 113,
        tamilName: 'அல் ஃபலக் (அதிகாலை)',
        arabicName: 'الفلق',
        verseCount: 5),
    SuraList(
        suraNumber: 114,
        tamilName: 'அந்நாஸ் (மனிதர்கள்)',
        arabicName: 'الناس',
        verseCount: 6)
  ];
}
