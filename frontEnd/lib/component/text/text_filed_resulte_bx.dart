import 'package:flutter/material.dart';

import '../../utils/colors.dart';
class TextField_resultBx extends StatelessWidget {
  const TextField_resultBx({
    Key? key,

    required this.borderLabelTextBox,
    required this.displayBoxResult,
  }) : super(key: key);

  final String borderLabelTextBox;
  final String displayBoxResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          TextField(
            // enabled: true,
            readOnly: true,
            style: const TextStyle(
             // color: kCalLabelColor,
            ),
            decoration: InputDecoration(
              enabled: true,
              contentPadding: const EdgeInsets.all(12.0),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // Border Label TextBox 1
              labelText: borderLabelTextBox,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.blue,
              ),
              hintText: displayBoxResult,

              hintMaxLines: 2,
              hintStyle: const TextStyle(
                color:AppColors.white,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.border, width: 1.0),
              //  borderSide: kEnbBorderSide,
              //  borderRadius: kCalOutlineBorderRad,
              ),
            //  focusedBorder: kFocusedBorder,
            ),
          ),
        ],
      ),
    );
  }
}