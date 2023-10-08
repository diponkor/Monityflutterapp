import 'package:finance_and_budget/view/analytics/widget/trans_item.dart';
import 'package:finance_and_budget/view/global_widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../global_widgets/custom_text.dart';

Widget secondAnalyticsScreen(BuildContext context) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        titleText('Transactions',
            size: 25, color: titleTextColor, authPage: true),
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
        customCard(
            356,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText('Transactions',
                        size: 18, fontWeight: FontWeight.w500),
                    SizedBox(height: 10.h),
                    transItem('Store 1'),
                    transItem('Store 2', down: false),
                    transItem('Store 3'),
                    transItem('Store 4', down: false),
                    transItem('Store 5'),
                    transItem('Store 6', down: false),
                    transItem('Store 7'),
                  ],
                ),
              ),
            ))
      ],
    ),
  );
}


