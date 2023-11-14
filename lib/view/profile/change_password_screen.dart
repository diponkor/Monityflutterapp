import 'package:finance_and_budget/controller/profile_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/custom_text_field.dart';
import '../global_widgets/named_back_button.dart';
import '../global_widgets/normal_button.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  static final ProfileController _profileController = Get.find();

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController oldPass;
  late TextEditingController newPass;
  late TextEditingController confirmNewPass;

  @override
  void initState() {
    oldPass = TextEditingController();
    newPass = TextEditingController();
    confirmNewPass = TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb? Center(
      child: SizedBox(
        width: 600.w,
        child: Scaffold(
          backgroundColor: profileBgColor,
          body: SafeArea(
            child: ListView(
              children: [
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                  child: namedBackButton(context, text: 'Change Password'),
                ),
                SizedBox(
                  height: 155.h,
                ),
                Container(
                    height: 600.h,
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.r),
                            topRight: Radius.circular(40.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        titleText('Change Password', authPage: true),
                        SizedBox(height: 30.h),
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              subTitleText('Old Password', authPage: true),
                              customTextField(oldPass),
                              SizedBox(height: 10.h),
                              subTitleText('New Password', authPage: true),
                              customTextField(newPass),
                              SizedBox(height: 10.h),
                              subTitleText('Confirm Password', authPage: true),
                              customTextField(confirmNewPass),
                              SizedBox(height: 50.h),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 40.0.h),
                          child: normalButton('Save', onPressed: () async {
                            await ChangePasswordScreen._profileController.changePassword(
                              email: ChangePasswordScreen._profileController.currentUser?.email.toString(),
                              newPassword: newPass.text,
                              oldPassword: oldPass.text,
                            );
                            oldPass.clear();
                            newPass.clear();
                            confirmNewPass.clear();
                          }),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    ): Scaffold(
      backgroundColor: profileBgColor,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
              child: namedBackButton(context, text: 'Change Password'),
            ),
            SizedBox(
              height: 155.h,
            ),
            Container(
                height: 600.h,
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    titleText('Change Password', authPage: true),
                    SizedBox(height: 30.h),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          subTitleText('Old Password', authPage: true),
                          customTextField(oldPass),
                          SizedBox(height: 10.h),
                          subTitleText('New Password', authPage: true),
                          customTextField(newPass),
                          SizedBox(height: 10.h),
                          subTitleText('Confirm Password', authPage: true),
                          customTextField(confirmNewPass),
                          SizedBox(height: 50.h),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40.0.h),
                      child: normalButton('Save', onPressed: () async {
                        await ChangePasswordScreen._profileController.changePassword(
                          email: ChangePasswordScreen._profileController.currentUser?.email.toString(),
                          newPassword: newPass.text,
                          oldPassword: oldPass.text,
                        );
                        oldPass.clear();
                        newPass.clear();
                        confirmNewPass.clear();
                      }),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
