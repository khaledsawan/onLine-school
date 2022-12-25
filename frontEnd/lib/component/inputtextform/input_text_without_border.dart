import 'package:flutter/material.dart';
import 'package:school/utils/colors.dart';
class InPutTextWithOutBorder extends StatefulWidget {
  String hintText;
  bool isPassword;
  bool isNumber;
  TextAlign? textAlign;
  TextStyle? textStyle;
  TextStyle? hintStyle;
  bool isCenter;
  double? height;
  EdgeInsets? margin;
  EdgeInsets? padding;
  double? iconSize;
  double? width;
  int? maxLine;
  TextEditingController textEditingController;
  InPutTextWithOutBorder(
      {Key? key,
        this.isPassword = false,
        this.isNumber = false,
        this.isCenter = false,
        this.height = 0,
        this.width = 1,
        this.textAlign=TextAlign.start,
        this.textStyle,
        this.hintStyle,
        this.margin = const EdgeInsets.only(left: 4, right: 4),
        this.padding = const EdgeInsets.only(left: 10, right: 10),
        this.iconSize = 24,
        this.maxLine = 1,
        required this.hintText,
        required this.textEditingController})
      : super(key: key);

  @override
  State<InPutTextWithOutBorder> createState() => _InPutTextFormSchoolState();
}

class _InPutTextFormSchoolState extends State<InPutTextWithOutBorder> {
  bool show=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:widget.height!=0? widget.height:null,
      alignment: widget.isCenter ? Alignment.center : null,
      margin: widget.margin,
      padding: widget.padding,

      child: TextFormField(

        style: widget.textStyle,
        textAlign: widget.textAlign!,
        keyboardType: widget.isNumber ? TextInputType.number : null,
        maxLines: widget.maxLine,
        obscureText: show,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (v) {},
        onSaved: (v) {},
        controller: widget.textEditingController,

        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon:widget.isPassword? GestureDetector(
            onTap: (){
              setState(() {
                show = !show;
              });
            },
            child: const Icon(
              Icons.remove_red_eye_outlined,
            ),
          ):null,

          //disabledBorder: null,
          alignLabelWithHint: true,

          hintText: widget.hintText,
          hintStyle:  widget.hintStyle,

        ),
      ),
    );
  }
}



