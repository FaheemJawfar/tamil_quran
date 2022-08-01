import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tamil_quran/sura_namelist.dart';
import 'navigation.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _selectedTranslation = '';
  double _currentArabicFontSize = 22;
  double _currentTamilFontSize = 18;
  String _selectedTamilFont = 'MeeraInimai';
  String _selectedArabicFont = 'AlQalam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
          title: Text('அமைப்புகள்',
              style: TextStyle(fontFamily: _selectedTamilFont)),
          centerTitle: true,
          backgroundColor: Colors.green[900],
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              NavigationService().navigateToScreen(SuraNames());
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          )),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'மொழிபெயர்ப்பைத் தெரிவு செய்யுங்கள்:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: _selectedTamilFont,
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(vertical: -4),
                horizontalTitleGap: 1,
                contentPadding: EdgeInsets.only(top: 2, bottom: 2),
                leading: Radio<String>(
                  value: 'mJohn',
                  groupValue: _selectedTranslation,
                  onChanged: (value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      _selectedTranslation = value!;
                      prefs.setString('selectedTranslation', value);
                    });
                  },
                ),
                title: Text(
                  'ஜான் அறக்கட்டளை (John Trust)',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: _selectedTamilFont,
                  ),
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(vertical: -4),
                horizontalTitleGap: 1,
                contentPadding: EdgeInsets.only(top: 2, bottom: 2),
                leading: Radio<String>(
                  value: 'kingFahd',
                  groupValue: _selectedTranslation,
                  onChanged: (value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      _selectedTranslation = value!;
                      prefs.setString('selectedTranslation', value);
                    });
                  },
                ),
                title: Text(
                  'மன்னர் பஹத் வளாகம் (சவூதி)',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: _selectedTamilFont,
                  ),
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(vertical: -4),
                horizontalTitleGap: 1,
                contentPadding: EdgeInsets.only(top: 2, bottom: 2),
                leading: Radio<String>(
                  value: 'pj',
                  groupValue: _selectedTranslation,
                  onChanged: (value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      _selectedTranslation = value!;
                      prefs.setString('selectedTranslation', value);
                    });
                  },
                ),
                title: Text(
                  'பீ. ஜைனுலாப்தீன் (PJ)',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: _selectedTamilFont,
                  ),
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(vertical: -4),
                horizontalTitleGap: 1,
                contentPadding: EdgeInsets.only(top: 2, bottom: 2),
                leading: Radio<String>(
                  value: 'ift',
                  groupValue: _selectedTranslation,
                  onChanged: (value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      _selectedTranslation = value!;
                      prefs.setString('selectedTranslation', value);
                    });
                  },
                ),
                title: Text(
                  'இஸ்லாமிய நிறுவனம் அறக்கட்டளை (IFT)',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: _selectedTamilFont,
                  ),
                ),
              ),
              ListTile(
                visualDensity: VisualDensity(vertical: -4),
                horizontalTitleGap: 1,
                contentPadding: EdgeInsets.only(top: 2, bottom: 2),
                leading: Radio<String>(
                  value: 'abdulHameed',
                  groupValue: _selectedTranslation,
                  onChanged: (value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      _selectedTranslation = value!;
                      prefs.setString('selectedTranslation', value);
                    });
                  },
                ),
                title: Text(
                  'அப்துல் ஹமீது பாகவி',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: _selectedTamilFont,
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Text(
                'அரபு எழுத்துரு அளவு',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: _selectedTamilFont,
                ),
              ),
              Slider(
                value: _currentArabicFontSize,
                min: 15,
                max: 50,
                divisions: 35,
                label: _currentArabicFontSize.round().toString(),
                onChanged: (double value) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  setState(() {
                    _currentArabicFontSize = value;
                    prefs.setDouble('arabicFontSize', value);
                  });
                },
              ),
              Text(
                'தமிழ் எழுத்துரு அளவு',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: _selectedTamilFont,
                ),
              ),
              Slider(
                value: _currentTamilFontSize,
                min: 15,
                max: 50,
                divisions: 35,
                label: _currentTamilFontSize.round().toString(),
                onChanged: (double value) async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  setState(() {
                    _currentTamilFontSize = value;
                    prefs.setDouble('tamilFontSize', value);
                  });
                },
              ),
              Divider(
                thickness: 2,
              ),
              Text(
                'தமிழ் எழுத்து வடிவத்தை தேர்வு செய்க:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: _selectedTamilFont,
                ),
              ),
              Row(
                children: [
                  Radio(
                    value: 'MeeraInimai',
                    groupValue: _selectedTamilFont,
                    onChanged: (val) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        _selectedTamilFont = 'MeeraInimai';
                        prefs.setString('selectedTamilFont', 'MeeraInimai');
                      });
                    },
                  ),
                  Text(
                    'தமிழ் 1',
                    style: TextStyle(fontSize: 16.0, fontFamily: 'MeeraInimai'),
                  ),
                  Radio(
                    value: 'HindMadurai',
                    groupValue: _selectedTamilFont,
                    onChanged: (val) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        _selectedTamilFont = 'HindMadurai';
                        prefs.setString('selectedTamilFont', 'HindMadurai');
                      });
                    },
                  ),
                  Text(
                    'தமிழ் 2',
                    style: TextStyle(fontSize: 16.0, fontFamily: 'HindMadurai'),
                  ),
                  Radio(
                    value: 'MuktaMalar',
                    groupValue: _selectedTamilFont,
                    onChanged: (val) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        _selectedTamilFont = 'MuktaMalar';
                        prefs.setString('selectedTamilFont', 'MuktaMalar');
                      });
                    },
                  ),
                  Text(
                    'தமிழ் 3',
                    style: TextStyle(fontSize: 16.0, fontFamily: 'MuktaMalar'),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Text(
                'அரபு எழுத்து வடிவத்தை தேர்வு செய்க:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: _selectedTamilFont,
                ),
              ),
              Row(
                children: [
                  Radio(
                    value: 'AlQalam',
                    groupValue: _selectedArabicFont,
                    onChanged: (val) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        _selectedArabicFont = 'AlQalam';
                        prefs.setString('selectedArabicFont', 'AlQalam');
                      });
                    },
                  ),
                  Text(
                    'اَلْعَرَبِيَّةُ ١',
                    style: TextStyle(fontSize: 18.0, fontFamily: 'AlQalam'),
                  ),
                  Radio(
                    value: 'PDMS_Saleem',
                    groupValue: _selectedArabicFont,
                    onChanged: (val) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        _selectedArabicFont = 'PDMS_Saleem';
                        prefs.setString('selectedArabicFont', 'PDMS_Saleem');
                      });
                    },
                  ),
                  Text(
                    'اَلْعَرَبِيَّةُ ٢',
                    style: TextStyle(fontSize: 18.0, fontFamily: 'PDMS_Saleem'),
                  ),
                  Radio(
                    value: 'AlMajeed',
                    groupValue: _selectedArabicFont,
                    onChanged: (val) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        _selectedArabicFont = 'AlMajeed';
                        prefs.setString('selectedArabicFont', 'AlMajeed');
                      });
                    },
                  ),
                  Text(
                    'اَلْعَرَبِيَّةُ ٣',
                    style: TextStyle(fontSize: 18.0, fontFamily: 'AlMajeed'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadSelections() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedTranslation =
          (prefs.getString('selectedTranslation') ?? 'mJohn');
      _currentTamilFontSize = (prefs.getDouble('tamilFontSize') ?? 18);
      _currentArabicFontSize = (prefs.getDouble('arabicFontSize') ?? 22);
      _selectedTamilFont =
          (prefs.getString('selectedTamilFont') ?? 'MeeraInimai');
      _selectedArabicFont =
          (prefs.getString('selectedArabicFont') ?? 'AlQalam');
    });
  }

  @override
  void initState() {
    super.initState();
    loadSelections();
  }
}
