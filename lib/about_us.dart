import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us.'),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        color: Colors.green[100],
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              const Text(
                'திருக்குர்ஆன்',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'MeeraInimai'),
              ),
              SizedBox(
                height: 5,
              ),
              const Text(
                '( அரபி மூலமும் தமிழாக்கமும் )',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    fontFamily: 'MeeraInimai'),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'மொழிபெயர்ப்புகள் : '
                    '\n1. ஜான் டிரஸ்ட் (John Trust)'
                    '\n2. மன்னர் பஹத் குர்ஆன் வளாகம் (சவூதி)'
                    '\n3. பீ. ஜைனுலாப்தீன் (PJ)'
                    '\n4. இஸ்லாமிய நிறுவனம் அறக்கட்டளை (IFT)'
                    '\n5. அப்துல் ஹமீது பாகவி',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    fontFamily: 'MuktaMalar'),
                textAlign: TextAlign.start,
              ),
              Divider(),
              SizedBox(
                height: 40,
              ),
              const Text(
                'Tamil Quran App Developed by:',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 5,
              ),
       const          Text(
                'Faheem J.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Divider(),
              SizedBox(
                height: 60,
              ),
              const Text(
                '"உங்களில் சிறந்தவர் திருக்குர்ஆனைத் \nதானும் கற்று அதை பிறருக்கு கற்றுக் கொடுத்தவராவார்." \n\n- முஹம்மது நபி(ஸல்)\n(ஆதாரம்: புகாரி - 5028)',
                style: TextStyle(fontFamily: 'AnekTamil', fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
