import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school/logic/Controllers/notifi/notifi_controller.dart';
import 'package:school/logic/Controllers/setting/setting_controller.dart';
import 'package:school/routes/routes.dart';
import 'package:school/utils/AppConstants.dart';
import 'package:school/utils/colors.dart';
import 'package:school/utils/langs/translations.dart';
import 'package:sizer/sizer.dart';
import 'component/Custom_snackpar/show_custom_snackpar_notifi.dart';
import 'firebase_options.dart';
import 'init/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  NotifiController controller = Get.find<NotifiController>();
  SettingController settingController = Get.find<SettingController>();

  if (settingController.notifiOn) {
    late String image;
    late int teacherId;
    FirebaseMessaging.onBackgroundMessage(
        controller.firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        message.data.forEach((key, value) {
          if (key == 'image') {
            image = value;
          }
          if (key == 'teacher_id') {
            teacherId = int.parse(value);
          }
        });
        showCustomSnackParNotifi(
            message.notification!.body!,
            message.notification!.title!,
            '${AppConstants.BASE_URL}$image',
            backGroundColor: AppColors.bluegra);
        String notificationData = json.encode({"title":   message.notification!.title!,"body":  message.notification!.body!,"image":  image,"teacher_id":  teacherId});
        controller.addToList(notificationData);
        settingController.prefs.setStringList(AppConstants.NOTIFICATION_LIST,   controller.detail);
      }
    });
  }
  runApp(const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            translations: Translation(),
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en'),
            localizationsDelegates: const [],
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: Get.find<SettingController>().themeMode,
            getPages: AppRoutes.routes,
            initialRoute: AppRoutes.splashscreen,
            );
      },
    );
  }
}

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(color: AppColors.mainColor),
    textTheme:
    const TextTheme(headline2: TextStyle(color: AppColors.textColor)),
    backgroundColor: AppColors.mainColor,
    iconTheme: const IconThemeData(color: AppColors.iconColor),
    primaryIconTheme: const IconThemeData(color: AppColors.iconColor),
    brightness: Brightness.dark,
    progressIndicatorTheme:
    const ProgressIndicatorThemeData(color: AppColors.blue),
    scaffoldBackgroundColor: AppColors.mainColor,
    primaryColor: AppColors.mainColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.mainColor,
      disabledColor: Colors.grey,
    ));

ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: AppColors.white),
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: AppColors.mainColor),
    primaryIconTheme: const IconThemeData(color: AppColors.mainColor),
    primaryColor: AppColors.white,
    backgroundColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.mainColor,
      disabledColor: Colors.grey,
    ));
