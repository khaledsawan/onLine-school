import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../bottom_sheet/show_bottom_sheet_image.dart';
import '../text/small_text.dart';

Widget takeImageLayout(
    String text, dynamic controller, context, double width, double height) {
  return controller.imageName == ''
      ? GestureDetector(
          onTap: () {
            showBottomSheetImage(context, controller);
          },
          child: Container(
            width: width-20 ,
            height: height * 0.35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 3, color: AppColors.border),
               ),
            child: Column(
              children: [
                SizedBox(
                    height: height * 0.3,
                    child: const Icon(
                      Icons.add_a_photo,
                      size: 100,
                      color: AppColors.innerShadow,
                    )),
                SmallText(
                  color: AppColors.hintColor,
                  textBody: text,
                  size: 16,
                )
              ],
            ),
          ),
        )
      : Container(
        alignment: Alignment.topRight,

        height: height * 0.35,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: AppColors.mainColor),
          image: DecorationImage(
              image: FileImage(controller.file), fit: BoxFit.fill),
        ),
        child:  GestureDetector(
          onTap: () {
            controller.clearImage();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Icon(
                  Icons.close,
                  size: 35,
                  color: AppColors.textColor,
                ),
                Text(
                  'أزالة'.tr,
                  style: const TextStyle(
                      color: AppColors.textColor, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      );
}
