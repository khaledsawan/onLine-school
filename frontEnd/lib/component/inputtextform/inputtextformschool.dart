import 'package:flutter/material.dart';
import 'package:school/utils/colors.dart';

class InPutTextFormSchool extends StatefulWidget {
  IconData icon;
  String hintText;
  bool isPassword;
  bool isNumber;
  TextAlign? textAlign;
  TextStyle? textStyle;
  bool isCenter;
  double? height;
  EdgeInsets? margin;
  EdgeInsets? padding;
  double? iconSize;
  double? width;
  int? maxLine;
  TextEditingController textEditingController;
  InPutTextFormSchool(
      {Key? key,
      this.isPassword = false,
      this.isNumber = false,
      this.isCenter = false,
      required this.icon,
      this.height = 0,
      this.width = 1,
      this.textAlign = TextAlign.start,
      this.textStyle,
      this.margin = const EdgeInsets.only(left: 4, right: 4),
      this.padding = const EdgeInsets.only(left: 4, right: 4),
      this.iconSize = 24,
      this.maxLine = 1,
      required this.hintText,
      required this.textEditingController})
      : super(key: key);

  @override
  State<InPutTextFormSchool> createState() => _InPutTextFormSchoolState();
}

class _InPutTextFormSchoolState extends State<InPutTextFormSchool> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height != 0 ? widget.height : null,
      alignment: widget.isCenter ? Alignment.center : null,
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.mainColor
            : AppColors.white,
      ),
      child: TextFormField(
        style: widget.textStyle,
        textAlign: widget.textAlign!,
        keyboardType: widget.isNumber ? TextInputType.number : null,
        maxLines: widget.maxLine,
        obscureText: show,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.textEditingController,
        decoration: InputDecoration(

          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  child: const Icon(
                    Icons.remove_red_eye_outlined,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: null,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: AppColors.hintColor),
          prefixIcon: widget.icon != Icons.adb
              ? Padding(
                  padding: widget.maxLine != 1
                      ? const EdgeInsets.only(bottom: 0)
                      : const EdgeInsets.only(bottom: 0),
                  child: widget.icon != Icons.adb
                      ? Icon(
                          widget.icon,
                          size: widget.iconSize,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.textColor
                              : AppColors.mainColor,
                        )
                      : null,
                )
              : null,
        ),
      ),
    );
  }
}
