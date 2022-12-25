import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class BigText extends StatelessWidget {
  final String textBody;
  double? size;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  double? height;
  int? maxLine;
  TextOverflow textOverflow;
  BigText(
      {Key? key,
      required this.textBody,
      this.maxLine = 2,
      this.textOverflow = TextOverflow.ellipsis,
      this.height = 1.15,
      this.fontWeight = FontWeight.w400,
      this.textAlign = TextAlign.start,
      this.fontStyle = FontStyle.normal,
      this.size = 20})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      textBody,
      textAlign: textAlign,
      maxLines: maxLine,
      style: Theme.of(context).brightness == Brightness.dark
          ? TextStyle(
              fontFamily: 'Roboto',
              fontSize: size,
              height: height,
              fontStyle: fontStyle,
              fontWeight: fontWeight,
              color: AppColors.textColor,
            )
          : TextStyle(
              fontFamily: 'Roboto',
              fontSize: size,
              height: height,
              fontStyle: fontStyle,
              fontWeight: fontWeight,
              color: AppColors.mainColor,
            ),
      overflow: textOverflow,
    );
  }
}
