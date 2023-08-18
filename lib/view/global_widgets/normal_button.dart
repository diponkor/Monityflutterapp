import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';

Widget normalButton(String text, {Function()? onPressed, double? width}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
        height: 50.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Center(
          child: subTitleText(text, color: white,authPage: true),
        )),
  );
}
