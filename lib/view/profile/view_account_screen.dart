import 'package:finance_and_budget/view/profile/add_account_screen.dart';
import 'package:finance_and_budget/view/profile/plaid_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/named_back_button.dart';

class ViewAccountScreen extends StatelessWidget {
  const ViewAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb?Center(
      child: SizedBox(
        width: 600.w,
        child: Scaffold(
          backgroundColor: profileBgColor,
          body: SafeArea(
            child: ListView(
              children: [
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                  child: namedBackButton(context, text: 'All Accounts'),
                ),
                SizedBox(
                  height: 155.h,
                ),
                Container(
                    height: 600.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.r),
                            topRight: Radius.circular(40.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50.h),
                        /*Container(
                          padding: EdgeInsets.all(10.w),
                          height: 66.h,
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 50.h,
                                  width: 50.w,
                                  child: Image.asset(
                                    'assets/images/citybank.png',
                                    fit: BoxFit.contain,
                                  )),
                              SizedBox(width: 30.w),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    titleText('City Bank',
                                        size: 20,
                                        fontWeight: FontWeight.w600,
                                        authPage: true),
                                    titleText('Saving Account',
                                        size: 16,
                                        fontWeight: FontWeight.w400,
                                        authPage: true)
                                  ],
                                ),
                              ),
                              Expanded(child: Container()),
                              titleText('Primary',
                                  size: 12,
                                  fontWeight: FontWeight.w400,
                                  authPage: true),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.all(10.w),
                          height: 66.h,
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 50.h,
                                  width: 50.w,
                                  child: Image.asset(
                                    'assets/images/standbank.png',
                                    fit: BoxFit.contain,
                                  )),
                              SizedBox(width: 30.w),
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    titleText('Standard Charted Bank',
                                        size: 20,
                                        fontWeight: FontWeight.w600,
                                        authPage: true),
                                    titleText('Saving Account',
                                        size: 16,
                                        fontWeight: FontWeight.w400,
                                        authPage: true)
                                  ],
                                ),
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                        ),*/
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          color: white,
                          child: Row(
                            children: [
                              Container(
                                height: 54.h,
                                width: 57.w,
                                decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.r))),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Image.asset('assets/images/home2.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              GestureDetector(
                                onTap: (){
                                  Get.to(const AddAccountScreen());
                                },
                                child: titleText('Add Account',
                                    size: 20, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    ): Scaffold(
      backgroundColor: profileBgColor,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
              child: namedBackButton(context, text: 'All Accounts'),
            ),
            SizedBox(
              height: 155.h,
            ),
            Container(
                height: 600.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    /*Container(
                      padding: EdgeInsets.all(10.w),
                      height: 66.h,
                      child: Row(
                        children: [
                          SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: Image.asset(
                                'assets/images/citybank.png',
                                fit: BoxFit.contain,
                              )),
                          SizedBox(width: 30.w),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                titleText('City Bank',
                                    size: 20,
                                    fontWeight: FontWeight.w600,
                                    authPage: true),
                                titleText('Saving Account',
                                    size: 16,
                                    fontWeight: FontWeight.w400,
                                    authPage: true)
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          titleText('Primary',
                              size: 12,
                              fontWeight: FontWeight.w400,
                              authPage: true),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.all(10.w),
                      height: 66.h,
                      child: Row(
                        children: [
                          SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: Image.asset(
                                'assets/images/standbank.png',
                                fit: BoxFit.contain,
                              )),
                          SizedBox(width: 30.w),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                titleText('Standard Charted Bank',
                                    size: 20,
                                    fontWeight: FontWeight.w600,
                                    authPage: true),
                                titleText('Saving Account',
                                    size: 16,
                                    fontWeight: FontWeight.w400,
                                    authPage: true)
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                    ),*/
                    SizedBox(height: 10.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      color: white,
                      child: Row(
                        children: [
                          Container(
                            height: 54.h,
                            width: 57.w,
                            decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius:
                                BorderRadius.all(Radius.circular(50.r))),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Image.asset('assets/images/home2.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          GestureDetector(
                            onTap: (){
                              Get.to(const AddAccountScreen());
                            },
                            child: titleText('Add Account',
                                size: 20, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
