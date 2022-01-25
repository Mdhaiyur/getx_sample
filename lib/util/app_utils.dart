import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  showSnackbar({required String msg, required String snackbarTitle}) {
    Get.showSnackbar(GetSnackBar(
      title: snackbarTitle,
      message: msg,
      isDismissible: true,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
    ));
  }
}
