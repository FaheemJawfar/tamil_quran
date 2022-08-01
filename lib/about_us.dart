import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String _selectedTamilFont = 'MeeraInimai';
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
      body: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
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
                    fontSize: 18,
                    fontFamily: 'MeeraInimai'),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '( அரபி மூலமும் தமிழாக்கமும் )',
                style: TextStyle(
                    color: NightMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    fontFamily: 'MeeraInimai'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'மொழிபெயர்ப்புகள் : '
                '\n1. ஜான் டிரஸ்ட் (John Trust)'
                '\n2. மன்னர் பஹத் குர்ஆன் வளாகம் (சவூதி)'
                '\n3. பீ. ஜைனுலாப்தீன் (PJ)'
                '\n4. இஸ்லாமிய நிறுவனம் அறக்கட்டளை (IFT)'
                '\n5. அப்துல் ஹமீது பாகவி',
                style: TextStyle(
                    color: NightMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    fontFamily: 'MuktaMalar'),
                textAlign: TextAlign.start,
              ),
              Divider(),
              SizedBox(
                height: 40,
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
              Divider(),
              SizedBox(
                height: 60,
              ),
              Text(
                '"உங்களில் சிறந்தவர் திருக்குர்ஆனைத் \nதானும் கற்று அதை பிறருக்கு கற்றுக் கொடுத்தவராவார்." \n\n- முஹம்மது நபி(ஸல்)\n(ஆதாரம்: புகாரி - 5028)',
                style: TextStyle(
                  fontFamily: 'AnekTamil',
                  fontSize: 15,
                  color: NightMode ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
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
      _selectedTamilFont =
          (prefs.getString('selectedTamilFont') ?? 'MeeraInimai');
      NightMode = (prefs.getBool('NightMode') ?? false);
    });
  }

  @override
  void initState() {
    super.initState();
    loadSelections();
  }
}
