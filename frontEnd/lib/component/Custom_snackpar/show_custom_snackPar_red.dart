import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBarRed(String massage, String title,
    {Color backGroundColor = Colors.red, Color textColor = Colors.white}) {
  Get.snackbar(title, massage,
      backgroundColor: backGroundColor, colorText: textColor);
}
