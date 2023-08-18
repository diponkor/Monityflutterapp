import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../constants/font_constants.dart';

Container customButton({
  double? width,
  required String text,
}) {
  return Container(
    height: 40.h,
    width: width ?? double.infinity,
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(10.sp),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSmall,
          color: white,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

CircleAvatar circleAvatar(IconData iconData , {Color color = primaryColor}) {
  return CircleAvatar(
    backgroundColor: color,
    radius: 12.r,
    child: Icon(
      iconData,
      size: 15.sp,
      color: Colors.white,
    ),
  );
}
