//SfDateRangePicker()
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../utils/colors.dart';

Future<dynamic> ChoseTimeDialog(
    String title, Color backGroundColor,dynamic controller) {
  return Get.defaultDialog(
      title: title,
      backgroundColor: backGroundColor,
      titleStyle: const TextStyle(color: AppColors.white, fontSize: 28),
      barrierDismissible: true,
      radius: 12,
      content: SizedBox(
        height: 220,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime:    DateTime.now(),
          onDateTimeChanged: (DateTime newDateTime) {
            controller.updateTime(newDateTime);
          },
        ),
      ),);
}
