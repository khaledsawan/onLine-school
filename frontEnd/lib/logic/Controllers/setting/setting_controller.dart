import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/component/Custom_snackpar/show_custom_snackPar_red.dart';
import 'package:school/component/Custom_snackpar/show_custom_snackpar_green.dart';
import 'package:school/utils/AppConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../main.dart';
import '../../../service/repository/common repo/auth_repo.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingController extends GetxController {
  late AuthRepo authRepo;
  late SharedPreferences prefs;

  SettingController({required this.prefs, required this.authRepo});

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();
  bool isConnection = true;
  late ThemeMode themeMode;

  @override
  void onInit() {
    super.onInit();
    isDarkMode();
    _connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        showCustomSnackBarRed('You are OffLine', '!');
        isConnection = false;
        update();
      }
    });
    if (prefs.containsKey(AppConstants.NOTIFICATION)) {
      _notifiOn = prefs.getInt(AppConstants.NOTIFICATION) == 1 ? true : false;
    } else {
      _notifiOn = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  bool _notifiOn = true;
  get notifiOn => _notifiOn;

  bool _nightMode = false;
  get nightMode => _nightMode;

  isDarkMode() {
    if (prefs.containsKey(AppConstants.DARK_MODE)) {
      _nightMode = prefs.getBool(AppConstants.DARK_MODE)!;
      themeMode = _nightMode ? ThemeMode.dark : ThemeMode.light;
    } else {
      _nightMode = true;
      themeMode = ThemeMode.system;
    }
    update();
  }

  changeMode(bool val) async {
    Get.changeTheme(
      val ? darkTheme : lightTheme,
    );
    _nightMode = val;
    themeMode = _nightMode ? ThemeMode.dark : ThemeMode.light;
    update();
    await prefs.setBool(AppConstants.DARK_MODE, _nightMode);
    Fluttertoast.showToast(
        msg: 'please Restart your App',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
    );
  }

  changeNotifi(bool val) {
    val
        ? prefs.setInt(AppConstants.NOTIFICATION, 1)
        : prefs.setInt(AppConstants.NOTIFICATION, 0);
    _notifiOn = val;
    update();
  }
}
