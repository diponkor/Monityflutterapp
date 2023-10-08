import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../global_widgets/custom_text.dart';

Widget transItem(String text, {bool down = true}) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            height: 26.h,
            width: 26.w,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 40,
                  offset: Offset(0, 25),
                  spreadRadius: -10,
                )
              ],
            ),
            child: down
                ? const Icon(Icons.download_rounded,
                size: 16, color: extraColor)
                : const Icon(Icons.upload_rounded,
                size: 16, color: Colors.blueAccent),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subTitleText('Today 2.30', color: secondaryTextColor, size: 7),
              subTitleText(text, size: 10, fontWeight: FontWeight.w400),
            ],
          ),
          const Expanded(child: SizedBox()),
          subTitleText('\$ 845.67',
              size: 10, color: down ? extraColor : Colors.blueAccent),
        ],
      ),
      Divider(
        color: secondaryTextColor.withOpacity(0.2),
        thickness: 0.8,
      )
    ],
  );
}