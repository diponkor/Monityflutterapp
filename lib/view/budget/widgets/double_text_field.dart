import 'package:finance_and_budget/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget doubleTextField({
  TextEditingController? controller1,
  TextEditingController? controller2,
  IconData? icon,
  Function()? iconPress,
  Color? iconBgColor,
  String? hintText1,
  String? hintText2,
  bool isEnable =true,
}) {
  return Container(
    height: 50.h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5.r)),
      border: Border.all(
        color: blackTextColor,
        width: 1.w,
      ),
    ),
    child: Row(
      children: [
        SizedBox(
          width: 157.w,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextFormField(
              enabled: isEnable,
              onChanged: (text) async {},
              onEditingComplete: () async {},
              keyboardType: TextInputType.text,
              controller: controller1,
              style: TextStyle(fontSize: 18.h, color: blackTextColor),
              decoration: InputDecoration(
                hintText: hintText1,
                hintStyle:
                    TextStyle(fontSize: 18.sp, color: secondaryTextColor),
              ),
            ),
          ),
        ),
        const VerticalDivider(
          color: blackTextColor,
          thickness: 1,
        ),
        SizedBox(
          width: 157.w,
          child: TextFormField(
            enabled: isEnable,
            onChanged: (text) async {},
            onEditingComplete: () async {},
            keyboardType: TextInputType.text,
            controller: controller2,
            style: TextStyle(fontSize: 18.h, color: blackTextColor),
            decoration: InputDecoration(
              hintText: hintText2,
              hintStyle: TextStyle(fontSize: 18.sp, color: secondaryTextColor),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: iconPress,
            child: Container(
              height: 50.h,
              width: 20.h,
              decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.r),
                    bottomRight: Radius.circular(5.r),
                  )),
              child: Icon(icon, color: white),
            ),
          ),
        )
      ],
    ),
  );
}
