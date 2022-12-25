import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school/component/Custom_snackpar/show_custom_snackpar_green.dart';
import 'package:school/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../logic/Controllers/student/student_profile_controller.dart';
import '../../logic/Controllers/teacher/teacher_profile_controller.dart';
import '../../service/repository/common repo/auth_repo.dart';
import '../../utils/AppConstants.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool _a = false;
  bool intro = false;

  void isIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    intro = prefs.containsKey(AppConstants.INTRO);
    intro
        ? {
            (Connectivity().checkConnectivity()).then((result) {
              if (result == ConnectivityResult.mobile) {
                showCustomSnackParGreen(
                    'Dont forget you are Using mobile data'.tr, 'Mention'.tr);
              }
              if (result != ConnectivityResult.none) {
                if (Get.find<AuthRepo>().isAuth()) {
                  String role = Get.find<AuthRepo>().roleIs();
                  if (role == 'student') {
                    Timer(const Duration(milliseconds: 2000), () {
                      Get.offAllNamed(AppRoutes.studentmain);
                      Get.find<StudentProfileController>().getProfile();
                    });
                  } else if (role == 'admin') {
                    Timer(const Duration(milliseconds: 2000), () {
                      Get.offAllNamed(AppRoutes.adminmainpage);
                    });
                  } else {
                    Timer(const Duration(milliseconds: 2000), () {
                      Get.find<TeacherProfileController>().getProfile();
                      Get.offAllNamed(AppRoutes.teachercourses);
                    });
                  }
                } else {
                  Timer(const Duration(milliseconds: 2000), () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.studentloginviewm);
                  });
                }
              } else {

                showCustomSnackParGreen(
                    'You are offline,connect to internet than restart the App'
                        .tr,
                    'Mention'.tr);
                Get.toNamed(AppRoutes.offlinepage);
              }
            })
          }
        : Get.offNamed(AppRoutes.introscreen);
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 700), () {
      setState(() {
        _a = !_a;
      });
      // isIntro();
      (Connectivity().checkConnectivity()).then((result) {
        if (result == ConnectivityResult.mobile) {
          showCustomSnackParGreen(
              'Dont forget you are Using mobile data'.tr, 'Mention'.tr);
        }
        if (result != ConnectivityResult.none) {
          if (Get.find<AuthRepo>().isAuth()) {
            String role = Get.find<AuthRepo>().roleIs();
            if (role == 'student') {
              Timer(const Duration(milliseconds: 2000), () {
                Get.offAllNamed(AppRoutes.studentmain);
                Get.find<StudentProfileController>().getProfile();
              });
            } else
              if (role == 'admin') {
              Timer(const Duration(milliseconds: 2000), () {
                Get.offAllNamed(AppRoutes.adminmainpage);
              });
            } else {
              Timer(const Duration(milliseconds: 2000), () {
                Get.find<TeacherProfileController>().getProfile();
                Get.offAllNamed(AppRoutes.teachercourses);
              });
            }
          } else {
            Timer(const Duration(milliseconds: 2000), () {
              Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.adminloginpage);
            });
          }
        } else {

          showCustomSnackParGreen(
              'You are offline,connect to internet than restart the App'
                  .tr,
              'Mention'.tr);
          Get.toNamed(AppRoutes.offlinepage);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.fastLinearToSlowEaseIn,
            width: _a ? width : 0,
            height: height,
            color: Colors.black,
          ),
          Center(
            child: Text(
              'Online School',
              style: GoogleFonts.peralta(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideTransitionAnimation extends PageRouteBuilder {
  final Widget page;

  SlideTransitionAnimation(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
              );
              return SlideTransition(
                position: Tween(
                        begin: const Offset(1.0, 0.0),
                        end: const Offset(0.0, 0.0))
                    .animate(animation),
                textDirection: TextDirection.rtl,
                child: page,
              );
            });
}
