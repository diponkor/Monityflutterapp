import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../global_widgets/custom_text.dart';
import '../create_manifestation.dart';

Widget firstTab(BuildContext context){
  return Column(
    children: [
      SizedBox(height: 10.h),
      Align(
        alignment: Alignment.topLeft,
        child: titleText('Manifestations and Goals',
            size: 25, color: titleTextColor, authPage: true),
      ),
      SizedBox(height: 10.h),
      Align(
        alignment: Alignment.topLeft,
        child: subTitleText(
            'Having  multiple Budget to aspire to is a great way to \nlearn how to money manage!',
            authPage: true,
            color: secondaryTextColor,
            size: 14,
            fontWeight: FontWeight.w400),
      ),
      SizedBox(height: 30.h),
      SizedBox(
        height: 282.h,
        width: 282.w,
        child: Image.asset('assets/images/goals.png'),
      ),
      SizedBox(height: 10.h),
      titleText('Add More Goals',
          size: 25, color: titleTextColor, authPage: true),


      SizedBox(height: 100.h),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CreateManifestation()));
            },
            child: Container(
              height:56.h,
              width: 60.w,
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50.r))
              ),
              child: const Icon(Icons.add,color: blackTextColor),
            ),
          ),
        ),
      ),
    ],
  );
}