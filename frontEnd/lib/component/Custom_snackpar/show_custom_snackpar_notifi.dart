import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

void showCustomSnackParNotifi(String massage, String title,String image,
    {Color backGroundColor = Colors.red, Color textColor = Colors.white}) {
  Get.snackbar(title, massage,
    titleText: Row(
      children: [
         Padding(
          padding:const EdgeInsets.all(4.0),
          child: CircleAvatar(backgroundImage: NetworkImage(image),radius: 25,),
        ),
        const SizedBox(width: 4,),
        Text(title,style: const TextStyle(fontSize: 24),),
      ],
    ),
    messageText: Text(massage,style: const TextStyle(fontSize: 18),),
    borderColor: AppColors.blue,
    borderWidth: 1,
    duration:const Duration(seconds: 5),
    backgroundColor:  AppColors.bluegra.withOpacity(0.6), colorText: textColor,
    snackStyle: SnackStyle.FLOATING
  );
}
