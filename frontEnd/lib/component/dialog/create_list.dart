import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/inputtextform/inputtextformschool.dart';
import '../../utils/colors.dart';
import '../container/custom_container.dart';
import '../text/big_text.dart';

Future<dynamic> createList(
    String title,
    Color backGroundColor,
    TextEditingController textEditingController,
    Function confirm,
    Function cancel) {
  return Get.defaultDialog(

      title: title,
      backgroundColor:Get.isDarkMode? AppColors.mainColor: AppColors.white,
      titleStyle:  TextStyle(
        color:Get.isDarkMode? AppColors.white: AppColors.black,
        fontSize: 22,
      ),
      barrierDismissible: true,
      radius: 16,
      cancel: GestureDetector(
        onTap: (){
          cancel();
        },
        child: CustomContainer(
          width: Get.width * 0.3,
          height: 40,
          radius: 8,
          border: 1,
          borderColor: AppColors.innerShadow,
          backgroundColor: Get.isDarkMode? AppColors.mainColor: AppColors.white,
          widget: Center(
              child: BigText(
            textBody: 'Cancel',
          )),
        ),
      ),
      confirm: GestureDetector(
        onTap: (){
          confirm();
        },
        child: CustomContainer(
          width: Get.width * 0.3,
          height: 40,
          radius: 8,
          border: 1,
          borderColor: AppColors.innerShadow,
          backgroundColor: AppColors.green,
          widget: Center(
              child: BigText(

            textBody: 'Confirm',
          )),
        ),
      ),
      content: InPutTextFormSchool(

          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(0),
          icon: Icons.list,
          hintText: 'Title',
          textEditingController: textEditingController));
}
