import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text_field.dart';
import 'package:finance_and_budget/view/global_widgets/normal_button.dart';
import 'package:finance_and_budget/view/profile/widgets/profile_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/profile_controller.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/named_back_button.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  static ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController fName =
        TextEditingController(text: profileController.userData?.firstName);
    TextEditingController lName =
        TextEditingController(text: profileController.userData?.lastName);
    TextEditingController email =
        TextEditingController(text: profileController.userData?.email);

    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb?Center(
      child: SizedBox(
        width: 600.w,
        child: Scaffold(
          backgroundColor: profileBgColor,
          body: SafeArea(
            child: Stack(
              children: [
                ListView(
                  children: [
                    SizedBox(height: 10.h),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                      child: namedBackButton(context, text: 'Profile Edit'),
                    ),
                    SizedBox(
                      height: 125.h,
                    ),
                    Container(
                        height: 630.h,
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.r),
                                topRight: Radius.circular(40.r))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  subTitleText('First Name', authPage: true),
                                  customTextField(fName),
                                  SizedBox(height: 10.h),
                                  subTitleText('Last Name', authPage: true),
                                  customTextField(lName),
                                  SizedBox(height: 10.h),
                                  // subTitleText('Email', authPage: true),
                                  // customTextField(email, enabled: false)
                                ],
                              ),
                            ),
                            const SizedBox(),
                            Padding(
                              padding: EdgeInsets.only(bottom: 40.0.h),
                              child: normalButton('Save', onPressed: () {
                                profileController.updateProfileData(
                                    fName.text, lName.text);
                              }),
                            ),
                          ],
                        ))
                  ],
                ),
                Positioned(
                    top: 130.h,
                    left: 170.w,
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(Radius.circular(50.r)),
                      child:kIsWeb?const SizedBox(): profileImage(),
                    )),
              ],
            ),
          ),
        ),
      ),
    ): Scaffold(
      backgroundColor: profileBgColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(height: 10.h),
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                  child: namedBackButton(context, text: 'Profile Edit'),
                ),
                SizedBox(
                  height: 125.h,
                ),
                Container(
                    height: 630.h,
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.r),
                            topRight: Radius.circular(40.r))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              subTitleText('First Name', authPage: true),
                              customTextField(fName),
                              SizedBox(height: 10.h),
                              subTitleText('Last Name', authPage: true),
                              customTextField(lName),
                              SizedBox(height: 10.h),
                              // subTitleText('Email', authPage: true),
                              // customTextField(email, enabled: false)
                            ],
                          ),
                        ),
                        const SizedBox(),
                        Padding(
                          padding: EdgeInsets.only(bottom: 40.0.h),
                          child: normalButton('Save', onPressed: () {
                            profileController.updateProfileData(
                                fName.text, lName.text);
                          }),
                        ),
                      ],
                    ))
              ],
            ),
            Positioned(
                top: 130.h,
                left: 170.w,
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.all(Radius.circular(50.r)),
                  child:kIsWeb?const SizedBox(): profileImage(),
                )),
          ],
        ),
      ),
    );
  }
}
