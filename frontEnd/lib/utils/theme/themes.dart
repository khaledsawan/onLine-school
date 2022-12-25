import 'package:flutter/material.dart';

import '../colors.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: AppColors.mainColor,
    buttonColor: Colors.blue,
  );

  ThemeData dark = ThemeData(
      accentColor: Colors.red,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.grey,
      backgroundColor: Colors.grey,
      primaryColor: Colors.amber,
      buttonColor: Colors.amber,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey,
          color: Colors.grey,
          foregroundColor: Colors.grey),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));
}
