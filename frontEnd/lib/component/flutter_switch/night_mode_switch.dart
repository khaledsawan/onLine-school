import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../utils/colors.dart';

Widget nightModeSwitch(dynamic controller){
  return
    FlutterSwitch(
      width: 55.0,
      height: 30.0,
      toggleSize: 20.0,
      value: controller.nightMode,
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
      activeIcon: const Icon(Icons.mode_night),
      inactiveIcon: const Icon(Icons.sunny),
      onToggle: (val) {
        controller.changeMode(val);
      },
    );
}