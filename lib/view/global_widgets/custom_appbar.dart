import 'package:finance_and_budget/view/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107.h,
      width: 430.w,
      padding: EdgeInsets.fromLTRB(20.w,30.h,20.w,0.h),
      decoration: BoxDecoration(
        color: white,
        boxShadow: const[
          BoxShadow(
            blurRadius: 1,
            offset: Offset(1, 0), // Shadow position
          ),
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              height: 49.5.h,
              width:50.w,
              child: Image.asset('assets/images/monity.png',fit: BoxFit.cover,)
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
                height:50.h,
                child: Image.asset('assets/images/textIcon.png'),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ProfileScreen()));
                },
                child: SizedBox(
                  width: 50.w,
                  height:50.h,
                  child: Image.asset('assets/images/profileIcon.png'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
