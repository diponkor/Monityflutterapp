import 'package:finance_and_budget/view/authentication/signin_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:finance_and_budget/view/global_widgets/normal_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 530
        ? Scaffold(
            backgroundColor: bgWhite,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                children: [
                  headerWidget(),
                  SizedBox(height: 20.h),
                  Stack(
                    children: [
                      Container(
                        height: 600.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: secondaryDarkTextColor.withOpacity(0.2),
                                width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r))),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r)),
                            child: Image.asset('assets/images/students.jpg',
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          top: 30.h,
                          left: 50.w,
                          right: 50.w,
                          child: titleText(
                              'ContactPersonal Finance Coach On Retainer',
                              size: screenWidth > 430 && kIsWeb ? 18 : 28,
                              color: primaryColor)),
                      Positioned(
                        top: screenWidth > 430 && kIsWeb ? 120.h : 60.h,
                        left: 50.w,
                        right: 50.w,
                        child: titleText(
                            'AI-Powered Personal Finance Platform for Millennial and Gen Z Workforces',
                            color: profileBgColor,
                            size: screenWidth > 430 && kIsWeb ? 30 : 50),
                      ),
                      Positioned(
                        top: screenWidth > 430 && kIsWeb ? 400.h : 300.h,
                        left: 100.w,
                        child: SizedBox(
                            width: 100.w,
                            child: normalButton('Try Monity', onPressed: () {
                              Get.to(SigninScreen());
                            })),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  for (int i = 0; i < 6; i++)
                    Container(
                      padding: EdgeInsets.all(10.h),
                      margin: EdgeInsets.all(10.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: secondaryTextColor.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Container(
                              height: 60.h,
                              width: 60.h,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.r))),
                              child: const Icon(Icons.add,
                                  color: white, size: 40)),
                          SizedBox(height: 20.h),
                          titleText('Reduce \nEmployee \nAbsences',
                              color: primaryColor, size: 20),
                          SizedBox(height: 10.h),
                          titleText(
                              'Assist employees in stabilizing their financial situations. Reduced financial stress and improved management can lead to fewer unplanned absences, ensuring smoother business operations.',
                              size: 16),
                          SizedBox(height: 20.h),
                          SizedBox(
                              width: 100.w, child: normalButton('Read More')),
                        ],
                      ),
                    ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 650.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: secondaryDarkTextColor.withOpacity(0.2),
                            width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(30.r))),
                    child: Column(
                      children: [
                        subTitleText('Business Statistics -',
                            color: primaryColor, size: 18),
                        SizedBox(height: 20.h),
                        titleText('Where the Problem in Your Organization?',
                            size: 25),
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: 400.h,
                          child: GridView.builder(
                              itemCount: 4,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20),
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                  padding: EdgeInsets.all(20.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:
                                          secondaryTextColor.withOpacity(0.2),
                                      border: Border.all(
                                          width: 1,
                                          color: secondaryTextColor
                                              .withOpacity(0.2)),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      titleText('3 X', color: black, size: 35),
                                      SizedBox(height: 20.h),
                                      titleText(
                                          'more likely for financially stressed employees to be disengaged at work',
                                          size: 18,
                                          color: black,
                                          fontWeight: FontWeight.w400)
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 400.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(40.h),
                    decoration: BoxDecoration(
                        color: black.withOpacity(0.9),
                        border: Border.all(
                            color: secondaryDarkTextColor.withOpacity(0.2),
                            width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(30.r))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: white,
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                subTitleText('Actress',
                                    size: 22, color: Colors.deepOrange),
                                subTitleText('Person Name',
                                    color: white, size: 20),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 40.w),
                              height: 80.h,
                              width: 80.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: primaryColor),
                              child: const Icon(Icons.arrow_back, color: white),
                            ),
                            Expanded(
                              child: titleText(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                                  size: 10,
                                  color: secondaryTextColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40.w),
                              height: 80.h,
                              width: 80.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: primaryColor),
                              child:
                                  const Icon(Icons.arrow_forward, color: white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 1300.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(40.h),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        border: Border.all(
                            color: secondaryDarkTextColor.withOpacity(0.2),
                            width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(30.r))),
                    child: Container(
                      height: 520.h,
                      width: double.infinity,
                      padding: EdgeInsets.all(40.h),
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(
                              color: secondaryDarkTextColor.withOpacity(0.2),
                              width: 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.r))),
                      child: Column(
                        children: [
                          titleText('Our Services', color: black, size: 25),
                          SizedBox(
                              width: 50.w,
                              child: const Divider(thickness: 3, color: black)),
                          for (int j = 0; j < 4; j++)
                            Container(
                              padding: EdgeInsets.all(10.h),
                              margin: EdgeInsets.all(10.h),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: secondaryTextColor.withOpacity(0.2),
                                  border: Border.all(
                                      width: 1,
                                      color:
                                          secondaryTextColor.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100.h,
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                        color: red,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.r)),
                                        child: Image.asset(
                                            'assets/images/students.jpg',
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(height: 10.h),
                                  subTitleText('Service', color: primaryColor),
                                  subTitleText('Standard',
                                      color: primaryColor, size: 20),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 700.w,
                      child: Divider(color: black.withOpacity(0.6))),
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: bgWhite,
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                children: [
                  headerWidget(),
                  SizedBox(height: 20.h),
                  Stack(
                    children: [
                      Container(
                        height: 600.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: secondaryDarkTextColor.withOpacity(0.2),
                                width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r))),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.r)),
                            child: Image.asset('assets/images/students.jpg',
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                          top: 30.h,
                          left: 50.w,
                          right: 50.w,
                          child: titleText(
                              'ContactPersonal Finance Coach On Retainer',
                              size: screenWidth > 430 && kIsWeb ? 18 : 28,
                              color: primaryColor)),
                      Positioned(
                        top: screenWidth > 430 && kIsWeb ? 120.h : 60.h,
                        left: 50.w,
                        right: 50.w,
                        child: titleText(
                            'AI-Powered Personal Finance Platform for Millennial and Gen Z Workforces',
                            color: profileBgColor,
                            size: screenWidth > 430 && kIsWeb ? 30 : 50),
                      ),
                      Positioned(
                        top: screenWidth > 430 && kIsWeb ? 400.h : 300.h,
                        left: 100.w,
                        child: SizedBox(
                            width: 100.w,
                            child: normalButton('Try Monity', onPressed: () {
                              Get.to(SigninScreen());
                            })),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 500.h,
                    child: GridView.builder(
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 60),
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            padding: EdgeInsets.all(20.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: secondaryTextColor.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Container(
                                    height: 60.h,
                                    width: 60.h,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50.r))),
                                    child: const Icon(Icons.add,
                                        color: white, size: 40)),
                                SizedBox(height: 20.h),
                                titleText('Reduce \nEmployee \nAbsences',
                                    color: primaryColor, size: 30),
                                SizedBox(height: 10.h),
                                titleText(
                                    'Assist employees in stabilizing their financial situations. Reduced financial stress and improved management can lead to fewer unplanned absences, ensuring smoother business operations.',
                                    size: 20),
                                SizedBox(height: 20.h),
                                SizedBox(
                                    width: 100.w,
                                    child: normalButton('Read More')),
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 600.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: secondaryDarkTextColor.withOpacity(0.2),
                            width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(30.r))),
                    child: Column(
                      children: [
                        subTitleText('Business Statistics -',
                            color: primaryColor, size: 22),
                        SizedBox(height: 20.h),
                        titleText('Where the Problem in Your Organization?',
                            size: 45),
                        SizedBox(height: 20.h),
                        SizedBox(
                          height: 410.h,
                          child: GridView.builder(
                              itemCount: 4,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 60),
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                  padding: EdgeInsets.all(20.h),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:
                                          secondaryTextColor.withOpacity(0.2),
                                      border: Border.all(
                                          width: 1,
                                          color: secondaryTextColor
                                              .withOpacity(0.2)),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      titleText('3 X', color: black, size: 45),
                                      SizedBox(height: 20.h),
                                      titleText(
                                          'more likely for financially stressed employees to be disengaged at work',
                                          size: 18,
                                          color: black,
                                          fontWeight: FontWeight.w400)
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 400.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(40.h),
                    decoration: BoxDecoration(
                        color: black.withOpacity(0.9),
                        border: Border.all(
                            color: secondaryDarkTextColor.withOpacity(0.2),
                            width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(30.r))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: white,
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                subTitleText('Actress',
                                    size: 28, color: Colors.deepOrange),
                                subTitleText('Person Name',
                                    color: white, size: 26),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 40.w),
                              height: 80.h,
                              width: 80.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: primaryColor),
                              child: const Icon(Icons.arrow_back, color: white),
                            ),
                            Expanded(
                              child: titleText(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                                  size: 18,
                                  color: secondaryTextColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 40.w),
                              height: 80.h,
                              width: 80.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: primaryColor),
                              child:
                                  const Icon(Icons.arrow_forward, color: white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 600.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(40.h),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        border: Border.all(
                            color: secondaryDarkTextColor.withOpacity(0.2),
                            width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(30.r))),
                    child: Container(
                      height: 520.h,
                      width: double.infinity,
                      padding: EdgeInsets.all(40.h),
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(
                              color: secondaryDarkTextColor.withOpacity(0.2),
                              width: 1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.r))),
                      child: Column(
                        children: [
                          titleText('Our Services', color: black, size: 35),
                          SizedBox(
                              width: 50.w,
                              child: const Divider(thickness: 3, color: black)),
                          SizedBox(
                            height: 350.h,
                            child: GridView.builder(
                                itemCount: 4,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisSpacing: 20,
                                        crossAxisSpacing: 60),
                                itemBuilder: (BuildContext ctx, index) {
                                  return Container(
                                    padding: EdgeInsets.all(10.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color:
                                            secondaryTextColor.withOpacity(0.2),
                                        border: Border.all(
                                            width: 1,
                                            color: secondaryTextColor
                                                .withOpacity(0.2)),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 100.h,
                                          width: 120.w,
                                          decoration: BoxDecoration(
                                              color: red,
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.r)),
                                              child: Image.asset(
                                                  'assets/images/students.jpg',
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(height: 10.h),
                                        subTitleText('Service',
                                            color: primaryColor),
                                        subTitleText('Standard',
                                            color: primaryColor, size: 22),
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 800.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(40.h),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: secondaryDarkTextColor.withOpacity(0.2),
                            width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(30.r))),
                    child: Column(
                      children: [
                        subTitleText('Online Packs',
                            color: primaryColor, fontWeight: FontWeight.w400),
                        subTitleText('Pricing Packages',
                            color: black, size: 35),
                        SizedBox(
                            width: 50.w,
                            child: const Divider(thickness: 3, color: black)),
                        SizedBox(
                          height: 600.h,
                          child: GridView.builder(
                              itemCount: 3,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20),
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(
                                    height: 450.h,
                                    padding: EdgeInsets.all(10.h),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: secondaryTextColor
                                                .withOpacity(0.2)),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                      height: 420.h,
                                      width: 350.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.orange),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          subTitleText('\$ 199.00',
                                              color: primaryColor, size: 20),
                                          Padding(
                                            padding: EdgeInsets.all(10.h),
                                            child: titleText(
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse varius enim in eros elementum tristique.',
                                                size: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          titleText('Premium',
                                              color: black, size: 35),
                                          SizedBox(
                                              width: 50.w,
                                              child: const Divider(
                                                  thickness: 3, color: black)),
                                          Padding(
                                            padding: EdgeInsets.all(10.h),
                                            child: titleText(
                                                'Omnis ut quaerat facilis.Qui nesciunt itaque asper Eveniet ea beatae Omnis doloribus incid Debitis incidunt nihil',
                                                color: secondaryTextColor,
                                                size: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          normalButton('Buy Now', width: 100),
                                        ],
                                      ),
                                    ));
                              }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 500.h,
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
                    decoration: BoxDecoration(
                        color: black.withOpacity(0.9),
                        border: Border.all(
                            color: secondaryDarkTextColor.withOpacity(0.2),
                            width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(30.r))),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            const SizedBox(),
                            const SizedBox(),
                            subTitleText('Why not', color: white),
                            titleText('Choose the Best',
                                color: white, size: 45),
                            SizedBox(
                                width: 50.w,
                                child: const Divider(
                                    thickness: 3, color: primaryColor)),
                            subTitleText(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse \nvarius enim in eros elementum tristique.',
                                color: white,
                                size: 22,
                                fontWeight: FontWeight.w400),
                            const SizedBox(),
                            const SizedBox(),
                            const SizedBox(),
                          ],
                        ),
                        SizedBox(width: 20.w),
                        Container(
                          height: 360.h,
                          width: 600.w,
                          padding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 20.w),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.r))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(),
                              const SizedBox(),
                              titleText('Try our freemium theme',
                                  size: 35, color: black),
                              titleText(
                                  'With advanced features of higher quality than other similar marketplace themes',
                                  size: 22,
                                  fontWeight: FontWeight.w400,
                                  color: black),
                              normalButton('GET STARTED', width: 150),
                              const SizedBox(),
                              const SizedBox(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 500.h,
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 450.h,
                          width: 450.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleText('Thrifty',
                                  size: 45, color: Colors.deepOrange),
                              SizedBox(height: 20.h),
                              titleText(
                                  'Thrifty comes with everything to get your business, Rolling. Take your chance to try our freemium theme and crack a mirror for your business. Because you’re out of luck and in control with us.',
                                  size: 20,
                                  fontWeight: FontWeight.w400),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.w),
                        SizedBox(
                          height: 450.h,
                          width: 250.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleText('Pages', size: 35, color: black),
                              SizedBox(height: 20.h),
                              titleText('Home',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('About',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Services',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Pillar',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Pillar',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Content Download',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Blog',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Pricing',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Contact',
                                  size: 20, fontWeight: FontWeight.w400),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 450.h,
                          width: 250.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleText('Blog', size: 35, color: black),
                              SizedBox(height: 20.h),
                              titleText('Blog Listing',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Blog Post',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Blog Author',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Case Studies',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Case Study',
                                  size: 20, fontWeight: FontWeight.w400),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 450.h,
                          width: 300.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleText('Contact', size: 35, color: black),
                              SizedBox(height: 20.h),
                              titleText('404 Error',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('500 Error',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Email subscription preferences',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Unsubscribe backup pages',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Subscription update confirmation',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Password Prompt',
                                  size: 20, fontWeight: FontWeight.w400),
                              SizedBox(height: 10.h),
                              titleText('Search Results',
                                  size: 20, fontWeight: FontWeight.w400),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 700.w,
                      child: Divider(color: black.withOpacity(0.6))),
                ],
              ),
            ),
          );
  }

  Widget headerWidget() {
    return Container(
      height: 200.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          border: Border.all(
              color: secondaryDarkTextColor.withOpacity(0.2), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(30.r))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleText('Monity', size: 40, color: primaryColor),
          normalButton('Contact', width: 100.w)
        ],
      ),
    );
  }
}
