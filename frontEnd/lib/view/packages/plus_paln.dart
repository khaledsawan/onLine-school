import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school/component/appbar/appbar.dart';
import 'package:school/component/container/custom_container.dart';
import 'package:school/component/edgeInsets/margin.dart';
import 'package:school/utils/colors.dart';

class PlusPlan extends StatelessWidget {
  const PlusPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar:
          appBar(context, Icons.adb, '', () {}, 'PLUS plan', Icons.adb, () {}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              margin: margin(),
              width: width,
              height: height * 0.3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(100),
                ),
                color: AppColors.green0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 15),
                        child: Text(
                          'year',
                          style: GoogleFonts.courgette(fontSize: 28),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 75.0, top: 15),
                        child: CustomContainer(
                            radius: 12,
                            width: 120,
                            border: 0,
                            backgroundColor: AppColors.purple,
                            height: 35,
                            alignment: Alignment.center,
                            widget: const Text(
                              '30% Off',
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 20),
                            )),
                      )
                    ],
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 10.0, top: 8, right: 40),
                    height: 2,
                    color: AppColors.border,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 35.0, top: 20),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '200.00 \$',
                      style: GoogleFonts.courgette(
                          fontSize: 35, color: AppColors.textColor2),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomContainer(
                      radius: 12,
                      width: 200,
                      border: 2,
                      borderColor: AppColors.textGreen,
                      backgroundColor: AppColors.green01,
                      height: 40,
                      alignment: Alignment.center,
                      widget: const Text(
                        'Get 1_year deal',
                        style: TextStyle(
                            color: AppColors.textGreen,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: margin(),
              width: width,
              height: height * 0.3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(100),
                ),
                color: AppColors.green01,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 15),
                        child: Text(
                          'semester',
                          style: GoogleFonts.courgette(fontSize: 28),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 75.0, top: 15),
                        child: CustomContainer(
                            radius: 12,
                            width: 120,
                            border: 0,
                            backgroundColor: AppColors.purple,
                            height: 35,
                            alignment: Alignment.center,
                            widget: const Text(
                              '20% Off',
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 20),
                            )),
                      )
                    ],
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 10.0, top: 8, right: 40),
                    height: 2,
                    color: AppColors.border,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 35.0, top: 20),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '115.00 \$',
                      style: GoogleFonts.courgette(
                          fontSize: 35, color: AppColors.textColor2),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomContainer(
                      radius: 12,
                      width: 200,
                      border: 2,
                      borderColor: AppColors.textGreen,
                      backgroundColor: AppColors.green01,
                      height: 40,
                      alignment: Alignment.center,
                      widget: const Text(
                        'Get 6_month deal',
                        style: TextStyle(
                            color: AppColors.textGreen,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: margin(),
              width: width,
              height: height * 0.3,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(100),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ],
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, top: 15),
                        child: Text(
                          'month',
                          style: GoogleFonts.courgette(fontSize: 28),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 75.0, top: 15),
                        child: CustomContainer(
                            radius: 12,
                            width: 120,
                            border: 1,
                            backgroundColor: AppColors.white,
                            height: 35,
                            alignment: Alignment.center,
                            widget: const Text(
                              '0% Off',
                              style: TextStyle(
                                  color: AppColors.mainColor, fontSize: 22),
                            )),
                      )
                    ],
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 10.0, top: 8, right: 40),
                    height: 2,
                    color: AppColors.border,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 35.0, top: 20),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '22.00 \$',
                      style: GoogleFonts.courgette(
                          fontSize: 35, color: AppColors.textColor2),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomContainer(
                      radius: 12,
                      width: 200,
                      border: 2,
                      borderColor: AppColors.white,
                      backgroundColor: AppColors.white,
                      height: 40,
                      alignment: Alignment.center,
                      widget: const Text(
                        'Get 1_month deal',
                        style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
