import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../container/custom_container.dart';
import '../text/big_text.dart';

Future<dynamic> confirmDialog(String title, Color backGroundColor,
    Widget widget, Function() confirm, Function() cancel) {
  return Get.defaultDialog(
      title: title,
      backgroundColor: backGroundColor,
      titleStyle: const TextStyle(color: AppColors.textColor, fontSize: 24),
      barrierDismissible: true,
      radius: 15,
      cancel: GestureDetector(
        onTap:(){
          cancel();
        },
        child: CustomContainer(
          radius: 8,
          border: 2,
          borderColor: AppColors.innerShadow,
          backgroundColor: AppColors.mainColor,
          widget:const Center(child: Text('Cancel',style: TextStyle(color: AppColors.white),)),
        ),
      ),
      confirm: GestureDetector(
        onTap: () {
          confirm();
        },
        child: CustomContainer(
          radius: 8,
          border: 2,
          borderColor: AppColors.innerShadow,
          backgroundColor: AppColors.red,
          widget: Center(
              child: BigText(
            textBody: 'Confirm',
          )),
        ),
      ),
      contentPadding: const EdgeInsets.all(8),
      content: widget);
}
