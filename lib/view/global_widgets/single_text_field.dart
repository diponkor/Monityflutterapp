import 'package:finance_and_budget/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget singleTextField({
  TextEditingController? controller,
  bool? icon,
  TextInputType ? textType = TextInputType.text,
  String? hintText,
}) {
  return SizedBox(
    height: 50.h,
    width: double.infinity,
    child: TextFormField(
        onChanged: (text) async {},
        onEditingComplete: () async {},
        keyboardType: textType,
        controller: controller,
        style: TextStyle(
            fontSize: 18.h, color: blackTextColor, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          fillColor: white,
          suffixIcon: icon != null
              ? const Icon(Icons.calendar_month, color: secondaryTextColor)
              : null,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: const BorderSide(
                width: 1,
                color: blackTextColor,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: const BorderSide(
                width: 1,
                color: blackTextColor,
              )),
          hintStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: secondaryTextColor),
        )),
  );
}
