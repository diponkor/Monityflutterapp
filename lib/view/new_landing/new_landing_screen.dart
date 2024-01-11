import 'package:finance_and_budget/constants/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../authentication/signin_screen.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/normal_button.dart';

class NewLandingScreen extends StatelessWidget {
  const NewLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 740
        ? Scaffold(
            backgroundColor: bgWhite,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 120.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    color: white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 50.h,
                              width: 50.h,
                              child: Image.asset('assets/images/budget.png'),
                            ),
                            SizedBox(width: 10.w),
                            titleText('Monity', size: 20, color: primaryColor),
                          ],
                        ),
                        const Icon(Icons.menu)
                      ],
                    ),
                  ),
                  Container(
                    height: 650.h,
                    padding: EdgeInsets.all(30.h),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: black,
                        image: DecorationImage(
                            opacity: 0.4,
                            image: ExactAssetImage(
                                'assets/images/landingBackground.jpg'),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Al-Powered Personal Finance Platform for \nMillennials and Gen Z ',
                            textAlign: TextAlign.center,
                            style:
                                secondaryTextStyle(35, white, FontWeight.w400)),
                        SizedBox(height: 30.h),
                        Text(
                            'Monity—a cutting-edge platform designed to revolutionize \n'
                            'employee well-being, enhance productivity, \nand drive talent retention!',
                            textAlign: TextAlign.center,
                            style:
                                secondaryTextStyle(18, white, FontWeight.w400)),
                        SizedBox(height: 40.h),
                        normalButton('Try Monity Beta', width: 200.w,
                            onPressed: () {
                          Get.to(const SigninScreen());
                        }),
                        SizedBox(height: 30.h),
                        normalButton('Follow our progress', width: 200.w),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 450.h,
                          width: 700.w,
                          child: Image.asset('assets/images/trialMan.png'),
                        ),
                        Text('Not your typical \nemployee benefit',
                            textAlign: TextAlign.start,
                            style:
                                secondaryTextStyle(38, black, FontWeight.w400)),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: 500.w,
                          height: 300.h,
                          child: Text(
                              'Monity explores the emotional and behavioral aspects of spending.'
                              'By identifying patterns, our AI provides actionable solutions '
                              'for positive change What’s more important when creating '
                              'a financially resilient workforce?',
                              style: secondaryTextStyle(
                                  14, black.withOpacity(0.4), FontWeight.w400)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Divider(
                      thickness: 1,
                      color: black.withOpacity(0.1),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 100.h,
                                  width: 100.h,
                                  child:
                                      Image.asset('assets/images/mark1.png')),
                              Text('Absence Reduction',
                                  textAlign: TextAlign.start,
                                  style: secondaryTextStyle(
                                      25, black, FontWeight.w400)),
                              SizedBox(height: 20.h),
                              SizedBox(
                                width: 400.w,
                                height: 80.h,
                                child: Text(
                                    'Tackle absenteeism head-on! Monity\'s AI-driven '
                                    'approach identifies patterns and triggers, '
                                    'minimizing unplanned employee leaves.',
                                    style: secondaryTextStyle(
                                        14,
                                        black.withOpacity(0.4),
                                        FontWeight.w400)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 300.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 100.h,
                                  width: 100.h,
                                  child:
                                      Image.asset('assets/images/mark1.png')),
                              Text('Productivity Boost',
                                  textAlign: TextAlign.start,
                                  style: secondaryTextStyle(
                                      25, black, FontWeight.w400)),
                              SizedBox(height: 20.h),
                              SizedBox(
                                width: 400.w,
                                height: 80.h,
                                child: Text(
                                    'Maximize efficiency! Our personalized finance '
                                    'coaching empowers employees to understand '
                                    'and reshape their spending behaviors, fostering '
                                    'a more focused and engaged workforce.',
                                    style: secondaryTextStyle(
                                        14,
                                        black.withOpacity(0.4),
                                        FontWeight.w400)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 300.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 100.h,
                                  width: 100.h,
                                  child:
                                      Image.asset('assets/images/mark1.png')),
                              Text('Talent Retention',
                                  textAlign: TextAlign.start,
                                  style: secondaryTextStyle(
                                      25, black, FontWeight.w400)),
                              SizedBox(height: 20.h),
                              SizedBox(
                                width: 400.w,
                                height: 80.h,
                                child: Text(
                                    'Invest in your team\'s future! Monity goes '
                                    'beyond conventional solutions, offering insights '
                                    'that create a workplace where employees thrive, '
                                    'increasing overall job satisfaction.',
                                    style: secondaryTextStyle(
                                        14,
                                        black.withOpacity(0.4),
                                        FontWeight.w400)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 300.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 100.h,
                                  width: 100.h,
                                  child:
                                      Image.asset('assets/images/mark1.png')),
                              Text('A Magic Moment',
                                  textAlign: TextAlign.start,
                                  style: secondaryTextStyle(
                                      25, black, FontWeight.w400)),
                              SizedBox(height: 20.h),
                              SizedBox(
                                width: 400.w,
                                height: 80.h,
                                child: Text(
                                    'Chat only with people you’ve liked. Once you’ve '
                                    'liked each other, it’s a match. Send them a message '
                                    'right away to discover that spark!',
                                    style: secondaryTextStyle(
                                        14,
                                        black.withOpacity(0.4),
                                        FontWeight.w400)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 500.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
                    color: black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(color: bgWhite, width: 0.5)),
                          child: Center(
                            child: subTitleText('English',
                                color: bgWhite,
                                size: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Column(
                          children: [
                            subTitleText('Contact',
                                color: bgWhite,
                                size: 14,
                                fontWeight: FontWeight.w300),
                            SizedBox(width: 20.w),
                            subTitleText('About',
                                color: bgWhite,
                                size: 14,
                                fontWeight: FontWeight.w300),
                            SizedBox(width: 20.w),
                            subTitleText('Terms',
                                color: bgWhite,
                                size: 14,
                                fontWeight: FontWeight.w300),
                            SizedBox(width: 20.w),
                            subTitleText('Privacy',
                                color: bgWhite,
                                size: 14,
                                fontWeight: FontWeight.w300),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                                height: 40.h,
                                width: 40.h,
                                child: Image.asset(
                                    'assets/images/creditcard.png')),
                            SizedBox(width: 20.w),
                            SizedBox(
                                height: 40.h,
                                width: 40.h,
                                child: Image.asset(
                                    'assets/images/creditcard.png')),
                            SizedBox(width: 20.w),
                            SizedBox(
                                height: 40.h,
                                width: 40.h,
                                child: Image.asset(
                                    'assets/images/creditcard.png')),
                            SizedBox(width: 20.w),
                            SizedBox(
                                height: 40.h,
                                width: 40.h,
                                child: Image.asset(
                                    'assets/images/creditcard.png')),
                            SizedBox(width: 20.w),
                            SizedBox(
                                height: 40.h,
                                width: 40.h,
                                child: Image.asset(
                                    'assets/images/creditcard.png')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            subTitleText('@2020 Monity',
                                color: bgWhite.withOpacity(0.6),
                                size: 14,
                                fontWeight: FontWeight.w300),
                            SizedBox(
                              height: 50.h,
                              width: 50.h,
                              child: Image.asset('assets/images/budget.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: bgWhite,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 120.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    color: white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 50.h,
                              width: 50.h,
                              child: Image.asset('assets/images/budget.png'),
                            ),
                            SizedBox(width: 10.w),
                            titleText('Monity', size: 40, color: primaryColor),
                          ],
                        ),
                        Row(
                          children: [
                            titleText('Home', size: 18, color: black),
                            SizedBox(width: 40.w),
                            titleText('Contact Us', size: 18, color: black),
                            SizedBox(width: 40.w),
                            titleText('About Us', size: 18, color: black),
                            //normalButton('Contact', width: 100.w)
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50.h,
                              width: 150.w,
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                    width: 20.h,
                                    child:
                                        Image.asset('assets/images/budget.png'),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      subTitleText('Dowmload on the',
                                          size: 10,
                                          color: white,
                                          fontWeight: FontWeight.w300),
                                      subTitleText('App Store',
                                          size: 18, color: white)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Container(
                              height: 50.h,
                              width: 150.w,
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              decoration: BoxDecoration(
                                  color: black,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                    width: 20.h,
                                    child:
                                        Image.asset('assets/images/budget.png'),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      subTitleText('GET IT ON',
                                          size: 10,
                                          color: white,
                                          fontWeight: FontWeight.w300),
                                      subTitleText('Google Play',
                                          size: 18, color: white)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 650.h,
                    padding: EdgeInsets.all(30.h),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: black,
                        image: DecorationImage(
                            opacity: 0.4,
                            image: ExactAssetImage(
                                'assets/images/landingBackground.jpg'),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Al-Powered Personal Finance Platform for \nMillennials and Gen Z ',
                            textAlign: TextAlign.center,
                            style:
                                secondaryTextStyle(45, white, FontWeight.w400)),
                        SizedBox(height: 30.h),
                        Text(
                            'Monity—a cutting-edge platform designed to revolutionize \n'
                            'employee well-being, enhance productivity, \nand drive talent retention!',
                            textAlign: TextAlign.center,
                            style:
                                secondaryTextStyle(22, white, FontWeight.w400)),
                        SizedBox(height: 40.h),
                        normalButton('Try Monity Beta', width: 200.w,
                            onPressed: () {
                          Get.to(const SigninScreen());
                        }),
                        SizedBox(height: 30.h),
                        normalButton('Follow our progress', width: 200.w),
                      ],
                    ),
                  ),
                  Container(
                    height: 600.h,
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 450.h,
                          width: 700.w,
                          child: Image.asset('assets/images/trialMan.png'),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Not your typical \nemployee benefit',
                                textAlign: TextAlign.start,
                                style: secondaryTextStyle(
                                    38, black, FontWeight.w400)),
                            SizedBox(height: 20.h),
                            SizedBox(
                              width: 500.w,
                              height: 300.h,
                              child: Text(
                                  'Monity explores the emotional and behavioral aspects of spending.'
                                  'By identifying patterns, our AI provides actionable solutions '
                                  'for positive change What’s more important when creating '
                                  'a financially resilient workforce?',
                                  style: secondaryTextStyle(14,
                                      black.withOpacity(0.4), FontWeight.w400)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 200.w),
                    child: Divider(
                      thickness: 1,
                      color: black.withOpacity(0.1),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(200.w, 20.h, 200.w, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 300.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 100.h,
                                      width: 100.h,
                                      child: Image.asset(
                                          'assets/images/mark1.png')),
                                  Text('Absence Reduction',
                                      textAlign: TextAlign.start,
                                      style: secondaryTextStyle(
                                          25, black, FontWeight.w400)),
                                  SizedBox(height: 20.h),
                                  SizedBox(
                                    width: 400.w,
                                    height: 100.h,
                                    child: Text(
                                        'Tackle absenteeism head-on! Monity\'s AI-driven '
                                        'approach identifies patterns and triggers, '
                                        'minimizing unplanned employee leaves.',
                                        style: secondaryTextStyle(
                                            14,
                                            black.withOpacity(0.4),
                                            FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 300.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 100.h,
                                      width: 100.h,
                                      child: Image.asset(
                                          'assets/images/mark1.png')),
                                  Text('Productivity Boost',
                                      textAlign: TextAlign.start,
                                      style: secondaryTextStyle(
                                          25, black, FontWeight.w400)),
                                  SizedBox(height: 20.h),
                                  SizedBox(
                                    width: 400.w,
                                    height: 100.h,
                                    child: Text(
                                        'Maximize efficiency! Our personalized finance '
                                        'coaching empowers employees to understand '
                                        'and reshape their spending behaviors, fostering '
                                        'a more focused and engaged workforce.',
                                        style: secondaryTextStyle(
                                            14,
                                            black.withOpacity(0.4),
                                            FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(200.w, 20.h, 200.w, 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 300.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 100.h,
                                      width: 100.h,
                                      child: Image.asset(
                                          'assets/images/mark1.png')),
                                  Text('Talent Retention',
                                      textAlign: TextAlign.start,
                                      style: secondaryTextStyle(
                                          25, black, FontWeight.w400)),
                                  SizedBox(height: 20.h),
                                  SizedBox(
                                    width: 400.w,
                                    height: 100.h,
                                    child: Text(
                                        'Invest in your team\'s future! Monity goes '
                                        'beyond conventional solutions, offering insights '
                                        'that create a workplace where employees thrive, '
                                        'increasing overall job satisfaction.',
                                        style: secondaryTextStyle(
                                            14,
                                            black.withOpacity(0.4),
                                            FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 300.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: 100.h,
                                      width: 100.h,
                                      child: Image.asset(
                                          'assets/images/mark1.png')),
                                  Text('A Magic Moment',
                                      textAlign: TextAlign.start,
                                      style: secondaryTextStyle(
                                          25, black, FontWeight.w400)),
                                  SizedBox(height: 20.h),
                                  SizedBox(
                                    width: 400.w,
                                    height: 100.h,
                                    child: Text(
                                        'Chat only with people you’ve liked. Once you’ve '
                                        'liked each other, it’s a match. Send them a message '
                                        'right away to discover that spark!',
                                        style: secondaryTextStyle(
                                            14,
                                            black.withOpacity(0.4),
                                            FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 350.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 200.w, vertical: 50.h),
                    color: black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  border:
                                      Border.all(color: bgWhite, width: 0.5)),
                              child: Center(
                                child: subTitleText('English',
                                    color: bgWhite,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Row(
                              children: [
                                subTitleText('Contact',
                                    color: bgWhite,
                                    fontWeight: FontWeight.w300),
                                SizedBox(width: 20.w),
                                subTitleText('About',
                                    color: bgWhite,
                                    fontWeight: FontWeight.w300),
                                SizedBox(width: 20.w),
                                subTitleText('Terms',
                                    color: bgWhite,
                                    fontWeight: FontWeight.w300),
                                SizedBox(width: 20.w),
                                subTitleText('Privacy',
                                    color: bgWhite,
                                    fontWeight: FontWeight.w300),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 40.h,
                                    width: 40.h,
                                    child: Image.asset(
                                        'assets/images/creditcard.png')),
                                SizedBox(width: 20.w),
                                SizedBox(
                                    height: 40.h,
                                    width: 40.h,
                                    child: Image.asset(
                                        'assets/images/creditcard.png')),
                                SizedBox(width: 20.w),
                                SizedBox(
                                    height: 40.h,
                                    width: 40.h,
                                    child: Image.asset(
                                        'assets/images/creditcard.png')),
                                SizedBox(width: 20.w),
                                SizedBox(
                                    height: 40.h,
                                    width: 40.h,
                                    child: Image.asset(
                                        'assets/images/creditcard.png')),
                                SizedBox(width: 20.w),
                                SizedBox(
                                    height: 40.h,
                                    width: 40.h,
                                    child: Image.asset(
                                        'assets/images/creditcard.png')),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            subTitleText('@2020 Monity',
                                color: bgWhite.withOpacity(0.6),
                                fontWeight: FontWeight.w300),
                            SizedBox(
                              height: 50.h,
                              width: 50.h,
                              child: Image.asset('assets/images/budget.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
