import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/constants/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customTextField(TextEditingController controller,
    {String? iconName,
    bool obscureText = false,
    bool? isValid,
    bool? isKeyboardPhone,
    IconData? icon,
    Function()? onPressIcon,
    Color? iconColor,
    String? errorText,
    bool enabled = true}) {
  return Column(
    children: [
      TextField(
        obscureText: obscureText,
        controller: controller,
        enabled: enabled,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,

          //hintText: text,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(top: 20.h),
          hintStyle: TextStyle(
            color: blackTextColor,
            fontSize: fontMedium,
          ),
          suffixIcon: icon != null
              ? GestureDetector(
                  onTap: onPressIcon,
                  child: Icon(icon, color: iconColor ?? blackTextColor))
              : const SizedBox(),
        ),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          height: 1,
        ),
      ),
      if (isValid != null && !isValid)
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              errorText ?? "",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: red,
              ),
            ),
          ),
        ),
    ],
  );
}
