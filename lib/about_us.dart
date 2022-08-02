import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String _selectedTamilFont = 'MuktaMalar';
  bool NightMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NightMode ? Colors.grey[900] : Colors.green[100],
      appBar: AppBar(
        title: Text('About Us.'),
        backgroundColor: NightMode ? Colors.black : Colors.green[900],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'திருக்குர்ஆன்',
                  style: TextStyle(
                      color: NightMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: _selectedTamilFont),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '( அரபி மூலமும் தமிழாக்கமும் )',
                  style: TextStyle(
                      color: NightMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      fontFamily: _selectedTamilFont),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'மொழிபெயர்ப்புகள் : ',
                  style: TextStyle(
                      color: NightMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      fontFamily: _selectedTamilFont),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '1. ஜான் டிரஸ்ட் (John Trust)'
                  '\n2. மன்னர் பஹத் குர்ஆன் வளாகம் (சவூதி)'
                  '\n3. பீ. ஜைனுலாப்தீன் (PJ)'
                  '\n4. இஸ்லாமிய நிறுவனம் அறக்கட்டளை (IFT)'
                  '\n5. அப்துல் ஹமீது பாகவி',
                  style: TextStyle(
                      color: NightMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      fontFamily: _selectedTamilFont),
                  textAlign: TextAlign.start,
                ),
                Divider(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Tamil Quran App Developed by:',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: NightMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Faheem J.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: NightMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '"உங்களில் சிறந்தவர் திருக்குர்ஆனைத் \nதானும் கற்று அதை பிறருக்கு கற்றுக் கொடுத்தவராவார்." \n\n- முஹம்மது நபி(ஸல்)\n(ஆதாரம்: புகாரி - 5028)',
                  style: TextStyle(
                    fontFamily: _selectedTamilFont,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: NightMode ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loadSelections() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedTamilFont =
          (prefs.getString('selectedTamilFont') ?? 'MuktaMalar');
      NightMode = (prefs.getBool('NightMode') ?? false);
    });
  }

  @override
  void initState() {
    super.initState();
    loadSelections();
  }
}
