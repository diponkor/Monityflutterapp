import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:finance_and_budget/view/global_widgets/normal_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class FreeTrialScreen extends StatelessWidget {
  const FreeTrialScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb?Center(
      child: SizedBox(
        width: 600.w,
        child: Scaffold(
          backgroundColor: bgWhite,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/topdesign.png',
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 250.h,
                    width: 200.w,
                    child: Image.asset(
                      'assets/images/trialMan.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  titleText("Free Trial", authPage: true),
                  SizedBox(height: 20.h),
                  SizedBox(
                      height: 60.h,
                      width: double.infinity,
                      child: Image.asset('assets/images/trialbar.png')),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: normalButton('Processed with Payment', onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              content: SizedBox(
                                height: 280.h,
                                width: 200.w,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/Group 68.png',
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0),
                                      child: subTitleText(
                                          'Payment Successfully Done',
                                          authPage: true,
                                          color: blackTextColor2),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10.h),
                                      child: normalButton('Continue'),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
                  )
                ],
              ),
              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/bottomflow.png',
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ),
    ): Scaffold(
      backgroundColor: bgWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 200.h,
            width: double.infinity,
            child: Image.asset(
              'assets/images/topdesign.png',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 250.h,
                width: 200.w,
                child: Image.asset(
                  'assets/images/trialMan.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.h),
              titleText("Free Trial", authPage: true),
              SizedBox(height: 20.h),
              SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: Image.asset('assets/images/trialbar.png')),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: normalButton('Processed with Payment', onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          content: SizedBox(
                            height: 280.h,
                            width: 200.w,
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/Group 68.png',
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: subTitleText(
                                      'Payment Successfully Done',
                                      authPage: true,
                                      color: blackTextColor2),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 10.h),
                                  child: normalButton('Continue'),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }),
              )
            ],
          ),
          SizedBox(
            height: 200.h,
            width: double.infinity,
            child: Image.asset(
              'assets/images/bottomflow.png',
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
