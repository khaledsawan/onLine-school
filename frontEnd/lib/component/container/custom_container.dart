import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CustomContainer extends StatelessWidget {
  Color? backgroundColor;
  Color borderColor;
  double? height;
  double? width;
  double? radius;
  Alignment? alignment;
  double border;
  Widget? widget;
  CustomContainer({
    Key? key,
    this.backgroundColor = AppColors.white,
    this.borderColor = AppColors.border,
    this.width = 100,
    this.height = 30,
    this.radius = 0,
    this.alignment=Alignment.center,
    this.widget,
    this.border = 1.0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: alignment,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radius == 0
            ? const BorderRadius.all(Radius.circular(0))
            : BorderRadius.all(Radius.circular(radius!)),
        border: Border.all(width: border, color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: widget,
    );
  }
}
