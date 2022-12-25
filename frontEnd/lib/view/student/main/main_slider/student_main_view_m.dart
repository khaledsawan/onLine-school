import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:school/view/setting/setting_page.dart';
import 'package:school/view/student/main/play_list/student_play_list_page.dart';
import '../../../../../utils/colors.dart';
import '../../notifiOrPackage/notifiOrPackage.dart';
import '../ad/ads_index_view.dart';
import '../play_list/student_courses_page.dart';

class StudentMainViewM extends StatefulWidget {
  const StudentMainViewM({Key? key}) : super(key: key);
  @override
  State<StudentMainViewM> createState() => _StudentMainViewMState();
}

class _StudentMainViewMState extends State<StudentMainViewM> {
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
      const  NotifiOrPage(),
      const StudentPlayListPage(),
      const StudentCoursesPage(),
      const StudentAdsIndexView(),
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
          CupertinoIcons.bell,
        ),
        title: ("Notification".tr),
        activeColorPrimary: isDark ? AppColors.iconColor : AppColors.mainColor,
        inactiveColorPrimary:
            isDark ? AppColors.iconColor : AppColors.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.playlist_play,
        ),
        title: ("My List".tr),
        activeColorPrimary: isDark ? AppColors.iconColor : AppColors.mainColor,
        inactiveColorPrimary:
            isDark ? AppColors.iconColor : AppColors.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.cast_for_education_outlined),
        title: ("Courses".tr),
        activeColorPrimary: isDark ? AppColors.iconColor : AppColors.mainColor,
        inactiveColorPrimary:
            isDark ? AppColors.iconColor : AppColors.mainColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: ("Home".tr),
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
