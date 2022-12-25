import 'package:flutter/material.dart';
import 'package:school/utils/colors.dart';

class SmallText extends StatelessWidget {
  final String textBody;
  Color? color;
  TextAlign? textAlign;
  double? size;
  int? maxLine;
  double? height;

  SmallText(
      {Key? key,
      required this.textBody,
      this.color = AppColors.hintColor,
      this.size = 12,
      this.textAlign ,
      this.maxLine = 1,
      this.height=0.6})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(

      textBody,
      textAlign: textAlign,
      maxLines: maxLine,

      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size,
        height: height,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}
