import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class DeviceInformation {

  static Future<bool> isHuaweiDevice() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo;

    try {
      androidInfo = await deviceInfo.androidInfo;
    } catch (e) {
      debugPrint("Error getting device info: $e");
      return false;
    }

    // Check the device brand
    if (androidInfo.brand.toLowerCase() == "huawei") {
      return true;
    } else {
      return false;
    }
  }
}