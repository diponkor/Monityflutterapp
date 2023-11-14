import 'package:finance_and_budget/controller/profile_controller.dart';
import 'package:finance_and_budget/view/global_widgets/named_back_button.dart';
import 'package:finance_and_budget/view/profile/add_account_screen.dart';
import 'package:finance_and_budget/view/profile/change_password_screen.dart';
import 'package:finance_and_budget/view/profile/profile_edit_screen.dart';
import 'package:finance_and_budget/view/profile/view_account_screen.dart';
import 'package:finance_and_budget/view/profile/widgets/build_profile_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../controller/auth_controller.dart';
import '../../utils/utils.dart';
import '../global_widgets/custom_text.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb?Center(
      child: SizedBox(
        width: 600.w,
        child: Scaffold(
          backgroundColor: profileBgColor,
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                  child: namedBackButton(context, text: 'Profile'),
                ),
                SizedBox(height: 10.h),
                GetBuilder<ProfileController>(
                    id: 'profileUpdate',
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
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
                                titleText(
                                    "${profileController.userData?.firstName} ${profileController.userData?.lastName}",
                                    size: 20,
                                    fontWeight: FontWeight.w600,
                                    authPage: true),
                                SizedBox(height: 5.h),
                                titleText(profileController.userData?.email??'Data not found',
                                    size: 16, fontWeight: FontWeight.w400),
                              ],
                            )
                          ],
                        ),
                      );
                    }
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.w, vertical: 20.h),
                          child: Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => const ProfileEditScreen()));
                                  },
                                  child: buildProfileItem(
                                      'assets/images/profile_pro.png',
                                      'My Account')),
                              SizedBox(height: 30.h),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) =>
                                        const ChangePasswordScreen()));
                                  },
                                  child: buildProfileItem(
                                      'assets/images/profile_lock.png',
                                      'Change Password')),
                              SizedBox(height: 30.h),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) => const ViewAccountScreen()));
                                  },
                                  child: buildProfileItem(
                                      'assets/images/home2.png', 'Add Account')),
                              SizedBox(height: 30.h),
                              GestureDetector(
                                  onTap: () {
                                    Utils.showWarningDialog('Are you sure to logout?',
                                        onAccept: (){
                                          profileController.signOut()
                                              .then((value) {
                                            Utils.showSnackBar(
                                                'You\'re logged out successfully');
                                          });
                                          Get.back();
                                        }
                                    );

                                  },
                                  child: buildProfileItem(
                                      'assets/images/profile_logout.png',
                                      'Logout')),
                            ],
                          ),
                        ),
                        SizedBox(
                            width: 430.w,
                            height: 220.h,
                            child: Image.asset(
                              'assets/images/bottomflow.png',
                              fit: BoxFit.cover,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ): Scaffold(
      backgroundColor: profileBgColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
              child: namedBackButton(context, text: 'Profile'),
            ),
            SizedBox(height: 10.h),
            GetBuilder<ProfileController>(
              id: 'profileUpdate',
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
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
                          titleText(
                              "${profileController.userData?.firstName} ${profileController.userData?.lastName}",
                              size: 20,
                              fontWeight: FontWeight.w600,
                              authPage: true),
                          SizedBox(height: 5.h),
                          titleText(profileController.userData?.email??'Data not found',
                              size: 16, fontWeight: FontWeight.w400),
                        ],
                      )
                    ],
                  ),
                );
              }
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 20.h),
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const ProfileEditScreen()));
                              },
                              child: buildProfileItem(
                                  'assets/images/profile_pro.png',
                                  'My Account')),
                          SizedBox(height: 30.h),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                        const ChangePasswordScreen()));
                              },
                              child: buildProfileItem(
                                  'assets/images/profile_lock.png',
                                  'Change Password')),
                          SizedBox(height: 30.h),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const ViewAccountScreen()));
                              },
                              child: buildProfileItem(
                                  'assets/images/home2.png', 'Add Account')),
                          SizedBox(height: 30.h),
                          GestureDetector(
                              onTap: () {
                                Utils.showWarningDialog('Are you sure to logout?',
                                    onAccept: (){
                                      profileController.signOut()
                                          .then((value) {
                                        Utils.showSnackBar(
                                            'You\'re logged out successfully');
                                      });
                                      Get.back();
                                    }
                                );
                              },
                              child: buildProfileItem(
                                  'assets/images/profile_logout.png',
                                  'Logout')),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 430.w,
                        height: 220.h,
                        child: Image.asset(
                          'assets/images/bottomflow.png',
                          fit: BoxFit.cover,
                        ))
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
