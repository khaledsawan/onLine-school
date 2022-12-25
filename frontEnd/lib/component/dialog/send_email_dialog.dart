import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

Future<dynamic> sendEmailDialog(
    String title, Color backGroundColor, String middleText, Widget widget) {
  return Get.defaultDialog(
      title: title,
      backgroundColor: backGroundColor,
      titleStyle: const TextStyle(color: AppColors.white, fontSize: 26),
      barrierDismissible: true,
      radius: 10,
      middleTextStyle: const TextStyle(color: AppColors.white, fontSize: 20),
      middleText: middleText,
      content: widget);
}
