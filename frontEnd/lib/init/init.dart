
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school/logic/Controllers/teacher/teacher_login_controller.dart';
import 'package:school/service/repository/teacher/teacher_video_repo.dart';
import '../logic/Controllers/admin/admin_ad_controller.dart';
import '../logic/Controllers/admin/admin_auth_controller.dart';
import '../logic/Controllers/admin/admin_category_controller.dart';
import '../logic/Controllers/admin/admin_student_controller.dart';
import '../logic/Controllers/admin/admin_teacher_controller.dart';
import '../logic/Controllers/admin/admin_teacher_course_controller.dart';
import '../logic/Controllers/notifi/notifi_controller.dart';
import '../logic/Controllers/student/student_ad_controller.dart';
import '../logic/Controllers/student/student_course_controller.dart';
import '../logic/Controllers/student/student_listview_controller.dart';
import '../logic/Controllers/student/student_login_controller.dart';
import '../logic/Controllers/student/student_profile_controller.dart';
import '../logic/Controllers/student/student_register_controller.dart';
import '../logic/Controllers/setting/setting_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../logic/Controllers/student/student_update_profile_controller.dart';
import '../logic/Controllers/student/student_video_controller.dart';
import '../logic/Controllers/teacher/teacher_course_controller.dart';
import '../logic/Controllers/teacher/teacher_profile_controller.dart';
import '../logic/Controllers/teacher/teacher_video_controller.dart';
import '../service/api/api_notification.dart';
import '../service/api/api_client.dart';
import '../service/repository/admin  Repo/admin_ad_repo.dart';
import '../service/repository/admin  Repo/admin_auth_repo.dart';
import '../service/repository/admin  Repo/admin_category_repo.dart';
import '../service/repository/admin  Repo/admin_student_repo.dart';
import '../service/repository/admin  Repo/admin_teacher_course_repo.dart';
import '../service/repository/admin  Repo/admin_teacher_repo.dart';
import '../service/repository/common repo/auth_repo.dart';
import '../service/repository/notifi/notifi_repo.dart';
import '../service/repository/student/student_ad_repo.dart';
import '../service/repository/student/student_course_repo.dart';
import '../service/repository/student/student_playList_repo.dart';
import '../service/repository/student/student_repo.dart';
import '../service/repository/student/student_video_repo.dart';
import '../service/repository/teacher/teacher_course_repo.dart';
import '../service/repository/teacher/teacher_repo.dart';
import '../utils/AppConstants.dart';

Future<void> init() async {
  //firebase
  WidgetsFlutterBinding.ensureInitialized();
  final messaging =  FirebaseMessaging.instance;
  Get.lazyPut(() => messaging,fenix: true);
  //shared
  final prefs = await SharedPreferences.getInstance();
  Get.lazyPut(() => prefs,fenix: true);
  //Api Client
  Get.lazyPut(() => ApiClient(main_BaseUrl: AppConstants.BASE_URL, sharedPre: Get.find()),fenix: true);
  Get.lazyPut(() => ApiNotification(),fenix: true);
  //Repo
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),fenix: true);
  Get.lazyPut(() => AdminAuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),fenix: true);
  Get.lazyPut(() => TeacherVideoRepo(apiClient: Get.find()));
  Get.lazyPut(() => TeacherCourseRepo(apiClient: Get.find()),fenix: true);
  Get.lazyPut(() => TeacherRepo(apiClient: Get.find()));
  Get.lazyPut(() => AdminAdRepo(apiClient: Get.find()),fenix: true);
  Get.lazyPut(() => AdminCategoryRepo(apiClient: Get.find()),fenix: true);
  Get.lazyPut(() => AdminTeacherRepo(apiClient: Get.find()),fenix: true);
  Get.lazyPut(() => AdminStudentRepo(apiClient: Get.find()),fenix: true);
  Get.lazyPut(() => AdminTeacherCourseRepo(apiClient: Get.find()),fenix: true);
  Get.lazyPut(() => StudentAdRepo(apiClient: Get.find()));
  Get.lazyPut(() => StudentCourseRepo(apiClient: Get.find()),fenix: true);
  Get.lazyPut(() => StudentVideoRepo(apiClient: Get.find()),fenix: true);
  Get.lazyPut(() => StudentRepo(apiClient: Get.find()));
  Get.lazyPut(() => StudentPlayListRepo(apiClient: Get.find()));
  Get.lazyPut(() => NotifiRepo(apiNotification: Get.find(),apiClient: Get.find()),fenix: true);
  //Controller
  Get.lazyPut(() => AdminAdController(adminAdRepo: Get.find()),fenix: true);
  Get.lazyPut(() => AdminCategoryController(adminCategoryRepo: Get.find()),fenix: true);
  Get.lazyPut(() => AdminAuthController(prefs: Get.find(),authRepo: Get.find()),fenix: true);
  Get.lazyPut(() => AdminTeacherController(adminRepo: Get.find()),fenix: true);
  Get.lazyPut(() => AdminTeacherCourseController(adminTeacherCourseRepo: Get.find()),fenix: true);
  Get.lazyPut(() => AdminStudentController(adminRepo: Get.find()),fenix: true);
  Get.lazyPut(() => StudentLoginController(prefs: Get.find(),authRepo: Get.find()),fenix: true);
  Get.lazyPut(() => StudentRegisterController(prefs: Get.find(),authRepo: Get.find()),fenix: true);
  Get.lazyPut(() => StudentListViewController(prefs: Get.find(),playListRepo: Get.find()),fenix: true);
  Get.lazyPut(() => StudentAdController(studentAdRepo: Get.find()),fenix: true);
  Get.lazyPut(() => StudentCourseController(studentCourseRepo: Get.find()),fenix: true);
  Get.lazyPut(() => StudentVideoController(studentVideoRepo: Get.find()),fenix: true);
  Get.lazyPut(() => StudentProfileController(studentRepo: Get.find()),fenix: true);
  Get.lazyPut(() => StudentUpdateProfileController(studentRepo: Get.find()),fenix: true);
  Get.lazyPut(() => TeacherLoginController(prefs: Get.find(),authRepo: Get.find()),fenix: true);
  Get.lazyPut(() => TeacherCourseController(teacherCourseRepo: Get.find()),fenix: true);
  Get.lazyPut(() => TeacherProfileController(teacherRepo: Get.find()),fenix: true);
  Get.lazyPut(() => TeacherVideoController(teacherVideoRepo: Get.find()),fenix: true);
  Get.lazyPut(() => NotifiController(notifiRepo: Get.find(),massage: Get.find(),prefs: Get.find()),fenix: true);
  Get.lazyPut(() => SettingController(prefs: Get.find(),authRepo: Get.find()),fenix: true);

}
