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
  bool nightMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nightMode ? Colors.grey[900] : Colors.green[100],
      appBar: AppBar(
          title: Text('அமைப்புகள்',
              style: TextStyle(fontFamily: _selectedTamilFont)),
          centerTitle: true,
          backgroundColor: nightMode ? Colors.black : Colors.green[900],
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          )),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(12, 5, 12, 0),
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
                      color: nightMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Switch(
                    value: nightMode,
                    onChanged: (value) async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        nightMode = value;
                        prefs.setBool('NightMode', value);
                      });
                    },
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              Text(
                'மொழிபெயர்ப்பைத் தெரிவு செய்யுங்கள்:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: _selectedTamilFont,
                  color: nightMode ? Colors.white : Colors.black,
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                horizontalTitleGap: 1,
                contentPadding: const EdgeInsets.only(top: 2, bottom: 2),
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
                    color: nightMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                horizontalTitleGap: 1,
                contentPadding: const EdgeInsets.only(top: 2, bottom: 2),
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
                    color: nightMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                horizontalTitleGap: 1,
                contentPadding: const EdgeInsets.only(top: 2, bottom: 2),
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
                    color: nightMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                horizontalTitleGap: 1,
                contentPadding: const EdgeInsets.only(top: 2, bottom: 2),
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
                    color: nightMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                horizontalTitleGap: 1,
                contentPadding: const EdgeInsets.only(top: 2, bottom: 2),
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
                    color: nightMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Text(
                'அரபு எழுத்து அளவு',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: _selectedTamilFont,
                  color: nightMode ? Colors.white : Colors.black,
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
                  color: nightMode ? Colors.white : Colors.black,
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
              const Divider(
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
                      color: nightMode ? Colors.white : Colors.black,
                    ),
                  ),


                  DropdownButton(
                    dropdownColor: nightMode ? Colors.grey[900] : Colors.white,
                    elevation: 16,
                    style: TextStyle(color: nightMode ? Colors.white : Colors.black,
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

              const Divider(
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
                      color: nightMode ? Colors.white : Colors.black,
                    ),
                  ),

                  DropdownButton(
                    dropdownColor: nightMode ? Colors.grey[900] : Colors.white,
                    alignment: AlignmentDirectional.centerEnd,
                    elevation: 16,
                    style: TextStyle(color: nightMode ? Colors.white : Colors.black,
                      fontSize: 18,
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.grey[900],
                    ),
                    value: _selectedArabicFont,
                    items:  const [
                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerEnd,
                          value: 'AlQalam', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'AlQalam',
                      ),
                      )),

                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerEnd,
                          value: 'PDMS_Saleem', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'PDMS_Saleem',
                      ),
                      )),

                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerEnd,
                          value: 'Arabic', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'Arabic',
                      ),
                      )),


                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerEnd,
                          value: 'MeezanUni', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
                        fontFamily: 'MeezanUni',
                      ),
                      )),


                      DropdownMenuItem(
                          alignment: AlignmentDirectional.centerEnd,
                          value: 'Uthmani', child: Text('بِسْمِ ٱللَّٰهِ',style: TextStyle(
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

              const Divider(
                thickness: 2,
              ),

              const SizedBox(height: 40,),

              Center(
                child: Column(
                  children: [
                    Text(
                      'அமைப்புக்களை மீளமையுங்கள் (Reset Defaults):',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: _selectedTamilFont,
                        color: nightMode ? Colors.white : Colors.black,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          setState(() {
                            _selectedTranslation = 'mJohn';
                            _currentArabicFontSize = 24;
                            _currentTamilFontSize = 20;
                            _selectedTamilFont = 'MuktaMalar';
                            _selectedArabicFont = 'AlQalam';
                            nightMode = false;

                            prefs.setString('selectedTranslation', _selectedTranslation);
                            prefs.setDouble('tamilFontSize', _currentTamilFontSize);
                            prefs.setDouble('arabicFontSize', _currentArabicFontSize);
                            prefs.setString('selectedTamilFont', _selectedTamilFont);
                            prefs.setString('selectedArabicFont', _selectedArabicFont);
                            prefs.setBool('NightMode', nightMode);
                          });
                        },
                        child: const Text('Reset Settings')),
                  ],
                ),
              ),
              const Divider(
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
      _currentTamilFontSize = (prefs.getDouble('tamilFontSize') ?? 20);
      _currentArabicFontSize = (prefs.getDouble('arabicFontSize') ?? 24);
      _selectedTamilFont =
          (prefs.getString('selectedTamilFont') ?? 'MuktaMalar');
      _selectedArabicFont =
          (prefs.getString('selectedArabicFont') ?? 'AlQalam');
      nightMode = (prefs.getBool('NightMode') ?? false);
    });
  }

  @override
  void initState() {
    super.initState();
    loadSelections();
  }
}