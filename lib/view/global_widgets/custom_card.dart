import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

Widget customCard(double height, Widget widget) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      height: height.h,
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
      child: widget);
}
