import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../App_Icons/app_icons.dart';
import '../text/big_text.dart';

class IconThanTextContainer extends StatelessWidget {
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
  IconThanTextContainer(
      {Key? key,
        this.width,
        this.height,
        this.iconSize=27,
        this.sizedWidth=15,
        this.iconColor=AppColors.mainColor,
        this.margin=const EdgeInsets.only(left: 0,right:0),
        this.padding=const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
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
         color: color,
       borderRadius: BorderRadius.circular(6),
       boxShadow: [
         BoxShadow(
           color: Colors.black.withOpacity(0.2),
           blurRadius: 6,
           spreadRadius: 0,
         ),
       ],

     ),

      child: Row(
        children: [
          Icon(icon,size: 26,color: iconColor,),
          SizedBox(
            width: sizedWidth,
          ),
          Text(text,style: TextStyle(color: textColor,fontSize: 18,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
