class SuraDetails {
  final int suraNumber;
  final String tamilName;
  final String? tamilMeaning;
  final String arabicName;
  final int verseCount;
  final String? reasonForName;

  SuraDetails({
    required this.suraNumber,
    required this.tamilName,
    this.tamilMeaning,
    required this.arabicName,
    required this.verseCount,
    this.reasonForName,
  });

  static List<SuraDetails> suraListAll = [
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
        suraNumber: 20, tamilName: 'தாஹா', arabicName: 'طه', verseCount: 135),
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
        suraNumber: 34, tamilName: 'ஸபா', arabicName: 'سبإ', verseCount: 54),
    SuraDetails(
        suraNumber: 35,
        tamilName: 'ஃபாதிர்',
        tamilMeaning: 'படைப்பவன்',
        arabicName: 'فاطر',
        verseCount: 45),
    SuraDetails(
        suraNumber: 36, tamilName: 'யாஸீன்', arabicName: 'يس', verseCount: 83),
    SuraDetails(
        suraNumber: 37,
        tamilName: 'அஸ்ஸாஃப்ஃபாத்',
        tamilMeaning: 'அணிவகுப்புகள்',
        arabicName: 'الصافات',
        verseCount: 182),
    SuraDetails(
        suraNumber: 38, tamilName: 'ஸாத்', arabicName: 'ص', verseCount: 88),
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
        suraNumber: 50, tamilName: 'ஃகாஃப்', arabicName: 'ق', verseCount: 45),
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
        suraNumber: 71, tamilName: 'நூஹ்', arabicName: 'نوح', verseCount: 28),
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

  static List<SuraDetails> suraListPj = [

    SuraDetails(
  suraNumber: 1,
  tamilName: 'அல் ஃபாத்திஹா',
  tamilMeaning: 'தோற்றுவாய்',
  arabicName: 'سُوۡرَةُ الفَاتِحَة',
  verseCount: 7,
  reasonForName: 'அல்ஃபாத்திஹா என்ற அரபுச் சொல்லுக்கு தோற்றுவாய், முதன்மையானது எனப் பொருள். திருக்குர்ஆனின் முதல் அத்தியாயமாக இது அமைந்துள்ளதால் இந்தப் பெயர் வந்தது. திருக்குர்ஆனிலேயே இந்த அத்தியாயம் குறித்துச் சிறப்பித்துக் கூறப்பட்டிருக்கிறது. பார்க்க 15:87',
  ),

  SuraDetails(
  suraNumber: 2,
  tamilName: 'அல் பகரா',
  tamilMeaning: 'அந்த மாடு',
  arabicName: 'سُوۡرَةُ البَقَرَة',
  verseCount: 286,
  reasonForName: 'திருக்குர்ஆனில் மிகப் பெரிய அத்தியாயம் இது. இந்த அத்தியாயத்தில் 67வது வசனம் முதல் 71வது வசனம் வரை மாட்டுடன் தொடர்புடைய அதிசய நிகழ்ச்சி ஒன்று கூறப்பட்டுள்ளது. இந்த நிகழ்ச்சி இடம் பெற்றதன் காரணமாக \'அந்த மாடு\' என்ற பெயர் இந்த அத்தியாயத்துக்கு வந்தது. காளை, பசு இரண்டையும் இச்சொல் குறித்தாலும், பெயர் வரக் காரணமான 67 முதல் 71 வரை உள்ள வசனங்களைக் கவனித்தால் காளையையே குறிக்கிறது என அறியலாம்.',
  ),

    SuraDetails(
        suraNumber: 3,
        tamilName: 'ஆலு இம்ரான்',
        tamilMeaning: 'இம்ரானின் குடும்பத்தினர்',
        arabicName: 'سُوۡرَةُ آل عِمرَان',
        verseCount: 200,
        reasonForName: 'இம்ரான் என்பவர், ஈஸா நபி (இயேசு) அவர்களின் தாய்வழிப் பாட்டனாரும் மர்யம் (மேரி) அவர்களின் தந்தையும் ஆவார். இம்ரானின் குடும்பத்தினர் என்பது மர்யமையும், அவரது தாயாரையும், ஈஸா நபியையும் குறிக்கும். இந்த அத்தியாயத்தில் 35, 36, 37 ஆகிய வசனங்களில் இம்ரானின் குடும்பத்தார் பற்றிய முக்கிய நிகழ்ச்சி கூறப்படுகின்றது. எனவே இந்த அத்தியாயம் இம்ரானின் குடும்பத்தினர் எனப் பெயர் பெற்றது.'
    ),
    SuraDetails(
        suraNumber: 4,
        tamilName: 'அன்னிஸா',
        tamilMeaning: 'பெண்கள்',
        arabicName: 'سُوۡرَةُ النِّسَاء',
        verseCount: 176,
        reasonForName: 'பெண்களின் சொத்துரிமை, குடும்ப வாழ்க்கை, விவாகரத்து, போன்ற பல சட்டங்கள் இந்த அத்தியாயத்தில் கூறப்பட்டுள்ளதால் இது \'பெண்கள்\' எனும் பெயர் பெற்றது.'
    ),
    SuraDetails(
        suraNumber: 5,
        tamilName: 'அல் மாயிதா',
        tamilMeaning: 'உணவுத் தட்டு',
        arabicName: 'سُوۡرَةُ المَائدة',
        verseCount: 120,
        reasonForName: 'ஈஸா நபி அவர்களின் சமுதாயத்தினர் வானத்திலிருந்து உணவுடன் உணவுத் தட்டை இறைவன் இறக்கித் தர வேண்டும் என்று கோரிக்கை வைத்தனர். ஈஸா நபி அவர்கள் பிரார்த்தனை செய்ததன் அடிப்படையில் அவ்வாறே உணவுத் தட்டு இறக்கப்பட்டதாக 112, 113, 114 ஆகிய வசனங்களில் கூறப்படும் நிகழ்ச்சியை ஒட்டி இந்த அத்தியாயத்திற்கு இப்பெயர் வந்தது.'
    ),
    SuraDetails(
        suraNumber: 6,
        tamilName: 'அல் அன்ஆம்',
        tamilMeaning: 'கால்நடைகள்',
        arabicName: 'سُوۡرَةُ الاٴنعَام',
        verseCount: 165,
        reasonForName: 'கால்நடைகள் குறித்து அன்றைய அரபுகளிடம் பலவிதமான மூட நம்பிக்கைகள் இருந்தன. அவை இந்த அத்தியாயத்தின் 136, 138, 139, 143, 144 ஆகிய வசனங்களில் கண்டிக்கப்படுகிறது. எனவே இந்த அத்தியாயத்திற்கு இவ்வாறு பெயர் வந்தது.'
    ),
    SuraDetails(
        suraNumber: 7,
        tamilName: 'அல் அஃராப்',
        tamilMeaning: 'தடுப்புச் சுவர்',
        arabicName: 'سُوۡرَةُ الاٴعرَاف',
        verseCount: 206,
        reasonForName: 'சொர்க்கத்துக்கும், நரகத்துக்கும் இடையே அகலமான தடுப்புச் சுவர் ஒன்று இருக்கும். சொர்க்கத்திற்கும் நரகத்திற்கும் அனுப்பப்படாத சிலர் அதில் தங்க வைக்கப்படுவார்கள். அந்தத் தடுப்புச் சுவர் தான் அஃராப் எனப்படுகிறது. இது பற்றி இந்த அத்தியாயத்தின் 46, 47, 48, 49 ஆகிய வசனங்கள் கூறுவதால் இந்த அத்தியாயம் அஃராப் என்று பெயர் பெற்றது.'
    ),
    SuraDetails(
        suraNumber: 8,
        tamilName: 'அல் அன்ஃபால்',
        tamilMeaning: 'போர்க்களத்தில் எதிரிகளிடம் கைப்பற்றப்படும் பொருட்கள்',
        arabicName: 'سُوۡرَةُ الاٴنفَال',
        verseCount: 75,
        reasonForName: 'எதிரிகளிடம் போரில் கைப்பற்றப்படுபவை அன்ஃபால் எனப்படுகிறது. இந்த அத்தியாயத்தின் முதல் வசனத்தில் அன்ஃபால் என்ற சொல் இடம் பெற்றுள்ளதால் இந்த அத்தியாயத்திற்கு இப்பெயர் வந்தது.'
    ),
    SuraDetails(
        suraNumber: 9,
        tamilName: 'அத்தவ்பா',
        tamilMeaning: 'மன்னிப்பு',
        arabicName: 'سُوۡرَةُ التّوبَة',
        verseCount: 129,
        reasonForName: '117, 118 ஆகிய இரு வசனங்களில் நபிகள் நாயகம் (ஸல்) அவர்களையும், ஹிஜ்ரத் செய்து வந்தவர்களையும், அடைக்கலம் தந்து உதவியவர்களையும், குறிப்பாக தபூக் யுத்தத்தில் பங்கெடுக்காத மூன்று நபித்தோழர்களையும் அல்லாஹ் மன்னித்ததாகக் கூறுகிறான். ஒட்டு மொத்த சமுதாயத்திற்கே பாவமன்னிப்பு வழங்கியது பற்றி இந்த அத்தியாயம் பேசுவதால் இந்த அத்தியாயத்திற்கு \'அத்தவ்பா\' எனப் பெயரிடப்பட்டிருக்கிறது. ஒவ்வொரு அத்தியாயத்தின் துவக்கத்திலும் "அளவற்ற அருளாளனும் நிகரற்ற அன்புடையோனுமாகிய அல்லாஹ்வின் பெயரால்'' என்ற பொருள்படும் "பிஸ்மில்லாஹிர் ரஹ்மானிர் ரஹீம்'' என்ற சொற்றொடர் அமைக்கப்பட்டிருக்கும். ஆனால் இந்த அத்தியாயத்தின் துவக்கத்தில் அந்தச் சொற்றொடர் அமைக்கப்படவில்லை. இதற்குப் பலரும் பலவிதமான காரணங்களையும், தத்துவங்களையும் கூறுகின்றனர். இந்த அத்தியாயத்தில் அல்லாஹ் கடும் கோபத்தை வெளிப்படுத்தும் வசனங்களைக் கூறியுள்ளான். எனவே அளவற்ற அருளாளன்; நிகரற்ற அன்புடையோன் என்று அல்லாஹ்வைப் புகழும் "பிஸ்மில்லாஹிர் ரஹ்மானிர் ரஹீம்'' என்பது எழுதப்படவில்லை என்று சிலர் கூறுகின்றனர். இந்தக் காரணம் உண்மைக்கு மாற்றமாக உள்ளது. அல்லாஹ்வின் கோபத்தை வெளிப்படுத்தும் வசனங்கள் இந்த அத்தியாயத்தில் மட்டுமின்றி இன்னும் பல அத்தியாயங்களிலும் உள்ளன. அந்த அத்தியாயங்கள் அனைத்திலும் "பிஸ்மில்லாஹிர் ரஹ்மானிர் ரஹீம்'' என்பது எழுதப்பட்டே உள்ளது. மேலும் கோபத்தை வெளிப்படுத்தும் வசனங்கள் இருப்பதால் அல்லாஹ்வை அளவற்ற அருளாளன் நிகரற்ற அன்புடையோன் என்று சொல்லக் கூடாது என்பது சட்டமில்லை. அல்லாஹ் எப்போதும் அளவற்ற அருளாளன் தான். நிகரற்ற அன்புடையோன் தான். அது எந்தக் காரணத்துக்காகவும் மாறாது. மேலும் இந்த அத்தியாயத்தில் அல்லாஹ்வின் கோபத்தை வெளிப்படுத்தும் வசனங்கள் மட்டுமின்றி அல்லாஹ்வின் அருளையும், மன்னிப்பையும் கூறும் வசனங்களும் உள்ளன. அல்லாஹ் பலரை மன்னித்ததைக் கூறும் வசனங்கள் இந்த அத்தியாயத்தில் இருப்பதால் தான் இந்த அத்தியாயத்துக்கு அத்தவ்பா – மன்னிப்பு என்று பெயர் சூட்டப்பட்டுள்ளது. எனவே பிஸ்மில்லாஹ் என்பதை இதன் துவக்கத்தில் எழுதாமல் போனதற்கு இது காரணமாக இருக்கவே முடியாது. அல்லாஹ் இக்குர்ஆனைப் பாதுகாக்கும் பொறுப்பை ஏற்றுள்ளதால் யாருடைய விருப்பத்தின்படியும் குர்ஆனில் எந்த மாற்றமும் செய்திருக்க முடியாது. அபூபக்ர் (ரலி) அவர்களோ, உஸ்மான் (ரலி) அவர்களோ திருக்குர்ஆனில் உள்ள எந்த ஒன்றையும் எழுதாமல் விட்டிருக்க மாட்டார்கள். குர்ஆனில் இல்லாததை எழுதியும் இருக்க மாட்டார்கள். உஸ்மான் (ரலி) அவர்கள் பிரதி எடுத்தபோது அவர்கள் பிஸ்மில்லாஹிர் ரஹ்மானிர் ரஹீம் என்று எழுதவில்லை. அவர்கள் மூலநூலாக வைத்திருந்த அபூபக்ர் (ரலி) தொகுத்த திருக்குர்ஆனில் இந்த அத்தியாயத்தில் பிஸ்மில்லாஹிர் ரஹ்மானிர் ரஹீம் என்று எழுதப்படாமல் இருந்திருக்க வேண்டும். அபூபக்ர் (ரலி) அவர்கள் திருக்குர்ஆனின் எழுத்தர்கள் எழுதி வைத்திருந்த பிரதிகளின் அடிப்படையில்தான் திருக்குர்ஆனைத் தொகுத்தனர். அந்தப் பிரதிகளில் பிஸ்மில்லாஹிர் ரஹ்மானிர் ரஹீம் என்று எழுதப்படாமல் இருந்திருக்க வேண்டும். அதனால் தான் அதை அபூபக்ர் (ரலி) அவர்களும் எழுதாமல் விட்டிருக்க வேண்டும். திருக்குர்ஆனை அல்லாஹ்வே பாதுகாத்துள்ளான்; அதில் மனித விருப்பத்துக்கு இடமில்லை என்பதால் இதுவே சரியான கருத்தாகும்.'
    ),
    SuraDetails(
        suraNumber: 10,
        tamilName: 'யூனுஸ்',
        tamilMeaning: 'ஓர் இறைத் தூதரின் பெயர்',
        arabicName: 'سُوۡرَةُ یُونس',
        verseCount: 109,
        reasonForName: 'இந்த அத்தியாயத்தில் 98வது வசனத்தில் யூனுஸ் நபியை ஏற்காத மக்கள், இறைவனுடைய தண்டனையின் அறிகுறியைப் பார்த்தவுடன் திருந்தி ஏகஇறைவனை ஏற்றுக் கொண்டதால் அவர்கள் தண்டனையிலிருந்து காப்பாற்றப்பட்டார்கள் என்ற செய்தி இடம் பெறுவதால் யூனுஸ் என்று இந்த அத்தியாயத்துக்குப் பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 11,
        tamilName: 'ஹூது',
        tamilMeaning: 'ஓர் இறைத் தூதரின் பெயர்',
        arabicName: 'سُوۡرَةُ هُود',
        verseCount: 123,
        reasonForName: 'இந்த அத்தியாயத்தில் 50வது வசனம் முதல் 60வது வசனம் வரை ஹூது நபி அவர்களுடைய பிரச்சாரமும், அவர்களுடைய சமுதாயத்தினர் அவருக்குக் கொடுத்த இடையூறுகளும், நல்லோர் காப்பாற்றப்பட்டு தீயோர் அழிக்கப்பட்டதும் கூறப்படுகிறது. எனவே இந்த அத்தியாயம் ஹூது எனப் பெயர் பெறுகிறது.'
    ),
    SuraDetails(
        suraNumber: 12,
        tamilName: 'யூஸுஃப்',
        tamilMeaning: 'ஓர் இறைத் தூதரின் பெயர்',
        arabicName: 'سُوۡرَةُ یُوسُف',
        verseCount: 111,
        reasonForName: 'இந்த அத்தியாயம் முழுவதும் யூஸுஃப் என்ற இறைத்தூதரின் வரலாறு விரிவாகக் கூறப்படுகிறது. ஒரு அத்தியாயத்தில் முழுமையாக ஒருவரது வரலாறு கூறப்படுவது இந்த அத்தியாயத்தில் மட்டும் தான். எனவே இந்த அத்தியாயம் யூஸுஃப் எனப் பெயர்பெற்றது.'
    ),
    SuraDetails(
        suraNumber: 13,
        tamilName: 'அர்ரஃது',
        tamilMeaning: 'இடி',
        arabicName: 'سُوۡرَةُ الرّعد',
        verseCount: 43,
        reasonForName: 'இந்த அத்தியாயத்தின் 13வது வசனத்தில் இடியும் இறைவனைத் துதிக்கிறது என்ற சொற்றொடர் இடம் பெறுவதால் இந்த அத்தியாயம் இடி என பெயர் பெற்றது.'
    ),
    SuraDetails(
        suraNumber: 14,
        tamilName: 'இப்ராஹீம்',
        tamilMeaning: 'ஓர் இறைத் தூதரின் பெயர்',
        arabicName: 'سُوۡرَةُ إبراهیم',
        verseCount: 52,
        reasonForName: 'இந்த அத்தியாயத்தில் இப்ராஹீம் நபியவர்கள் கஃஅபாவை புனர்நிர்மாணம் செய்தது 35வது வசனத்திலும், தமது குடும்பத்தினரை இறைவனின் கட்டளைப்படி பாலைவனப் பெருவெளியாக இருந்த மக்காவில் குடியமர்த்திய செய்தி 37வது வசனத்திலும், முதுமையில் அவர்களுக்கு இறைவன் இஸ்மாயீல், இஸ்ஹாக் ஆகிய குழந்தைகளை வழங்கிய நிகழ்ச்சி 39வது வசனத்திலும் இடம் பெறுவதால் இந்த அத்தியாயத்திற்கு இப்ராஹீம் எனப் பெயர் சூட்டப்பட்டிருக்கிறது.'
    ),
    SuraDetails(
        suraNumber: 15,
        tamilName: 'அல் ஹிஜ்ர்',
        tamilMeaning: 'ஓர் ஊர்',
        arabicName: 'سُوۡرَةُ الحِجر',
        verseCount: 99,
        reasonForName: 'ஹிஜ்ர் என்பது ஸமூது சமுதாயத்தினர் வாழ்ந்த ஊரின் பெயர். இந்தச் சமுதாயத்தினரைப் பற்றி இந்த அத்தியாயத்தின் 80 முதல் 84 வரை உள்ள வசனங்களில் குறிப்பிடப்படுவதால் இந்தப் பெயர் சூட்டப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 16,
        tamilName: 'அந்நஹ்ல்',
        tamilMeaning: 'தேனீ',
        arabicName: 'سُوۡرَةُ النّحل',
        verseCount: 128,
        reasonForName: 'இந்த அத்தியாயத்தின் 68, 69 வசனங்களில் தேனீயைப் பற்றியும், தேனைப் பற்றியும் கூறப்படுவதால் இந்த அத்தியாயத்திற்கு தேனீ என்று பெயர் சூட்டப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 17,
        tamilName: 'பனூ இஸ்ராயீல்',
        tamilMeaning: 'இஸ்ராயீலின் மக்கள்',
        arabicName: 'سُوۡرَةُ بنیٓ اسرآئیل',
        verseCount: 111,
        reasonForName: 'இஸ்ரவேலர்களுக்கு இறைவன் அளித்த வெற்றிகளும், அவர்கள் இறைவனுக்கு மாறுசெய்ததும், அவர்களுக்கு ஏற்பட்ட தோல்விகளும் இந்த அத்தியாயத்தில் 4 முதல் 8 வரை உள்ள வசனங்களில் கூறப்படுவதால் இஸ்ராயீலின் மக்கள் என்று இந்த அத்தியாயம் பெயர் பெற்றது.'
    ),
    SuraDetails(
        suraNumber: 18,
        tamilName: 'அல்கஹ்ஃப்',
        tamilMeaning: 'அந்தக்குகை',
        arabicName: 'سُوۡرَةُ الکهف',
        verseCount: 110,
        reasonForName: 'இந்த அத்தியாயத்தின் 9 முதல் 26 வரை உள்ள வசனங்களில் கொள்கைக்காக நாடு துறந்து குகையில் தஞ்சமடைந்த சில இளைஞர்களின் அற்புத வரலாறு கூறப்படுவதால் இந்தப் பெயர் வந்தது.'
    ),
    SuraDetails(
        suraNumber: 19,
        tamilName: 'மர்யம்',
        tamilMeaning: 'ஈஸா நபியின் தாயாரின் பெயர்',
        arabicName: 'سُوۡرَةُ مَریَم',
        verseCount: 98,
        reasonForName: 'இந்த அத்தியாயத்தின் 16 முதல் 34 வரை உள்ள வசனங்களில் மர்யம் (அலை) அவர்கள் கணவரில்லாமல் கருவுற்று ஈஸா நபியை ஈன்றெடுத்த செய்தி கூறப்படுவதால் மர்யம் என்று இந்த அத்தியாயம் பெயர்பெற்றது.'
    ),
    SuraDetails(
        suraNumber: 20,
        tamilName: 'தா ஹா',
        tamilMeaning: 'அரபு மொழியின் 16 மற்றும் 26வது எழுத்துக்கள்.',
        arabicName: 'سُوۡرَةُ طٰه',
        verseCount: 135,
        reasonForName: 'தா, ஹா எனும் இரண்டு எழுத்துக்கள் இந்த அத்தியாயத்தின் முதல் வசனமாக இடம் பெறுவதால் இந்த அத்தியாயத்திற்கு இவ்வாறு பெயரிட்டுள்ளனர்.'
    ),
    SuraDetails(
        suraNumber: 21,
        tamilName: 'அல் அன்பியா',
        tamilMeaning: 'நபிமார்கள்',
        arabicName: 'سُوۡرَةُ الاٴنبیَاء',
        verseCount: 112,
        reasonForName: 'மூஸா, ஹாரூன், இப்ராஹீம், லூத், இஸ்ஹாக், யாகூப், நூஹ், தாவூத், ஸுலைமான், அய்யூப், இஸ்மாயீல், இத்ரீஸ், துல்கிஃப்ல், யூனுஸ், ஸகரிய்யா ஆகிய நபிமார்கள் குறித்து பேசப்படுவதால் இந்த அத்தியாயம் நபிமார்கள் என்று பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 22,
        tamilName: 'அல் ஹஜ்',
        tamilMeaning: 'கடமையான ஒரு வணக்கம்',
        arabicName: 'سُوۡرَةُ الحَجّ',
        verseCount: 78,
        reasonForName: 'இந்த அத்தியாயத்தின் 27 முதல் 37 வரை உள்ள வசனங்களில் ஹஜ் பற்றியும், அதன் ஒழுங்குகள் பற்றியும் கூறப்படுவதால் இந்த அத்தியாயத்திற்கு இவ்வாறு பெயர் சூட்டியுள்ளனர்.'
    ),
    SuraDetails(
        suraNumber: 23,
        tamilName: 'அல் முஃமினூன்',
        tamilMeaning: 'நம்பிக்கை கொண்டோர்',
        arabicName: 'سُوۡرَةُ المؤمنون',
        verseCount: 118,
        reasonForName: 'இந்த அத்தியாயத்தின் 1 முதல் 11 வரை உள்ள வசனங்களில் வெற்றி பெறும் நம்பிக்கையாளர்கள் பற்றி கூறப்படுவதால் இந்த அத்தியாயத்துக்கு இந்தப் பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 24,
        tamilName: 'அந்நூர்',
        tamilMeaning: 'அந்த ஒளி',
        arabicName: 'سُوۡرَةُ النُّور',
        verseCount: 64,
    reasonForName: 'இந்த அத்தியாயத்தின் 35வது வசனத்தில் இறைவன் தனது நேர்வழிக்கு ஒளியை உதாரணமாகக் கூறுவதால் அந்நூர் (அந்த ஒளி) என்று பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 25,
        tamilName: 'அல் ஃபுர்கான்',
        tamilMeaning: 'வேறுபடுத்திக் காட்டுவது',
        arabicName: 'سُوۡرَةُ الفُرقان',
        verseCount: 77,
    reasonForName: 'திருக்குர்ஆனைப் பற்றி ஃபுர்கான் என்று இந்த அத்தியாயத்தின் முதல் வசனம் கூறுவதால் இவ்வாறு பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 26,
        tamilName: 'அஷ் ஷுஅரா',
        tamilMeaning: 'கவிஞர்கள்',
        arabicName: 'سُوۡرَةُ الشُّعَرَاء',
        verseCount: 227,
    reasonForName: 'இந்த அத்தியாயத்தின் 221வது முதல் 227வது வசனம் வரை கவிஞர்கள் பின்பற்றத்தக்கவர்கள் அல்லர் எனவும், நல்ல கவிஞர்களும், கெட்ட கவிஞர்களும் உள்ளனர் என்றும் கூறப்படுவதால் கவிஞர்கள் என இந்த அத்தியாயத்துக்குப் பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 27,
        tamilName: 'அந்நம்ல்',
        tamilMeaning: 'எறும்பு',
        arabicName: 'سُوۡرَةُ النَّمل',
        verseCount: 93,
    reasonForName: 'இந்த அத்தியாயத்தின் 18, 19 வசனங்களில் எறும்பு பற்றிய ஒரு செய்தி இடம் பெற்றுள்ளதால் இப்பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 28,
        tamilName: 'அல் கஸஸ்',
        tamilMeaning: 'நடந்த செய்திகள்',
        arabicName: 'سُوۡرَةُ القَصَص',
        verseCount: 88,
    reasonForName: 'இந்த அத்தியாயத்தின் 25வது வசனத்தில் \'அல் கஸஸ்\' என்ற சொல் இடம் பெற்றுள்ளதால் இந்தப் பெயர்.'
    ),
    SuraDetails(
        suraNumber: 29,
        tamilName: 'அல் அன்கபூத்',
        tamilMeaning: 'சிலந்தி',
        arabicName: 'سُوۡرَةُ العَنکبوت',
        verseCount: 69,
    reasonForName: 'இந்த அத்தியாயத்தின் 41வது வசனத்தில் தவறான கடவுள் கொள்கை உடையவர்களுக்கு உதாரணமாக சிலந்தி வலை கூறப்படுவதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 30,
        tamilName: 'அர்ரூம்',
        tamilMeaning: 'ரோமப் பேரரசு',
        arabicName: 'سُوۡرَةُ الرُّوم',
        verseCount: 60,
    reasonForName: 'ரோமாபுரி சாம்ராஜ்யம் தோற்றது பற்றியும், பின்னர் அது மீண்டும் வெற்றி பெறும் என்பது பற்றியும் 2, 3, 4 வசனங்களில் கூறப்படுவதால் இந்த அத்தியாயத்துக்கு ரோமப்பேரரசு என்று பெயரிடப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 31,
        tamilName: 'லுக்மான்',
        tamilMeaning: 'ஒரு நல்ல மனிதரின் பெயர்',
        arabicName: 'سُوۡرَةُ لقمَان',
        verseCount: 34,
    reasonForName: 'லுக்மான் என்ற நல்லடியார் தமது மகனுக்குக் கூறும் அறிவுரை 13வது வசனம் முதல் 19வது வசனம் வரை கூறப்படுவதால் இந்த அத்தியாயத்துக்கு இவ்வாறு பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 32,
        tamilName: 'அஸ்ஸஜ்தா',
        tamilMeaning: 'சிரம் பணிதல்',
        arabicName: 'سُوۡرَةُ السَّجدَة',
        verseCount: 30,
    reasonForName: 'இறைவனுக்காக ஸஜ்தாச் செய்வோர் பற்றியும் அவர்களுக்குக் கிடைக்கும் பரிசுகள் பற்றியும் 15 முதல் 17 வரை உள்ள வசனங்களில் கூறப்படுவதால் இந்த அத்தியாயத்துக்கு இவ்வாறு பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 33,
        tamilName: 'அல் அஹ்ஸாப்',
        tamilMeaning: 'கூட்டுப் படையினர்',
        arabicName: 'سُوۡرَةُ الاٴحزَاب',
        verseCount: 73,
    reasonForName: 'பல்வேறு எதிரிகள் கூட்டாகப் படைதிரட்டி தாக்க வந்த நிகழ்ச்சி பற்றியும், அப்போது இறைவன் புறத்திலிருந்து கிடைத்த பேருதவி பற்றியும் 9வது வசனம் முதல் 27வது வசனம் வரை கூறப்படுவதால் இந்த அத்தியாயத்துக்கு இவ்வாறு பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 34,
        tamilName: 'ஸபா',
        tamilMeaning: 'ஓர் ஊர்',
        arabicName: 'سُوۡرَةُ سَبَإ',
        verseCount: 54,
    reasonForName: 'ஸபா எனும் ஊரைப் பற்றியும், அவ்வூரில் செழிப்பான வசதிகள் செய்து கொடுத்தது பற்றியும், அவ்வூரார் நன்றி மறந்தபோது செழிப்பை நீக்கியது பற்றியும் 15, 16, 17 ஆகிய வசனங்களில் கூறப்படுவதால் இந்த அத்தியாயத்திற்கு இவ்வாறு பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 35,
        tamilName: 'ஃபாத்திர்',
        tamilMeaning: 'படைப்பவன்',
        arabicName: 'سُوۡرَةُ فَاطِر',
        verseCount: 45,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் ஃபாத்திர் என்ற சொல் இடம் பெறுவதால் இந்த அத்தியாயத்துக்கு இவ்வாறு பெயர் சூட்டியுள்ளனர்.'
    ),
    SuraDetails(
        suraNumber: 36,
        tamilName: 'யாஸீன்',
        tamilMeaning: 'அரபு மொழியின் 28வது மற்றும் 12வது எழுத்துக்கள்',
        arabicName: 'سُوۡرَةُ یسٓ',
        verseCount: 83,
    reasonForName: 'இந்த அத்தியாயத்தின் துவக்கம் யா, ஸீன் என்ற இரண்டு எழுத்துக்களைக் கொண்டு துவங்குவதால் இவ்வாறு பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 37,
        tamilName: 'அஸ் ஸாஃப்பாத்',
        tamilMeaning: 'அணி வகுப்போர்',
        arabicName: 'سُوۡرَةُ الصَّافات',
        verseCount: 182,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அஸ் ஸாஃப்பாத் என்ற சொல் இடம் பெறுவதால் இந்த அத்தியாயத்துக்கு இவ்வாறு பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 38,
        tamilName: 'ஸாத்',
        tamilMeaning: 'அரபு மொழியின் 14வது எழுத்து',
        arabicName: 'سُوۡرَةُ صٓ',
        verseCount: 88,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் ஸாத் என்ற எழுத்து இடம் பெற்றுள்ளதால் இந்த அத்தியாயத்துக்கு இவ்வாறு பெயர் சூட்டியுள்ளனர்.'
    ),
    SuraDetails(
        suraNumber: 39,
        tamilName: 'அஸ்ஸுமர்',
        tamilMeaning: 'கூட்டங்கள்',
        arabicName: 'سُوۡرَةُ الزُّمَر',
        verseCount: 75,
    reasonForName: 'நல்லோர் சொர்க்கத்துக்கும், தீயோர் நரகத்துக்கும் கூட்டம் கூட்டமாக ஓட்டிச் செல்லப்படுவார்கள் என்று 71, 73 ஆகிய வசனங்கள் கூறுவதால் இந்த அத்தியாயத்துக்கு இவ்வாறு பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 40,
        tamilName: 'அல் முஃமின்',
        tamilMeaning: 'நம்பிக்கை கொண்டவர்',
        arabicName: 'سُوۡرَةُ المؤمن',
        verseCount: 85,
    reasonForName: 'இந்த அத்தியாயத்தின் 28வது வசனத்தில் முஃமின் என்ற சொல் இடம் பெறுவதால் இந்தப் பெயர் வந்தது.'
    ),
    SuraDetails(
        suraNumber: 41,
        tamilName: 'ஃபுஸ்ஸிலத்',
        tamilMeaning: 'தெளிவுபடுத்தப்பட்டது',
        arabicName: 'سُوۡرَةُ فُصّلَت',
        verseCount: 54,
    reasonForName: 'இந்த அத்தியாயத்தின் மூன்றாம் வசனத்தில் ஃபுஸ்ஸிலத் என்ற சொல் இடம் பெற்றுள்ளதால் இந்தப் பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 42,
        tamilName: 'அஷ்ஷூரா',
        tamilMeaning: 'கலந்தாலோசனை',
        arabicName: 'سُوۡرَةُ الشّوریٰ',
        verseCount: 53,
    reasonForName: 'ஆலோசனை செய்தே முடிவு செய்ய வேண்டும் என்று 38வது வசனம் கூறுவதால் இந்த அத்தியாயத்துக்கு இவ்வாறு பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 43,
        tamilName: 'அஸ்ஸுக்ருஃப்',
        tamilMeaning: 'அலங்காரம்',
        arabicName: 'سُوۡرَةُ الزّخرُف',
        verseCount: 89,
    reasonForName: 'அலங்காரமான சொகுசு வாழ்க்கை பற்றி 34, 35 ஆகிய வசனங்களில் கூறப்படுவதால் இந்த அத்தியாயத்துக்கு இப்பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 44,
        tamilName: 'அத்துகான்',
        tamilMeaning: 'அந்தப் புகை',
        arabicName: 'سُوۡرَةُ الدّخان',
        verseCount: 59,
    reasonForName: 'பத்தாவது வசனத்தில் புகை மூட்டம் பற்றிய ஓர் எச்சரிக்கை இடம் பெற்றுள்ளதால் இந்த அத்தியாயத்துக்கு இவ்வாறு பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 45,
        tamilName: 'அல் ஜாஸியா',
        tamilMeaning: 'மண்டியிட்டோர்',
        arabicName: 'سُوۡرَةُ الجَاثیَة',
        verseCount: 37,
    reasonForName: 'இந்த அத்தியாயத்தின் 28வது வசனத்தில் ஒவ்வொரு சமுதாயமும் மண்டியிட்டவர்களாக இறைவன் முன் நிறுத்தப்படுவதைப் பற்றிக் கூறப்படுவதால் இந்த அத்தியாயத்துக்கு இவ்வாறு பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 46,
        tamilName: 'அல் அஹ்காஃப்',
        tamilMeaning: 'மணற்குன்றுகள்',
        arabicName: 'سُوۡرَةُ الاٴحقاف',
        verseCount: 35,
    reasonForName: 'இந்த அத்தியாயத்தின் 21வது வசனத்தில் ஹூத் என்ற இறைத்தூதர் மணற்குன்றின் மீது நின்று பிரச்சாரம் செய்ததைப் பற்றிக் கூறப்படுவதால் இந்த அத்தியாயத்துக்கு இந்தப் பெயர் சூட்டப்பட்டது'
    ),
    SuraDetails(
        suraNumber: 47,
        tamilName: 'முஹம்மத்',
        tamilMeaning: 'இறுதித் தூதரின் பெயர்',
        arabicName: 'سُوۡرَةُ محَمَّد',
        verseCount: 38,
    reasonForName: 'இந்த அத்தியாயத்தின் 2வது வசனத்தில் முஹம்மது மீது அருளப்பட்டது என்ற சொல் இடம்பெற்றுள்ளதால் இந்த அத்தியாயத்திற்கு முஹம்மத் என்று பெயரிடப்பட்டது'
    ),
    SuraDetails(
        suraNumber: 48,
        tamilName: 'அல்ஃபத்ஹ்',
        tamilMeaning: 'அந்த வெற்றி',
        arabicName: 'سُوۡرَةُ الفَتْح',
        verseCount: 29,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் மகத்தான வெற்றியைப் பற்றிக் கூறப்பட்டிருப்பதால் இந்த அத்தியாயத்துக்கு வெற்றி என்று பெயர் சூட்டப்பட்டது'
    ),
    SuraDetails(
        suraNumber: 49,
        tamilName: 'அல் ஹுஜ்ராத்',
        tamilMeaning: 'அறைகள்',
        arabicName: 'سُوۡرَةُ الحُجرَات',
        verseCount: 18,
    reasonForName: 'இந்த அத்தியாயத்தின் நான்காவது வசனத்தில், அறைகளுக்கு வெளியே நின்று கொண்டு நபிகள் நாயகம் (ஸல்) அவர்களை அழைக்கக் கூடாது என்று கூறப்படுவதால் அறைகள் என இந்த அத்தியாயத்துக்குப் பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 50,
        tamilName: 'காஃப்',
        tamilMeaning: 'அரபு மொழியின் 21வது எழுத்து',
        arabicName: 'سُوۡرَةُ قٓ',
        verseCount: 45,
    reasonForName: 'இந்த அத்தியாயத்தின் துவக்கத்தில், காஃப் என்ற எழுத்து இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆக்கப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 51,
        tamilName: 'அத்தாரியாத்',
        tamilMeaning: 'புழுதி பரத்தும் காற்றுகள்',
        arabicName: 'سُوۡرَةُ الذّاریَات',
        verseCount: 60,
    reasonForName: 'இந்த அத்தியாயத்தின் துவக்கத்தில், அத்தாரியாத் என்ற சொல் இடம் பெறுவதால் அதுவே இந்த அத்தியாயத்தின் பெயரானது.'
    ),
    SuraDetails(
        suraNumber: 52,
        tamilName: 'அத்தூர்',
        tamilMeaning: 'ஒரு மலையின் பெயர்',
        arabicName: 'سُوۡرَةُ الطُّور',
        verseCount: 49,
    reasonForName: 'இந்த அத்தியாயத்தின் துவக்கத்தில், தூர் என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 53,
        tamilName: 'அந்நஜ்மு',
        tamilMeaning: 'நட்சத்திரம்',
        arabicName: 'سُوۡرَةُ النّجْم',
        verseCount: 62,
    reasonForName: 'இந்த அத்தியாயத்தின் துவக்கத்தில் நஜ்மு என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 54,
        tamilName: 'அல் கமர்',
        tamilMeaning: 'சந்திரன்',
        arabicName: 'سُوۡرَةُ القَمَر',
        verseCount: 55,
    reasonForName: 'இந்த அத்தியாயத்தின் துவக்கத்தில் சந்திரன் பிளந்தது என்று கூறப்படுவதால் இந்த அத்தியாயத்துக்கு சந்திரன் எனப் பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 55,
        tamilName: 'அர்ரஹ்மான்',
        tamilMeaning: 'அளவற்ற அருளாளன்',
        arabicName: 'سُوۡرَةُ الرَّحمٰن',
        verseCount: 78,
    reasonForName: 'இந்த அத்தியாயத்தின் துவக்கத்தில் அர்ரஹ்மான் என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்துக்குப் பெயராக ஆக்கப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 56,
        tamilName: 'அல் வாகிஆ',
        tamilMeaning: 'அந்த நிகழ்ச்சி',
        arabicName: 'سُوۡرَةُ الواقِعَة',
        verseCount: 96,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் வாகிஆ என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்துக்குப் பெயராக ஆக்கப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 57,
        tamilName: 'அல் ஹதீத்',
        tamilMeaning: 'இரும்பு',
        arabicName: 'سُوۡرَةُ الحَدید',
        verseCount: 29,
    reasonForName: 'இந்த அத்தியாயத்தின் 25வது வசனத்தில் இரும்பைப் பற்றிக் கூறப்படுவதால் இதற்கு அல்ஹதீத் (இரும்பு) என்று பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 58,
        tamilName: 'அல் முஜாதலா',
        tamilMeaning: 'தர்க்கம் செய்தல்',
        arabicName: 'سُوۡرَةُ المجَادلة',
        verseCount: 22,
    reasonForName: 'இந்த அத்தியாயத்தின் துவக்கத்தில் நபிகள் நாயகம் (ஸல்) அவர்களிடம் ஒரு பெண் தர்க்கம் செய்தது பற்றி கூறப்படுவதால் தர்க்கம் செய்தல் என்று இந்த அத்தியாயத்துக்குப் பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 59,
        tamilName: 'அல் ஹஷ்ர்',
        tamilMeaning: 'வெளியேற்றம்',
        arabicName: 'سُوۡرَةُ الحَشر',
        verseCount: 24,
    reasonForName: 'இந்த அத்தியாயத்தின் இரண்டாம் வசனம், யூதர்கள் நாடு கடத்தப்பட்டது பற்றிக் கூறுவதால் வெளியேற்றம் என்று இந்த அத்தியாயத்துக்குப் பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 60,
        tamilName: 'அல் மும்தஹினா',
        tamilMeaning: 'சோதித்து அறிதல்',
        arabicName: 'سُوۡرَةُ المُمتَحنَة',
        verseCount: 13,
    reasonForName: 'இந்த அத்தியாயத்தின் பத்தாவது வசனத்தில் நாடு துறந்து வரும் பெண்களைச் சோதித்து அறிய வேண்டும் என்று கூறப்படுவதால் சோதித்து அறிதல் என்று இந்த அத்தியாயத்துக்குப் பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 61,
        tamilName: 'அஸ்ஸஃப்',
        tamilMeaning: 'அணிவகுப்பு',
        arabicName: 'سُوۡرَةُ الصَّف',
        verseCount: 14,
    reasonForName: 'இந்த அத்தியாயத்தின் நான்காவது வசனத்தில் அல்லாஹ்வின் பாதையில் அணிவகுத்து நிற்பவர்களைப் பற்றி பேசப்படுவதால் அணிவகுப்பு என்று இந்த அத்தியாயத்துக்குப் பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 62,
        tamilName: 'அல் ஜுமுஆ',
        tamilMeaning: 'வெள்ளிக் கிழமையின் சிறப்புத் தொழுகை',
        arabicName: 'سُوۡرَةُ الجُمُعَة',
        verseCount: 11,
    reasonForName: 'இந்த அத்தியாயத்தின் 9, 10 வசனங்களில் ஜுமுஆ என்ற வெள்ளிக்கிழமை தொழுகையைப் பற்றிக் கூறப்படுவதால் இந்த அத்தியாயத்துக்கு ஜுமுஆ என்று பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 63,
        tamilName: 'அல் முனாஃபிகூன்',
        tamilMeaning: 'நயவஞ்சகர்கள்',
        arabicName: 'سُوۡرَةُ المنَافِقون',
        verseCount: 11,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் நயவஞ்சகர்களைப் பற்றி பேசப்படுவதால் இந்த அத்தியாயத்துக்கு இவ்வாறு பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 64,
        tamilName: 'அத்தகாபுன்',
        tamilMeaning: 'பெருநட்டம்',
        arabicName: 'سُوۡرَةُ التّغَابُن',
        verseCount: 18,
    reasonForName: 'இந்த அத்தியாயத்தின் 9வது வசனத்தில் தீயவர்கள் நட்டமடையும் நாள் பற்றி பேசப்படுவதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 65,
        tamilName: 'அத்தலாக்',
        tamilMeaning: 'விவாகரத்து',
        arabicName: 'سُوۡرَةُ الطّلاَق',
        verseCount: 12,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் விவாகரத்து பற்றி பேசப்படுவதால் அதுவே இந்த அத்தியாயத்தின் பெயரானது.'
    ),
    SuraDetails(
        suraNumber: 66,
        tamilName: 'அத்தஹ்ரீம்',
        tamilMeaning: 'தடை செய்தல்',
        arabicName: 'سُوۡرَةُ التّحْریم',
        verseCount: 12,
    reasonForName: 'இறைவன் அனுமதித்ததை நபிகள் நாயகம் (ஸல்) அவர்கள் தடை செய்ததைப் பற்றி இந்த அத்தியாயத்தின் முதல் வசனத்தில் கூறப்படுவதால் தடை செய்தல் என்று இந்த அத்தியாயத்துக்குப் பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 67,
        tamilName: 'அல் முல்க்',
        tamilMeaning: 'அதிகாரம்',
        arabicName: 'سُوۡرَةُ المُلک',
        verseCount: 30,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில், அதிகாரம் அவன் கையில் எனத் துவங்குவதால் இந்த அத்தியாயத்திற்கு அதிகாரம் என்று பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 68,
        tamilName: 'அல் கலம்',
        tamilMeaning: 'எழுதுகோல்',
        arabicName: 'سُوۡرَةُ القَلَم',
        verseCount: 52,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் எழுதுகோல் பற்றிப் பேசப்படுவதால் இந்த அத்தியாயத்திற்கு எழுதுகோல் என பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 69,
        tamilName: 'அல் ஹாக்கா',
        tamilMeaning: 'அந்த உண்மை நிகழ்ச்சி',
        arabicName: 'سُوۡرَةُ الحَاقَّة',
        verseCount: 52,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் உண்மை நிகழ்ச்சி என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 70,
        tamilName: 'அல் மஆரிஜ்',
        tamilMeaning: 'தகுதிகள்',
        arabicName: 'سُوۡرَةُ المعَارج',
        verseCount: 44,
    reasonForName: 'இந்த அத்தியாயத்தின் மூன்றாவது வசனத்தில், தகுதிகள் என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆக்கப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 71,
        tamilName: 'நூஹ்',
        tamilMeaning: 'ஓர் இறைத் தூதரின் பெயர்',
        arabicName: 'سُوۡرَةُ نُوح',
        verseCount: 28,
    reasonForName: 'இந்த அத்தியாயத்தில் நூஹ் நபியின் பிரச்சாரம் பற்றிப் பேசப்படுவதால் இந்த அத்தியாயத்திற்கு நூஹ் என்று பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 72,
        tamilName: 'அல் ஜின்',
        tamilMeaning: 'மனிதனின் கண்களுக்குத் தென்படாத படைப்பு',
        arabicName: 'سُوۡرَةُ الجنّ',
        verseCount: 28,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் ஜின் என்ற இனத்தைப் பற்றிப் பேசப்படுவதால் இதற்கு ஜின் என்று பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 73,
        tamilName: 'அல் முஸ்ஸம்மில்',
        tamilMeaning: 'போர்த்தியிருப்பவர்',
        arabicName: 'سُوۡرَةُ المُزمّل',
        verseCount: 20,
    reasonForName: 'இந்த அத்தியாயம், போர்த்திக் கொண்டிருப்பவரே (முஸ்ஸம்மில்) என்று துவங்குவதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆக்கப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 74,
        tamilName: 'அல் முத்தஸிர்',
        tamilMeaning: 'போர்த்தியிருப்பவர்',
        arabicName: 'سُوۡرَةُ المدَّثِّر',
        verseCount: 56,
    reasonForName: 'இந்த அத்தியாயம், போர்த்தி இருப்பவரே (முத்தஸிர்) என்று துவங்குவதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆக்கப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 75,
        tamilName: 'அல் கியாமா',
        tamilMeaning: 'இறைவன் முன்னால் நிற்கும் நாள்',
        arabicName: 'سُوۡرَةُ القِیَامَة',
        verseCount: 40,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில், கியாமத் நாள் என்று கூறப்படுவதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆக்கப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 76,
        tamilName: 'அத்தஹ்ர்',
        tamilMeaning: 'காலம்',
        arabicName: 'سُوۡرَةُ ٱلدَّهۡر',
        verseCount: 31,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் காலம் என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்திற்குப் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 77,
        tamilName: 'அல்முர்ஸலாத்',
        tamilMeaning: 'அனுப்பப்படும் காற்று',
        arabicName: 'سُوۡرَةُ المُرسَلات  ',
        verseCount: 50,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில், அனுப்பப்படும் காற்றின் மீது சத்தியம் எனக் கூறப்படுவதால், இவ்வாறு இந்த அத்தியாயத்திற்குப் பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 78,
        tamilName: 'அந்நபா',
        tamilMeaning: 'அந்தச் செய்தி',
        arabicName: 'سُوۡرَةُ النّبَإِ',
        verseCount: 40,
    reasonForName: 'இந்த அத்தியாயத்தின் இரண்டாம் வசனத்தில் அந்தச் செய்தி என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்திற்குப் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 79,
        tamilName: 'அந்நாஸிஆத்',
        tamilMeaning: 'கைப்பற்றுவோர்',
        arabicName: 'سُوۡرَةُ النَّازعَات',
        verseCount: 46,
    reasonForName: 'உயிரைக் கைப்பற்றும் வானவர்களைப் பற்றி இந்த அத்தியாயத்தில் கூறப்படுவதால் இதையே இந்த அத்தியாயத்துக்கு பெயராகச் சூட்டியுள்ளனர்.'
    ),
    SuraDetails(
        suraNumber: 80,
        tamilName: 'அபஸ',
        tamilMeaning: 'கடுகடுத்தார்',
        arabicName: 'سُوۡرَةُ عَبَسَ',
        verseCount: 42,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில், கடுகடுத்தார் என்ற சொல் இடம் பெறுவதால் அதையே இந்த அத்தியாயத்தின் பெயராக ஆக்கியுள்ளனர்.'
    ),
    SuraDetails(
        suraNumber: 81,
        tamilName: 'அத்தக்வீர்',
        tamilMeaning: 'சுருட்டுதல்',
        arabicName: 'سُوۡرَةُ التّکویر',
        verseCount: 29,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் சூரியன் சுருட்டப்படும் எனக் கூறப்படுவதால் இந்த அத்தியாயத்துக்கு இந்தப் பெயர் வைக்கப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 82,
        tamilName: 'அல் இன்ஃபிதார்',
        tamilMeaning: 'பிளந்துவிடுதல்',
        arabicName: 'سُوۡرَةُ الانفِطار',
        verseCount: 19,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் வானம் பிளந்து விடுவதைப் பற்றி பேசப்படுவதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆக்கப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 83,
        tamilName: 'அல் முதஃப்பிபீன்',
        tamilMeaning: 'அளவு நிறுவையில் குறைவு செய்வோர்',
        arabicName: 'سُوۡرَةُ المطفّفِین',
        verseCount: 36,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அளவு, நிறுவையில் குறைவு செய்வோர் என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆக்கப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 84,
        tamilName: 'அல் இன்ஷிகாக்',
        tamilMeaning: 'பிளந்து விடுதல்',
        arabicName: 'سُوۡرَةُ الانشقاق',
        verseCount: 25,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் வானம் பிளந்து விடுவதைப் பற்றிப் பேசப்படுவதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 85,
        tamilName: 'அல் புரூஜ்',
        tamilMeaning: 'நட்சத்திரங்கள்',
        arabicName: 'سُوۡرَةُ البُرُوج',
        verseCount: 22,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் புரூஜ் என்ற வார்த்தை இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆக்கப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 86,
        tamilName: 'அத்தாரிக்',
        tamilMeaning: 'விடிவெள்ளி',
        arabicName: 'سُوۡرَةُ الطّارق',
        verseCount: 17,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அத்தாரிக் என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 87,
        tamilName: 'அல் அஃலா',
        tamilMeaning: 'மிக உயர்ந்தவன்',
        arabicName: 'سُوۡرَةُ الاٴعلی',
        verseCount: 19,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் மிக உயர்ந்தவன் என்ற அடைமொழி இறைவனுக்குப் பயன்படுத்தப்பட்டிருப்பதால் இந்த அத்தியாயத்திற்கு இவ்வாறு பெயரிடப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 88,
        tamilName: 'அல் காஷியா',
        tamilMeaning: 'சுற்றி வளைப்பது',
        arabicName: 'سُوۡرَةُ الغَاشِیَة',
        verseCount: 26,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் காஷியா என்று உள்ளதால் அதுவே இந்த அத்தியாயத்தின் பெயராக வைக்கப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 89,
        tamilName: 'அல்ஃபஜ்ரு',
        tamilMeaning: 'வைகறை',
        arabicName: 'سُوۡرَةُ الفَجر',
        verseCount: 30,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் ஃபஜ்ரு என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராகச் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 90,
        tamilName: 'அல் பலது',
        tamilMeaning: 'அந்த நகரம்',
        arabicName: 'سُوۡرَةُ البَلَد',
        verseCount: 20,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில், அந்த நகரம் என்று இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இவ்வாறு பெயரிடப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 91,
        tamilName: 'அஷ்ஷம்ஸ்',
        tamilMeaning: 'சூரியன்',
        arabicName: 'سُوۡرَةُ الشّمس',
        verseCount: 15,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அஷ்ஷம்ஸ் என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 92,
        tamilName: 'அல் லைல்',
        tamilMeaning: 'இரவு',
        arabicName: 'سُوۡرَةُ اللیْل',
        verseCount: 21,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் லைல் என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக வைக்கப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 93,
        tamilName: 'அல்லுஹா',
        tamilMeaning: 'முற்பகல்',
        arabicName: 'سُوۡرَةُ الِضُّحىٰ',
        verseCount: 11,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல்லுஹா என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 94,
        tamilName: 'அஷ்ஷரஹ் (அல் இன்ஷிராஹ்)',
        tamilMeaning: 'விரிவாக்குதல்',
        arabicName: 'سُوۡرَةُ الشَّرح',
        verseCount: 8,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில், உமது உள்ளத்தை விரிவாக்கவில்லையா? என்று கூறப்படுவதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 95,
        tamilName: 'அத்தீன்',
        tamilMeaning: 'அத்தி',
        arabicName: 'سُوۡرَةُ التِّین',
        verseCount: 8,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அத்தி என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இவ்வாறு பெயரிடப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 96,
        tamilName: 'அல் அலக்',
        tamilMeaning: 'கருவுற்ற சினை முட்டை',
        arabicName: 'سُوۡرَةُ العَلق',
        verseCount: 19,
    reasonForName: 'இந்த அத்தியாயத்தின் இரண்டாவது வசனத்தில் அலக் என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 97,
        tamilName: 'அல் கத்ர்',
        tamilMeaning: 'மகத்துவம்',
        arabicName: 'سُوۡرَةُ القَدر',
        verseCount: 5,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் கத்ர் என்ற சொல் இடம் பெற்றிருப்பதால் இந்தப் பெயர் வைக்கப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 98,
        tamilName: 'அல் பய்யினா',
        tamilMeaning: 'தெளிவான சான்று',
        arabicName: 'سُوۡرَةُ البَیّنَة',
        verseCount: 8,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் பய்யினா என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 99,
        tamilName: 'அஸ்ஸில்ஸால்',
        tamilMeaning: 'நில அதிர்ச்சி',
        arabicName: 'سُوۡرَةُ الزّلزَلة',
        verseCount: 8,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் நில அதிர்ச்சி என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆக்கப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 100,
        tamilName: 'அல் ஆதியாத்',
        tamilMeaning: 'வேகமாக ஓடும் குதிரைகள்',
        arabicName: 'سُوۡرَةُ العَادیَات',
        verseCount: 11,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் ஆதியாத் என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராகச் சூட்டப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 101,
        tamilName: 'அல் காரிஆ',
        tamilMeaning: 'திடுக்கிடச் செய்யும் நிகழ்ச்சி',
        arabicName: 'سُوۡرَةُ القَارعَة',
        verseCount: 11,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனமாக அல் காரிஆ என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆக்கப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 102,
        tamilName: 'அத்தகாஸுர்',
        tamilMeaning: 'அதிகம் தேடுதல்',
        arabicName: 'سُوۡرَةُ التّکاثُر',
        verseCount: 8,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அத்தகாஸுர் என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் வைக்கப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 103,
        tamilName: 'அல் அஸ்ர்',
        tamilMeaning: 'காலம்',
        arabicName: 'سُوۡرَةُ العَصر',
        verseCount: 3,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் அஸ்ர் என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 104,
        tamilName: 'அல் ஹுமஸா',
        tamilMeaning: 'புறம் பேசுதல்',
        arabicName: 'سُوۡرَةُ الهُمَزة',
        verseCount: 9,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் ஹுமஸா என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 105,
        tamilName: 'அல் ஃபீல்',
        tamilMeaning: 'யானை',
        arabicName: 'سُوۡرَةُ الفِیل',
        verseCount: 5,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் யானை என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 106,
        tamilName: 'குரைஷ்',
        tamilMeaning: 'ஒரு கோத்திரத்தின் பெயர்',
        arabicName: 'سُوۡرَةُ قُرَیش',
        verseCount: 4,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் குரைஷ் என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 107,
        tamilName: 'அல் மாவூன்',
        tamilMeaning: 'அற்பப் பொருள்',
        arabicName: 'سُوۡرَةُ المَاعون',
        verseCount: 7,
    reasonForName: 'இந்த அத்தியாயத்தின் கடைசி வசனத்தில் அல் மாவூன் என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 108,
        tamilName: 'அல் கவ்ஸர்',
        tamilMeaning: 'தடாகம்',
        arabicName: 'سُوۡرَةُ الکَوثَر',
        verseCount: 3,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் கவ்ஸர் என்ற சொல் இடம் பெற்றிருப்பதால் அதுவே இந்த அத்தியாயத்தின் பெயராக ஆனது.'
    ),
    SuraDetails(
        suraNumber: 109,
        tamilName: 'அல் காஃபிரூன்',
        tamilMeaning: 'மறுப்போர்',
        arabicName: 'سُوۡرَةُ الکافِرون',
        verseCount: 6,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் காஃபிரூன் என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 110,
        tamilName: 'அந்நஸ்ர்',
        tamilMeaning: 'உதவி',
        arabicName: 'سُوۡرَةُ النّصر',
        verseCount: 3,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் நஸ்ர் என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 111,
        tamilName: 'தப்பத்',
        tamilMeaning: 'அழிந்தது',
        arabicName: 'سُوۡرَةُ لهب',
        verseCount: 5,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் தப்பத் என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டது.'
    ),
    SuraDetails(
        suraNumber: 112,
        tamilName: 'அல் இஃக்லாஸ்',
        tamilMeaning: 'உளத்தூய்மை',
        arabicName: 'سُوۡرَةُ الإخلاص',
        verseCount: 4,
    reasonForName: 'இந்த அத்தியாயம் ஓரிறைக் கொள்கையை இரத்தினச் சுருக்கமாகக் கூறுவதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 113,
        tamilName: 'அல் ஃபலக்',
        tamilMeaning: 'காலைப் பொழுது',
        arabicName: 'سُوۡرَةُ الفَلَق',
        verseCount: 5,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அல் ஃபலக் என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டுள்ளது.'
    ),
    SuraDetails(
        suraNumber: 114,
        tamilName: 'அந்நாஸ்',
        tamilMeaning: 'மனிதர்கள்',
        arabicName: 'سُوۡرَةُ النَّاس',
        verseCount: 6,
    reasonForName: 'இந்த அத்தியாயத்தின் முதல் வசனத்தில் அந் நாஸ் என்ற சொல் இடம் பெற்றிருப்பதால் இந்த அத்தியாயத்திற்கு இந்தப் பெயர் சூட்டப்பட்டுள்ளது.'
    )

  ];
}
