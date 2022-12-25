import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school/component/text/big_text.dart';

import '../../utils/colors.dart';


class CustomButton extends StatelessWidget {
  late Callback? onPressed;
  late String buttonText;
  late double? width;
  late double? height;
  late double? fontSize;
  late double radius;
  late IconData? icon;
  late EdgeInsets? margin;
  late EdgeInsets? padding;
  late bool transparent;

  CustomButton(
      {Key? key,
      required this.buttonText,
      this.onPressed,
      this.width=50,
      this.height=50,
      this.fontSize,
      this.icon,
      this.margin,
      this.padding,
      this.transparent = false,
      this.radius = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: radius,
      onTap: (){
        onPressed!();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark?AppColors.mainColor:AppColors.white,
          border: Border.all(width: 2,color: AppColors.border),
              borderRadius: BorderRadius.circular(radius),

        ),
        child: Center(
          child: BigText(textBody: buttonText,size: 24,fontWeight: FontWeight.w500,),
        )    ),
    );
  }
}
