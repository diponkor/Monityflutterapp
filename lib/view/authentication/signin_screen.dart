import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/utils/utils.dart';
import 'package:finance_and_budget/view/authentication/forgot_password_screen.dart';
import 'package:finance_and_budget/view/authentication/signup_screen.dart';
import 'package:finance_and_budget/view/authentication/widgets/background_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text_field.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:finance_and_budget/view/global_widgets/normal_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/auth_controller.dart';
import 'package:get/get.dart';

import '../custom_navigation_bar.dart';
import '../web_navigation.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  AuthController authController = Get.put(AuthController());

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb?Center(
      child: SizedBox(
        width: 600.w,
        child: BackgroundScreen(
          widget:
          // authController.isLoading.value == true
          //     ? Center(child: CircularProgressIndicator()) :
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                titleText('Sign in', authPage: true),
                SizedBox(height: 20.h),
                subTitleText('Email Address', authPage: true),
                customTextField(email, icon: Icons.done, iconColor: green),
                SizedBox(height: 10.h),
                subTitleText('Password', authPage: true),
                GetBuilder<AuthController>(
                    id: 'passUpdate',
                    builder: (context) {
                      return customTextField(
                        pass,
                        icon: authController.passHide.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        obscureText: authController.passHide.value,
                        onPressIcon: () {
                          authController.passValueChange();
                        },
                        iconColor: blackTextColor,
                      );
                    }),
                SizedBox(height: 10.h),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ForgotPasswordScreen()));
                    },
                    child: subTitleText('Forgot Password ?',
                        authPage: true, color: secondaryColor)),
                SizedBox(height: 30.h),
                normalButton('Sign In', onPressed: () {
                  if (email.text.isNotEmpty && pass.text.isNotEmpty) {
                    authController.signIn(email.text, pass.text).then((value) {
                      if(value){
                        Get.offAll(const WebNavigation());
                      }

                    });
                  } else {
                    Utils.showSnackBar('Input Fields is required!');
                  }
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (_) => const CustomNavigation()));
                }),
                SizedBox(height: 100.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    subTitleText('Don\'t have any account? ',
                        authPage: true, color: blackTextColor2),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => SignupScreen()));
                        },
                        child: subTitleText('Sign up',
                            authPage: true, color: secondaryColor)),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    ): BackgroundScreen(
      widget:
          // authController.isLoading.value == true
          //     ? Center(child: CircularProgressIndicator()) :
          Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            titleText('Sign in', authPage: true),
            SizedBox(height: 20.h),
            subTitleText('Email Address', authPage: true),
            customTextField(email, icon: Icons.done, iconColor: green),
            SizedBox(height: 10.h),
            subTitleText('Password', authPage: true),
            GetBuilder<AuthController>(
                id: 'passUpdate',
                builder: (context) {
                  return customTextField(
                    pass,
                    icon: authController.passHide.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    obscureText: authController.passHide.value,
                    onPressIcon: () {
                      authController.passValueChange();
                    },
                    iconColor: blackTextColor,
                  );
                }),
            SizedBox(height: 10.h),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const ForgotPasswordScreen()));
                },
                child: subTitleText('Forgot Password ?',
                    authPage: true, color: secondaryColor)),
            SizedBox(height: 30.h),
            normalButton('Sign In', onPressed: () {
              if (email.text.isNotEmpty && pass.text.isNotEmpty) {
                authController.signIn(email.text, pass.text).then((value) {
                  if(value){
                    Get.offAll(const CustomNavigation());
                  }
                });
              } else {
                Utils.showSnackBar('Input Fields is required!');
              }
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (_) => const CustomNavigation()));
            }),
            SizedBox(height: 100.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                subTitleText('Don\'t have any account? ',
                    authPage: true, color: blackTextColor2),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SignupScreen()));
                    },
                    child: subTitleText('Sign up',
                        authPage: true, color: secondaryColor)),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
