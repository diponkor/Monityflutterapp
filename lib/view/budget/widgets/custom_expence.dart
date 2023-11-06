import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/view/global_widgets/custom_card.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customExpence({
  String? title,
  String? row1text1,
  String? row1text2,
  String? row2text1,
  String? row2text2,
}) {
  return customCard(
    156,
    SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 160.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: titleText(title ?? 'Income', size: 20),
                ),
                Divider(
                  color: secondaryTextColor.withOpacity(0.3),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      subTitleText(row1text1 ?? 'Salary'),
                      subTitleText(row1text2 ?? '\$ 45350', color: blackTextColor),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: secondaryTextColor.withOpacity(0.3),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      subTitleText(row2text1 ?? 'Support'),
                      subTitleText(row2text2 ?? '\$ 55350', color: blackTextColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 160.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: titleText('Actual Income', size: 20),
                ),
                Divider(
                  color: secondaryTextColor.withOpacity(0.3),
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      subTitleText('Salary'),
                      subTitleText( '\$ 45350', color: blackTextColor),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      subTitleText('Support'),
                      subTitleText('\$ 55350', color: blackTextColor),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: secondaryTextColor.withOpacity(0.3),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60.w,
                          child: subTitleText('Total Actual Income')),
                      subTitleText('\$ 55350', color: blackTextColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
