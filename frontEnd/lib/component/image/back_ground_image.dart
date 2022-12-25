import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class BackGroundImage extends StatelessWidget {
  String image;
  Widget widget;
  BackGroundImage({
    Key? key,
    required this.image,
    required this.widget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode ? AppColors.mainColor : AppColors.white,
        image: DecorationImage(
            opacity: 0.3, image: AssetImage(image), fit: BoxFit.fill),
      ),
      child: widget,
    );
  }
}
