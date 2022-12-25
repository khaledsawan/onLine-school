import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import 'big_text.dart';

class TextInContainer extends StatelessWidget {
  Color? backgroundColor;
  Color? textColor;
  Color? begin;
  Color? end;
  Color? borderColor;
  double? height;
  double? textHeight;
  double? border;
  IconData? icon;
  double? width;
  double? textSize;
  int? maxLine;
  String text;
  bool isCenter;
  TextInContainer({
    Key? key,
    this.backgroundColor = AppColors.white,
    this.textSize,
    this.width = 100,
    this.icon = Icons.adb,
    this.height = 30,
    this.border = 1,
    this.textHeight = 1.2,
    this.isCenter = false,
    this.textColor = AppColors.textColor,
    this.begin = AppColors.textColor,
    this.end = AppColors.textColor,
    this.borderColor = AppColors.border,
    required this.text,
    this.maxLine = 1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isCenter ? Alignment.center : null,
      padding: const EdgeInsets.all(4),
      width: width,
      height: height,
      decoration: BoxDecoration(
        //  color: backgroundColor,
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            begin!,
            end!,
          ],
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: border!, color: borderColor!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          BigText(
            textAlign: icon==Icons.adb?TextAlign.center:null,
            height: textHeight,
            maxLine: maxLine,
            textBody: text,
            size: textSize,
          ),
          icon==Icons.adb? Container():Icon(Icons.arrow_right,size:30,)
        ],
      ),
    );
  }
}
