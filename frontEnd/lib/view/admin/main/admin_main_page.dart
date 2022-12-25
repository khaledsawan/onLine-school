import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:school/view/setting/setting_page.dart';
import '../../../../../utils/colors.dart';
import '../../student/main/ad/ads_index_view.dart';
import '../../student/main/notification/student_notification_page.dart';
import '../ad/admin_index_ad_page.dart';
import '../category/admin_category_index_page.dart';
import '../student/admin_index_student_page.dart';
import '../teacher/admin_index_teacher_page.dart';

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({Key? key}) : super(key: key);
  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  late PersistentTabController _controller;
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
  }

  List<Widget> _buildScreens() {
    return [
      const SettingPage(),
      const AdminIndexStudentPage(),
      const AdminIndexTeacherPage(),
      const AdminAdsIndexView(),
      const AdminCategoryIndexPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(bool isDark) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: ("Setting".tr),
        activeColorPrimary: isDark ? AppColors.iconColor : AppColors.mainColor,
        inactiveColorPrimary:
            isDark ? AppColors.iconColor : AppColors.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.school,
        ),
        title: ("Students".tr),
        activeColorPrimary: isDark ? AppColors.iconColor : AppColors.mainColor,
        inactiveColorPrimary:
            isDark ? AppColors.iconColor : AppColors.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.person,
        ),
        title: ("My List".tr),
        activeColorPrimary: isDark ? AppColors.iconColor : AppColors.mainColor,
        inactiveColorPrimary:
            isDark ? AppColors.iconColor : AppColors.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.ads_click_outlined),
        title: ("Ads".tr),
        activeColorPrimary: isDark ? AppColors.iconColor : AppColors.mainColor,
        inactiveColorPrimary:
            isDark ? AppColors.iconColor : AppColors.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.subject),
        title: ("Subject".tr),
        activeColorPrimary: isDark ? AppColors.iconColor : AppColors.mainColor,
        inactiveColorPrimary:
        isDark ? AppColors.iconColor : AppColors.mainColor,
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        key: globalKey,
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(isDark),
          confineInSafeArea: true,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.mainColor
              : AppColors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            border: const Border.fromBorderSide(
                BorderSide(color: AppColors.border)),
            borderRadius: BorderRadius.circular(6.0),
            //  colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.linear,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style6,
        ));
  }
}
