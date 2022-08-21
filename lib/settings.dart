import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _selectedTranslation = 'mJohn';
  double _currentArabicFontSize = 22;
  double _currentTamilFontSize = 18;
  String _selectedTamilFont = 'MuktaMalar';
  String _selectedArabicFont = 'AlQalam';
  bool NightMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NightMode ? Colors.grey[900] : Colors.green[100],
      appBar: AppBar(
          title: Text('அமைப்புகள்',
              style: TextStyle(fontFamily: _selectedTamilFont)),
          centerTitle: true,
          backgroundColor: NightMode ? Colors.black : Colors.green[900],
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          )),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(12, 5, 12, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: NightMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Switch(
                    value: NightMode,
                    onChanged: (value) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        NightMode = value;
                        prefs.setBool('NightMode', value);
                      });
                    },
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Text(
                'மொழிபெயர்ப்பைத் தெரிவு செய்யுங்கள்:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: _selectedTamilFont,
                  color: NightMode ? Colors.white : Colors.black,
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
                    color: NightMode ? Colors.white : Colors.black,
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
                    color: NightMode ? Colors.white : Colors.black,
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
                    color: NightMode ? Colors.white : Colors.black,
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
                    color: NightMode ? Colors.white : Colors.black,
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
                    color: NightMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Text(
                'அரபு எழுத்து அளவு',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: _selectedTamilFont,
                  color: NightMode ? Colors.white : Colors.black,
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
                'தமிழ் எழுத்து அளவு',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: _selectedTamilFont,
                  color: NightMode ? Colors.white : Colors.black,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'தமிழ் எழுத்து வடிவம்',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: _selectedTamilFont,
                      color: NightMode ? Colors.white : Colors.black,
                    ),
                  ),


                  DropdownButton(
                    elevation: 16,
                    style: TextStyle(color: Colors.black,
                        fontSize: 18,
                        ),
                    underline: Container(
                      height: 2,
                      color: Colors.grey[900],
                    ),
                    value: _selectedTamilFont,
                    items: const [
                      DropdownMenuItem(value: 'MuktaMalar', child: Text('தமிழ் 1',style: TextStyle(
                        fontFamily: 'MuktaMalar',
                      ),)),
                      DropdownMenuItem(value: 'MeeraInimai', child: Text('தமிழ் 2',style: TextStyle(
                        fontFamily: 'MeeraInimai',
                      ),)),

                      DropdownMenuItem(value: 'HindMadurai', child: Text('தமிழ் 3',style: TextStyle(
                        fontFamily: 'HindMadurai',
                      ),)),

                      DropdownMenuItem(value: 'NotoSansTamil', child: Text('தமிழ் 4',style: TextStyle(
                        fontFamily: 'NotoSansTamil',
                      ),)),



                    ], onChanged: (String? value) async {

                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    setState(() {
                      _selectedTamilFont = value!;
                      prefs.setString('selectedTamilFont', _selectedTamilFont);
                    });


                  },
                  )
                ],
              ),

              Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'அரபு எழுத்து வடிவம்',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: _selectedTamilFont,
                      color: NightMode ? Colors.white : Colors.black,
                    ),
                  ),

                  DropdownButton(
                    elevation: 16,
                    style: TextStyle(color: Colors.black,
                      fontSize: 18,
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.grey[900],
                    ),
                    value: _selectedArabicFont,
                    items: const [
                      DropdownMenuItem(value: 'AlQalam', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'AlQalam',
                      ),
                      )),

                      DropdownMenuItem(value: 'PDMS_Saleem', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'PDMS_Saleem',
                      ),
                      )),

                      DropdownMenuItem(value: 'Arabic', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'Arabic',
                      ),
                      )),

                      DropdownMenuItem(value: 'Naskh', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'Naskh',
                      ),
                      )),

                      DropdownMenuItem(value: 'Lateef', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'Lateef',
                      ),
                      )),

                      DropdownMenuItem(value: 'MeezanUni', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'MeezanUni',
                      ),
                      )),

                      DropdownMenuItem(value: 'NafeesNaskh', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'NafeesNaskh',
                      ),
                      )),

                      DropdownMenuItem(value: 'QuranCommon', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'QuranCommon',
                      ),
                      )),

                      DropdownMenuItem(value: 'Scheherazade', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'Scheherazade',
                      ),
                      )),

                      DropdownMenuItem(value: 'Uthmani', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'Uthmani',
                      ),
                        )),
                    ],
                    onChanged: (String? value) async {

                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    setState(() {
                      _selectedArabicFont = value!;
                      prefs.setString('selectedArabicFont', _selectedArabicFont);
                    });


                  },
                  ),
                ],
              ),

              Divider(
                thickness: 2,
              ),

              SizedBox(height: 40,),

              Center(
                child: Column(
                  children: [
                    Text(
                      'அமைப்புக்களை மீளமையுங்கள் (Reset Defaults):',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: _selectedTamilFont,
                        color: NightMode ? Colors.white : Colors.black,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          setState(() {
                            _selectedTranslation = 'mJohn';
                            _currentArabicFontSize = 22;
                            _currentTamilFontSize = 18;
                            _selectedTamilFont = 'MuktaMalar';
                            _selectedArabicFont = 'AlQalam';
                            NightMode = false;

                            prefs.setString('selectedTranslation', 'mJohn');
                            prefs.setDouble('tamilFontSize', 18);
                            prefs.setDouble('arabicFontSize', 22);
                            prefs.setString('selectedTamilFont', 'MuktaMalar');
                            prefs.setString('selectedArabicFont', 'AlQalam');
                            prefs.setBool('NightMode', false);
                          });
                        },
                        child: Text('Reset Settings')),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
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
          (prefs.getString('selectedTamilFont') ?? 'MuktaMalar');
      _selectedArabicFont =
          (prefs.getString('selectedArabicFont') ?? 'AlQalam');
      NightMode = (prefs.getBool('NightMode') ?? false);
    });
  }

  @override
  void initState() {
    super.initState();
    loadSelections();
  }
}
