import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../utils/colors.dart';

Widget notificationSwitch(dynamic controller){
  return
    FlutterSwitch(
      width: 55.0,
      height: 30.0,
      toggleSize: 20.0,
      value: controller.notifiOn,
      borderRadius: 15.0,
      padding: 1.0,
      activeToggleColor: AppColors.blue,
      inactiveToggleColor: AppColors.purple,
      activeSwitchBorder: Border.all(
        color: AppColors.border,
        width: 2.0,
      ),
      inactiveSwitchBorder: Border.all(
        color: AppColors.border,
        width: 2.0,
      ),
      activeColor: AppColors.purple,
      inactiveColor: AppColors.purple,
      activeIcon: const Icon(Icons.circle_rounded),
      inactiveIcon: const Icon(Icons.circle_rounded),
      onToggle: (val) {
        print(val);
        controller.changeNotifi(val);
      },
    );
}