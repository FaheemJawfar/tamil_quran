import 'dart:io';

import 'package:tamil_quran/utils/device_information.dart';

import '../app_texts/utils_texts.dart';
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
      path: UtilsTexts.mailTo,
      query: encodeQueryParameters(<String, String>{
        'subject': UtilsTexts.mailSubject,
        'body': body,
      }),
    );

    try {
      await launchUrl(emailLaunchUri);
    } catch(e) {
      throw 'Could not launch $e';
    }
  }


  static void launchPlayStoreAppPage() async {
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

  static void launchWhatsApp() async {
    const phoneNumber = AppConfig.whatsAppContactNumber;

    try {
      await launchUrlString('whatsapp://send?phone=$phoneNumber');
    } catch (e) {
     rethrow;
    }
  }


  static Future<void> findDeviceModelAndLaunchAppStore() async {
    if (Platform.isAndroid) {
      bool isHuawei = await DeviceInformation.isHuaweiDevice();
      if(isHuawei){
        launchWebpage(AppConfig.huaweiAppGalleryUrl);
      } else {
        launchPlayStoreAppPage();
      }
  }
    else if (Platform.isIOS){
    }
  }
}