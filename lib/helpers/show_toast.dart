import 'package:flutter/material.dart';

class ShowToast {

  static void showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center,),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}