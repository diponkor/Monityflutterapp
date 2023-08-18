import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../global_widgets/custom_text.dart';

Widget buildProfileItem(String imgAsset, String text) {
  return Container(
    color: white,
    child: Row(
      children: [
        Container(
          height: 55.h,
          width: 57.w,
          decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius:
              BorderRadius.all(Radius.circular(14.r))),
          child: Center(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 15.0),
              child: Image.asset(imgAsset,
                  fit: BoxFit.cover),
            ),
          ),
        ),
        SizedBox(width: 20.w),
        titleText(text,size: 14,fontWeight: FontWeight.w500)
      ],
    ),
  );
}