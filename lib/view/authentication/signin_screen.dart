import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/view/authentication/forgot_password_screen.dart';
import 'package:finance_and_budget/view/authentication/signup_screen.dart';
import 'package:finance_and_budget/view/authentication/widgets/background_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text_field.dart';
import 'package:finance_and_budget/view/custom_navigation_bar.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:finance_and_budget/view/global_widgets/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      widget: Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            titleText('Sign in',authPage: true),
            SizedBox(height: 20.h),
            subTitleText('Email Address',authPage: true),
            customTextField(email, icon: Icons.done, iconColor: green),
            SizedBox(height: 10.h),
            subTitleText('Password',authPage: true),
            customTextField(pass,
                icon: Icons.remove_red_eye_rounded, iconColor: blackTextColor),
            SizedBox(height: 10.h),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const ForgotPasswordScreen()));
                },
                child:
                    subTitleText('Forgot Password ?',authPage: true, color: secondaryColor)),
            SizedBox(height: 30.h),
            normalButton('Sign In', onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CustomNavigation()));
            }),
            SizedBox(height: 100.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                subTitleText('Don\'t have any account? ',authPage: true,
                    color: blackTextColor2),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SignupScreen()));
                    },
                    child: subTitleText('Sign up' ,authPage: true,color: secondaryColor)),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
