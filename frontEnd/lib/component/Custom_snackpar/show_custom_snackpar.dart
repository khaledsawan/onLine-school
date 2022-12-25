import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

void showCustomSnackPar(String massage, String title,
    {Color backGroundColor = Colors.red, Color textColor = Colors.white}) {
  Get.snackbar(title, massage,
      titleText: Text(title,style: const TextStyle(fontSize: 24),),
      messageText: Text(title,style: const TextStyle(fontSize: 20),),
      borderColor: AppColors.white,
      borderWidth: 1,
      duration:const Duration(seconds: 5),
      backgroundColor: backGroundColor.withOpacity(0.6), colorText: textColor,
  );
}
