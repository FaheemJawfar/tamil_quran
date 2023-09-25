import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Launcher {

  static void launchEmail(String body) async {

    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'faheemjawfar@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Tamil Quran App - Feedback',
        'body': body,
      }),
    );

    try {
      await launchUrl(emailLaunchUri);
    } catch(e) {
      throw 'Could not launch $e';
    }
  }


  static void launchPlayStore() async {
    const appId = 'com.faheemapps.tamil_quran';

    try {
      await launchUrlString("market://details?id=$appId");
    } catch (e) {
      throw 'Could not launch ${e.toString()}';
    }
  }


  static void launchWebpage(String url) async {
    try {
      await launchUrlString(url);
    } catch (e) {
      throw 'Could not launch ${e.toString()}';
    }
  }

  void openWhatsApp() async {
    const phoneNumber = '94774106399';

    try {
      await launchUrlString('whatsapp://send?phone=$phoneNumber');
    } catch (e) {
     rethrow;
    }
  }
}