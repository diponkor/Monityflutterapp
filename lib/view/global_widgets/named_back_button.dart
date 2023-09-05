import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import 'custom_text.dart';

Widget namedBackButton(BuildContext context,{ String? text}){
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Row(
      children: [
        Container(
          height: 35.h,
          width: 37.w,
          decoration: BoxDecoration(
              border: Border.all(
                color: titleTextColor,
                width: 1,
              ),
              color: white,
              borderRadius:
              BorderRadius.all(Radius.circular(50.r))),
          child: const Icon(Icons.arrow_back),
        ),
        SizedBox(width: 10.w),
        titleText(text??'Back',
            color: titleTextColor, size: 25, authPage: true),
        SizedBox(width: 10.w),
      ],
    ),
  );
}