import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school/component/container/custom_container.dart';
import 'package:school/component/icon_than_text/icon_than_text_container.dart';
import 'package:school/component/text/text_in_Container.dart';
import 'package:school/routes/routes.dart';
import '../../utils/colors.dart';

class Packages extends StatelessWidget {
  const Packages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ops!',
                  style: GoogleFonts.courgette(
                      fontSize: 35, color: AppColors.mainColor),
                ),
                SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'images/broken pencile.png',
                      fit: BoxFit.fill,
                    ))
              ],
            ),
            Text(
              'you currently don\'t have access',
              style:
                  GoogleFonts.roboto(fontSize: 20, color: AppColors.mainColor),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(8, 12, 8, 10),
              height: 1,
              color: AppColors.border,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainer(
                radius: 16,
                width: width,
                border: 0,
                height: height * 0.46,
                backgroundColor: AppColors.orange,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Pro',
                          style: GoogleFonts.courgette(
                              fontSize: 30,
                              color: AppColors.textorange,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: AppColors.orangeBorder,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconThanTextContainer(
                            padding: const EdgeInsets.only(left: 4, top: 4),
                            margin: const EdgeInsets.only(
                                left: 4, right: 4, top: 4),
                            width: width * 0.45,
                            height: 40,
                            textColor: AppColors.black,
                            icon: Icons.video_collection,
                            text: 'All Courses',
                            color: AppColors.orangeBorder),
                        IconThanTextContainer(
                            padding: const EdgeInsets.only(left: 4, top: 4),
                            margin: const EdgeInsets.only(
                                left: 4, right: 4, top: 8),
                            width: width * 0.45,
                            height: 40,
                            textColor: AppColors.black,
                            icon: Icons.settings,
                            text: 'Full Setting',
                            color: AppColors.orangeBorder),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconThanTextContainer(
                            padding: const EdgeInsets.only(left: 4, top: 4),
                            margin: const EdgeInsets.only(
                                left: 4, right: 4, top: 8),
                            width: width * 0.45,
                            height: 40,
                            textColor: AppColors.black,
                            icon: Icons.playlist_play_outlined,
                            text: 'Your on playList ',
                            color: AppColors.orangeBorder),
                        IconThanTextContainer(
                            padding: const EdgeInsets.only(left: 4, top: 4),
                            margin: const EdgeInsets.only(
                                left: 4, right: 4, top: 8),
                            width: width * 0.45,
                            height: 40,
                            textColor: AppColors.black,
                            icon: Icons.chat,
                            text: 'Chat',
                            color: AppColors.orangeBorder),
                      ],
                    ),
                    IconThanTextContainer(
                        padding: const EdgeInsets.only(left: 4, top: 4),
                        margin:
                            const EdgeInsets.only(left: 4, right: 4, top: 8),
                        width: width * 0.45,
                        height: 40,
                        textColor: AppColors.black,
                        icon: Icons.notifications_active_outlined,
                        text: 'notification',
                        color: AppColors.orangeBorder),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.proplan);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        child: TextInContainer(
                          icon: Icons.arrow_right,
                          begin: AppColors.orangebegin,
                          end: AppColors.orangeend,
                          width: width * 0.4,
                          height: 40,
                          textSize: 22,
                          text: 'Choose plan',
                          borderColor: AppColors.white,
                          isCenter: true,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainer(
                radius: 16,
                width: width,
                border: 0,
                height: height * 0.36,
                backgroundColor: AppColors.green1,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Plus',
                          style: GoogleFonts.courgette(
                              fontSize: 30,
                              color: AppColors.textGreen,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: AppColors.textGreen,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconThanTextContainer(
                            padding: const EdgeInsets.only(left: 4, top: 4),
                            margin: const EdgeInsets.only(
                                left: 4, right: 4, top: 8),
                            width: width * 0.45,
                            height: 40,
                            icon: Icons.video_collection,
                            text: 'All Courses',
                            color: AppColors.green2),
                        IconThanTextContainer(
                            padding: const EdgeInsets.only(left: 4, top: 4),
                            margin: const EdgeInsets.only(
                                left: 4, right: 4, top: 8),
                            width: width * 0.45,
                            height: 40,
                            icon: Icons.settings,
                            text: 'Full Setting',
                            color: AppColors.green2),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconThanTextContainer(
                            padding: const EdgeInsets.only(left: 4, top: 4),
                            margin: const EdgeInsets.only(
                                left: 4, right: 4, top: 8),
                            width: width * 0.45,
                            height: 40,
                            icon: Icons.playlist_play_outlined,
                            text: 'Your on playList ',
                            color: AppColors.green2),
                        IconThanTextContainer(
                            padding: const EdgeInsets.only(left: 4, top: 4),
                            margin: const EdgeInsets.only(
                                left: 4, right: 4, top: 8),
                            width: width * 0.45,
                            height: 40,
                            icon: Icons.chat,
                            text: 'Chat',
                            color: AppColors.green2),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.plusplan);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        child: TextInContainer(
                          icon: Icons.arrow_right,
                          begin: AppColors.bluegra,
                          end: AppColors.yellowgra,
                          width: width * 0.4,
                          height: 40,
                          textSize: 22,
                          text: 'Choose plan',
                          borderColor: AppColors.white,
                          isCenter: true,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomContainer(
                radius: 16,
                width: width,
                height: height * 0.3,
                borderColor: AppColors.white,
                backgroundColor: AppColors.white,
                widget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Free',
                          style: GoogleFonts.courgette(
                              fontSize: 30,
                              color: AppColors.black,
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      color: AppColors.border,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconThanTextContainer(
                            padding: const EdgeInsets.only(left: 4, top: 4),
                            margin: const EdgeInsets.only(
                                left: 4, right: 4, top: 8),
                            width: width * 0.45,
                            height: 40,
                            icon: Icons.video_collection,
                            text: 'Intro Video ',
                            color: AppColors.white),
                        IconThanTextContainer(
                            padding: const EdgeInsets.only(left: 4, top: 4),
                            margin: const EdgeInsets.only(
                                left: 4, right: 4, top: 8),
                            width: width * 0.45,
                            height: 40,
                            icon: Icons.chat,
                            text: 'You onw playList',
                            color: AppColors.white),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(AppRoutes.);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.topLeft,
                        child: CustomContainer(
                          width: width * 0.4,
                          height: 40,
                          radius: 10,
                          borderColor: AppColors.white,
                          alignment: Alignment.center,
                          widget: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Go Free',
                                  style: TextStyle(
                                      color: AppColors.mainColor, fontSize: 22),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                size: 35,
                                color: AppColors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
