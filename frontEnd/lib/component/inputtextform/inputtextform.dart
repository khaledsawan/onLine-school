import 'package:flutter/material.dart';

class InPutTextForm extends StatelessWidget {
  IconData icon;
  Color color;
  Color hintColor;
  String hintText;
  bool isPassword;
  bool isNumber;
  bool isCenter;
  double? height;
  EdgeInsets? margin;
  EdgeInsets? padding;
  double? iconSize;
  double? width;
  int? maxLine;
  TextEditingController textEditingController;
  InPutTextForm(
      {Key? key,
      this.isPassword = false,
      this.isNumber = false,
      this.isCenter = false,
      required this.icon,
      this.height = 1,
      this.width = 1,
      this.margin = const EdgeInsets.only(left: 10, right: 10),
      this.padding = const EdgeInsets.only(left: 10, right: 10),
      this.iconSize = 24,
      this.maxLine = 1,
      required this.hintColor,
      required this.hintText,
      required this.color,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isCenter ? Alignment.center : null,
      height: height == 1 ? null : height,
      width: width == 1 ? null : width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: const Border(left: BorderSide.none),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 8,
                spreadRadius: 1,
                offset: const Offset(0, 4),
                blurStyle: BlurStyle.normal)
          ]),
      child: TextFormField(
        keyboardType: isNumber ? TextInputType.number : null,
        maxLines: maxLine,
        obscureText: isPassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (v) {
        },
        onSaved: (v) {
        },
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.white,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.white,
              )),
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          prefixIcon: Padding(
            padding: maxLine != 1
                ? EdgeInsets.only(bottom: maxLine! * 16.8)
                : const EdgeInsets.only(bottom: 0),
            child: Icon(
              icon,
              size: iconSize,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
