import '../app_texts/app_helpers_texts.dart';
import '../app_config/app_config.dart';
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
      path: AppHelpersTexts.mailTo,
      query: encodeQueryParameters(<String, String>{
        'subject': AppHelpersTexts.mailSubject,
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
    const appId = AppConfig.appId;

    try {
      await launchUrlString("market://details?id=$appId");
    } catch (e) {
      throw 'Could not launch ${e.toString()}';
    }
  }


  static void launchWebpage(String url) async {
    final stringUrl = Uri.parse(url);
    try {
      await launchUrl(stringUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      throw 'Could not launch ${e.toString()}';
    }
  }

  void openWhatsApp() async {
    const phoneNumber = AppConfig.whatsAppContactNumber;

    try {
      await launchUrlString('whatsapp://send?phone=$phoneNumber');
    } catch (e) {
     rethrow;
    }
  }
}