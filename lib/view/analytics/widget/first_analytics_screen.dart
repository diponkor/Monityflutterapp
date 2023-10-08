import 'package:finance_and_budget/view/global_widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/colors.dart';
import '../../global_widgets/custom_text.dart';

Widget firstAnalyticsScreen(BuildContext context) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        titleText('Account Summary',
            size: 25, color: titleTextColor, authPage: true),
        SizedBox(height: 20.h),
        customCard(
            223,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(14.r),
                            ),
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: Image.asset('assets/images/home2.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        titleText('All Accounts',
                            size: 16, fontWeight: FontWeight.w600),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleText('Account 1', size: 16),
                        titleText('\$52', size: 16),
                      ],
                    ),
                    const Divider(thickness: 1, color: borderColor),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleText('Account 2', size: 16),
                        titleText('\$80', size: 16),
                      ],
                    ),
                    const Divider(thickness: 1, color: borderColor),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        titleText('Account 3', size: 16),
                        titleText('\$40', size: 16),
                      ],
                    ),
                    const Divider(thickness: 1, color: borderColor),
                  ],
                ),
              ),
            )),
        SizedBox(height: 20.h),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            height: 50.h,
            width: 380.w,
            decoration: ShapeDecoration(
              color: white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 40,
                  offset: Offset(0, 25),
                  spreadRadius: -10,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleText('Select', size: 20, fontWeight: FontWeight.w400),
                const Icon(Icons.keyboard_arrow_down, size: 30)
              ],
            )),
        SizedBox(height: 20.h),
        //customCard(313, Container())
      ],
    ),
  );
}
