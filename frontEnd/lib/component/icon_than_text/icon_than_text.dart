import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../App_Icons/app_icons.dart';
import '../text/big_text.dart';

class IconThanText extends StatelessWidget {
  IconData icon;
  double? width;
  double? iconSize;
  double? sizedWidth;
  double? leftPadding;
  double? height;
  EdgeInsets? margin;
  EdgeInsets? padding;
  int? maxLine;
  Color color;
  Color textColor;
  Color? iconColor;
  String text;
  IconThanText(
      {Key? key,
      this.width,
      this.height,
      this.iconSize=27,
      this.sizedWidth=5,
      this.iconColor=AppColors.iconColor,
      this.margin=const EdgeInsets.only(left: 8,right: 8),
      this.padding=const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      this.maxLine,
      required this.icon,
      required this.text,
      required this.color,
      this.textColor = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding:  padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.mainColor),
          color:Get.isDarkMode? AppColors.mainColor:AppColors.white,
    ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIcons(
              icon: icon,
            //  containerSize: 30,
              iconSize: iconSize!,
              backgruondcolor:Get.isDarkMode? AppColors.mainColor:AppColors.white,
              iconColor: iconColor!,
            ),
             SizedBox(
              width: sizedWidth,
            ),
            BigText(
              maxLine: maxLine,
              textBody: text,
            ),
          ],
        ),
      ),
    );
  }
}
