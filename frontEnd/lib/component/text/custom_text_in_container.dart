import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'big_text.dart';

class CustomTextInContainer extends StatelessWidget {
  Color? backgroundColor;
  Color? textColor;
  TextAlign? textAlign;
  EdgeInsets? padding;
  EdgeInsets? mirgin;
  Color? borderColor;
  double? height;
  double? textHeight;
  double? border;
  IconData? icon;
  double? width;
  double? textSize;
  int? maxLine;
  String text;
  Alignment alignment;
  CustomTextInContainer({
    Key? key,
    this.backgroundColor = AppColors.white,
    this.textSize,
    this.width = 150,
    this.icon = Icons.adb,
    this.height = 1,
    this.border = 1,
    this.textAlign = TextAlign.start,
    this.padding = const EdgeInsets.all(8),
    this.mirgin = const EdgeInsets.all(8),
    this.textHeight = 1.3,
    this.alignment = Alignment.center,
    this.textColor = AppColors.textColor,
    this.borderColor = AppColors.border,
    required this.text,
    this.maxLine = 1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      alignment: alignment,
      padding: padding,
      margin: mirgin,
      height: height == 1 ? null : height,
      width: width,
      decoration: BoxDecoration(
        color: isDark ? AppColors.mainColor : AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(width: border!, color: borderColor!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon == Icons.adb
              ? Container()
              : Icon(
                  icon,
                  size: 28,
                ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: BigText(
              textOverflow: TextOverflow.ellipsis,
              textAlign: textAlign,
              height: textHeight,
              maxLine: maxLine,
              textBody: text,
              size: textSize,
            ),
          ),
        ],
      ),
    );
  }
}
