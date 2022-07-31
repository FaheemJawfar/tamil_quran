
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  String? _selectedTranslation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('அமைப்புகள்'),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),

      body:
      
      SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(12),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('மொழிபெயர்ப்பைத் தெரிவு செய்யுங்கள்:',style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),),
                ListTile(
                  visualDensity: VisualDensity(vertical: -4),
                  horizontalTitleGap: 1,
                 contentPadding: EdgeInsets.only(top: 2,bottom: 2),
                  leading: Radio<String>(
                    value: 'mJohn',
                    groupValue: _selectedTranslation,
                    onChanged: (value) async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      setState(() {
                        _selectedTranslation = value!;
                        prefs.setString('selectedTranslation', value);
                      });
                    },
                  ),
                  title: const Text('ஜான் அறக்கட்டளை (John Trust)',style: TextStyle(
                    fontSize: 14,
                  ),),
                ),

                ListTile(
                  visualDensity: VisualDensity(vertical: -4),
                  horizontalTitleGap: 1,
                  contentPadding: EdgeInsets.only(top: 2,bottom: 2),
                  leading: Radio<String>(
                    value: 'kingFahd',
                    groupValue: _selectedTranslation,
                    onChanged: (value) async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      setState(() {
                        _selectedTranslation = value!;
                        prefs.setString('selectedTranslation', value);
                      });
                    },
                  ),
                  title: const Text('மன்னர் பஹத் வளாகம் (சவூதி)',style: TextStyle(
                    fontSize: 14,
                  ),),
                ),


                ListTile(
                  visualDensity: VisualDensity(vertical: -4),
                  horizontalTitleGap: 1,
                  contentPadding: EdgeInsets.only(top: 2,bottom: 2),
                  leading: Radio<String>(
                    value: 'pj',
                    groupValue: _selectedTranslation,
                    onChanged: (value) async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      setState(() {
                        _selectedTranslation = value!;
                        prefs.setString('selectedTranslation', value);
                      });
                    },
                  ),
                  title: const Text('பீ. ஜைனுலாப்தீன் (PJ)',style: TextStyle(
                    fontSize: 14,
                  ),),
                ),

                ListTile(
                  visualDensity: VisualDensity(vertical: -4),
                  horizontalTitleGap: 1,
                  contentPadding: EdgeInsets.only(top: 2,bottom: 2),
                  leading: Radio<String>(
                    value: 'ift',
                    groupValue: _selectedTranslation,
                    onChanged: (value) async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      setState(() {
                        _selectedTranslation = value!;
                        prefs.setString('selectedTranslation', value);
                      });
                    },
                  ),
                  title: const Text('இஸ்லாமிய நிறுவனம் அறக்கட்டளை (IFT)',style: TextStyle(
                    fontSize: 14,
                  ),),
                ),

                ListTile(
                  visualDensity: VisualDensity(vertical: -4),
                  horizontalTitleGap: 1,
                  contentPadding: EdgeInsets.only(top: 2,bottom: 2),
                  leading: Radio<String>(
                    value: 'abdulHameed',
                    groupValue: _selectedTranslation,
                    onChanged: (value) async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      setState(() {
                        _selectedTranslation = value!;
                        prefs.setString('selectedTranslation', value);
                      });
                    },
                  ),
                  title: const Text('அப்துல் ஹமீது பாகவி',style: TextStyle(
                    fontSize: 14,
                  ),),
                ),

              ],

            ),
          ),
        ),
    );
  }

  void loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedTranslation = (prefs.getString('selectedTranslation')?? 'mJohn');
    });
  }


  @override
  void initState(){
    super.initState();
    loadCounter();
  }


}
