import 'package:get/get_navigation/get_navigation.dart';
import 'package:school/view/admin/ad/admin_ad_view_page.dart';
import 'package:school/view/admin/ad/admin_add_ad_page.dart';
import 'package:school/view/admin/auth/admin_login_page.dart';
import 'package:school/view/admin/category/admin_add_category_page.dart';
import 'package:school/view/admin/category/admin_category_index_page.dart';
import 'package:school/view/admin/course/admin_view_teacher_course.dart';
import 'package:school/view/admin/main/admin_main_page.dart';
import 'package:school/view/admin/student/admin_student_update_profile.dart';
import 'package:school/view/admin/teacher/admin_teacher_profile_page.dart';
import 'package:school/view/admin/teacher/admin_teacher_update_profile.dart';
import 'package:school/view/offline%20connection/offline_page.dart';
import 'package:school/view/packages/plus_paln.dart';
import 'package:school/view/packages/pro_plan.dart';
import 'package:school/view/setting/setting_page.dart';
import 'package:school/view/student/auth/student_register_view_m.dart';
import 'package:school/view/student/courses/course/student_course_page.dart';
import 'package:school/view/student/courses/course/student_video_page.dart';
import 'package:school/view/student/main/play_list/student_play_list_page.dart';
import 'package:school/view/student/profile/student_profile_page.dart';
import 'package:school/view/student/profile/student_update_profile_page.dart';
import 'package:school/view/teacher/auth/teacher_login_page.dart';
import 'package:school/view/teacher/course/teacher_add_course_page.dart';
import 'package:school/view/teacher/course/teacher_update_course_page.dart';
import 'package:school/view/teacher/profile/teacher_profile_page.dart';
import 'package:school/view/teacher/video/teacher_add_video_page.dart';
import 'package:school/view/teacher/video/teacher_update_video_page.dart';

import '../view/admin/student/admin_show_student_page.dart';
import '../view/admin/teacher/admin_teacher_add_page.dart';
import '../view/contact_us/about_us_page.dart';
import '../view/intro/intro_screen_view_m.dart';
import '../view/packages/packages.dart';
import '../view/splash/splash_screen_page.dart';
import '../view/student/auth/student_login_view_m.dart';
import '../view/student/courses/course/student_teacher_courses.dart';
import '../view/student/main/ad/ad_body_view.dart';
import '../view/student/main/main_slider/student_main_view_m.dart';
import '../view/student/play list/student_playList_view_page.dart';
import '../view/teacher/course/teacher_course_view_page.dart';
import '../view/teacher/course/teacher_courses_page.dart';
import '../view/teacher/video/teacher_video_page.dart';
// import '../views/mobile_view/auth/login_view_m.dart';
// import '../views/mobile_view/auth/register_view_m.dart';
// import '../views/mobile_view/donor/main_view/donor_main_view_m.dart';
// import '../views/mobile_view/donor/profile/profile_update_donor_view_m.dart';
// import '../views/mobile_view/intro/intro_screen_view_m.dart';
// import '../views/mobile_view/office/profile/office_profile_view_m.dart';
// import '../views/mobile_view/office/profile/office_update_profile_view_m.dart';
// import '../views/mobile_view/splash_screen/splash_screen.dart';
// import '../views/mobile_view/student/profile/student_update_profile_view_m.dart';

class AppRoutes {
  static const contactus = Routes.contactus;
  static const admincategoryindexpage = Routes.admincategoryindexpage;
  static const adminaddcategorypage = Routes.adminaddcategorypage;
  static const adminloginpage = Routes.adminloginpage;
  static const adminmainpage = Routes.adminmainpage;
  static const adminaddadpage = Routes.adminaddadpage;
  static const adminadbodyview = Routes.adminadbodyview;
  static const adminteacherprofilepage = Routes.adminteacherprofilepage;
  static const adminteacheraddpage = Routes.adminteacheraddpage;
  static const adminteacherupdatepage = Routes.adminteacherupdatepage;
  static const adminshowstudentpage = Routes.adminshowstudentpage;
  static const adminstudentupdateprofilepage =
      Routes.adminstudentupdateprofilepage;
  static const adminviewteachercoursepage = Routes.adminviewteachercoursepage;
  static const studentupdateprofile = Routes.studentupdateprofile;
  static const studentmain = Routes.studentmain;
  static const loginstudent = Routes.loginstudent;
  static const teacherlogin = Routes.teacherlogin;
  static const teachercourses = Routes.teachercourses;
  static const teachervideopage = Routes.teachervideopage;
  static const teacherviewCourse = Routes.teacherviewCourse;
  static const teacheraddvideopage = Routes.teacheraddvideopage;
  static const teacherupdatevideopage = Routes.teacherupdatevideopage;
  static const teacheraddcoursepage = Routes.teacheraddcoursepage;
  static const teacherupdatecoursepage = Routes.teacherupdatecoursepage;
  static const teacherprofilepage = Routes.teacherprofilepage;
  static const registerstdeunt = Routes.registerstdeunt;
  static const splashscreen = Routes.splashscreen;
  static const studentregisterviewm = Routes.studentregisterviewm;
  static const studentloginviewm = Routes.studentloginviewm;
  static const studentcoursepage = Routes.studentcoursepage;
  static const studentvideopage = Routes.studentvideopage;
  static const studentprofilepage = Routes.studentprofilepage;
  static const studentplaylistviewpage = Routes.studentplaylistviewpage;
  static const studentteachercourses = Routes.studentteachercourses;
  static const package = Routes.package;
  static const categoryindex = Routes.categoryindex;
  static const proplan = Routes.proplan;
  static const plusplan = Routes.plusplan;
  static const adbodyview = Routes.adbodyview;
  static const introscreen = Routes.introscreen;
  static const settingpage = Routes.settingpage;
  static const offlinepage = Routes.offlinepage;
  static final routes = [
    GetPage(
        name: Routes.package,
        page: () => const Packages(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.teacheraddcoursepage,
        page: () => const TeacherAddCoursePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.teacherprofilepage,
        page: () => const TeacherProfilePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.plusplan,
        page: () => const PlusPlan(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.proplan,
        page: () => const ProPlan(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.contactus,
        page: () => const AboutUsPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.teacherviewCourse,
        page: () => const TeacherStudentCoursePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adbodyview,
        page: () => const AdBodyView(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.loginstudent,
        page: () => const StudentLoginViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.registerstdeunt,
        page: () => const StudentRegisterViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.teacherlogin,
        page: () => const TeacherLoginPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.teachercourses,
        page: () => const TeacherCoursesPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.categoryindex,
        page: () => const AdminCategoryIndexPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.teachervideopage,
        page: () => const TeacherVideoPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.teacheraddvideopage,
        page: () => const TeacherAddVideoPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.teacherupdatevideopage,
        page: () => const TeacherUpdateVideoPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.teacherupdatecoursepage,
        page: () => const TeacherUpdateCoursePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.splashscreen,
        page: () => const SplashScreenPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.studentregisterviewm,
        page: () => const StudentRegisterViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.studentloginviewm,
        page: () => const StudentLoginViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.studentmain,
        page: () => const StudentMainViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.studentcoursepage,
        page: () => const StudentCoursePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.studentvideopage,
        page: () => const StudentVideoPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.studentprofilepage,
        page: () => const StudentProfilePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.studentupdateprofile,
        page: () => const StudentUpdateProfilePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.studentplaylistviewpage,
        page: () => const StudentPlayListViewPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.studentteachercourses,
        page: () => const StudentTeacherCourses(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adminloginpage,
        page: () => const AdminLoginPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adminmainpage,
        page: () => const AdminMainPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adminaddadpage,
        page: () => const AdminAddAdPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adminadbodyview,
        page: () => const AdminAdBodyView(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.admincategoryindexpage,
        page: () => const AdminCategoryIndexPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adminaddcategorypage,
        page: () => const AdminAddCategoryPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adminteacherprofilepage,
        page: () => const AdminTeacherProfilePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adminteacheraddpage,
        page: () => const AdminTeacherAddPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adminteacherupdatepage,
        page: () => const AdminTeacherUpdateProfilePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adminshowstudentpage,
        page: () => const AdminShowStudentPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adminstudentupdateprofilepage,
        page: () => const AdminStudentUpdateProfilePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.adminviewteachercoursepage,
        page: () => const AdminViewTeacherCoursePage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.settingpage,
        page: () => const SettingPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.introscreen,
        page: () => const IntroScreenViewM(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.offlinepage,
        page: () => const OfflinePage(),
        transition: Transition.fadeIn),
  ];
}

class Routes {
  static const notes = '/';
  static const contactus = '/contactus';
  static const adminloginpage = '/donormainview';
  static const admincategoryindexpage = '/admincategoryindexpage';
  static const adminaddcategorypage = '/adminaddcategorypage';
  static const adminmainpage = '/adminmainpage';
  static const adminaddadpage = '/adminaddadpage';
  static const adminadbodyview = '/adminadbodyview';
  static const adminteacherprofilepage = '/adminteacherprofilepage';
  static const adminteacheraddpage = '/adminteacheraddpage';
  static const adminteacherupdatepage = '/adminteacherupdatepage';
  static const adminshowstudentpage = '/adminshowstudentpage';
  static const adminstudentupdateprofilepage = '/adminstudentupdateprofilepage';
  static const adminviewteachercoursepage = '/adminviewteachercoursepage';
  static const studentupdateprofile = '/studentupdateprofile';
  static const studentmain = '/studentmain';
  static const loginstudent = '/loginstudent';
  static const teacherlogin = '/teacherlogin';
  static const teachercourses = '/teachercourses';
  static const teacherviewCourse = '/teacherviewCourse';
  static const teachervideopage = '/teachervideopage';
  static const teacherupdatevideopage = '/teacherupdatevideopage';
  static const teacheraddvideopage = '/teacheraddvideopage';
  static const teacherupdatecoursepage = '/teacherupdatecoursepage';
  static const teacheraddcoursepage = '/teacheraddcoursepage';
  static const teacherprofilepage = '/teacherprofilepage';
  static const registerstdeunt = '/registerstdeunt';
  static const splashscreen = '/splashscreen';
  static const studentregisterviewm = '/studentregisterviewm';
  static const studentloginviewm = '/studentloginviewm';
  static const studentcoursepage = '/studentcoursepage';
  static const studentvideopage = '/studentvideopage';
  static const studentprofilepage = '/studentprofilepage';
  static const studentplaylistviewpage = '/studentplaylistviewpage';
  static const studentteachercourses = '/studentteachercourses';
  static const package = '/package';
  static const categoryindex = '/categoryindex';
  static const proplan = '/proplan';
  static const plusplan = '/plusplan';
  static const adbodyview = '/adbodyview';
  static const introscreen = '/introscreen';
  static const settingpage = '/settingpage';
  static const offlinepage = '/offlinepage';
}
