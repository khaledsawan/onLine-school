import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

Future<dynamic> defaultDialog(
    String title, Color backGroundColor, String middleText, Widget widget) {
  return Get.defaultDialog(
      title: title,
      backgroundColor: backGroundColor,
      titleStyle: const TextStyle(color: AppColors.white, fontSize: 28),
      barrierDismissible: true,
      radius: 12,
      middleTextStyle: const TextStyle(color: AppColors.white, fontSize: 20),
      middleText: middleText,
      content: null);
}
