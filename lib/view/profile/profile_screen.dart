import 'package:finance_and_budget/view/authentication/signin_screen.dart';
import 'package:finance_and_budget/view/global_widgets/named_back_button.dart';
import 'package:finance_and_budget/view/profile/add_account_screen.dart';
import 'package:finance_and_budget/view/profile/change_password_screen.dart';
import 'package:finance_and_budget/view/profile/profile_edit_screen.dart';
import 'package:finance_and_budget/view/profile/widgets/build_profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileBgColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 5.h),
              child: namedBackButton(context, text: 'Profile'),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    child: Image.asset('assets/images/girl_img.png',
                        fit: BoxFit.contain),
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleText('Cameron Williamson',
                          size: 20,
                          fontWeight: FontWeight.w600,
                          authPage: true),
                      SizedBox(height: 5.h),
                      titleText('admin@gmail.com',
                          size: 16, fontWeight: FontWeight.w400),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap:(){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => const ProfileEditScreen()));
                              },
                              child: buildProfileItem('assets/images/profile_pro.png', 'My Account')),
                          SizedBox(height: 30.h),
                          GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => const ChangePasswordScreen()));
                              },
                              child: buildProfileItem('assets/images/profile_lock.png', 'Change Password')),
                          SizedBox(height: 30.h),

                          GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => const AddAccountScreen()));
                              },
                              child: buildProfileItem('assets/images/home2.png', 'Add Account')),
                          SizedBox(height: 30.h),

                          GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (_) => const SigninScreen()));
                              },
                              child: buildProfileItem('assets/images/profile_logout.png', 'Logout')),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 430.w,
                        height:220.h,
                        child: Image.asset('assets/images/bottomflow.png',fit: BoxFit.cover,))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
