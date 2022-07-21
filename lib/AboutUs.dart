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
        padding: EdgeInsets.all(15),
        height: double.infinity,
        color: Colors.grey[300],
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/quran_icon.png'),
                  radius: 40,
                  backgroundColor: Colors.green[600],
                ),
                SizedBox(height: 5,),
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
                  'மொழிபெயர்ப்பு : \nமுஹம்மது ஜான் டிரஸ்ட்',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      fontFamily: 'MeeraInimai'),
                  textAlign: TextAlign.center,
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
      ),
    );
  }
}
