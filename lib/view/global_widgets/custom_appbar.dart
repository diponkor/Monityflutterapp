import 'package:finance_and_budget/controller/profile_controller.dart';
import 'package:finance_and_budget/view/chat/monity_chat_screen.dart';
import 'package:finance_and_budget/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../chat/chat_screen.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  static final ProfileController _profileController =
      Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107.h,
      width: 430.w,
      padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 0.h),
      decoration: BoxDecoration(
        color: white,
        boxShadow: const [
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
              width: 50.w,
              child: Image.asset(
                'assets/images/monity.png',
                fit: BoxFit.cover,
              )),
          Row(
            children: [
              /*GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const MonityChatScreen()));
                },
                child: Container(
                  width: 42.w,
                  height: 42.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),
                      child: Image.asset('assets/images/ai_monity.png',
                          fit: BoxFit.contain)),
                ),
              ),*/
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ChatScreen()));
                },
                child: SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: Image.asset('assets/images/textIcon.png'),
                ),
              ),
              SizedBox(width: 10.w),
              GestureDetector(
                onTap: () {
                  _profileController.getUserDetails();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ProfileScreen()));
                },
                child: SizedBox(
                  width: 50.w,
                  height: 50.h,
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
