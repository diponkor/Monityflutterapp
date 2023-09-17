import 'package:finance_and_budget/controller/auth_controller.dart';
import 'package:finance_and_budget/view/authentication/otp_screen.dart';
import 'package:finance_and_budget/view/authentication/widgets/background_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/normal_button.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  AuthController authController = Get.find();
  TextEditingController forgotPass = TextEditingController();

  @override
  void dispose() {
    forgotPass.dispose();
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
            titleText('Forgot Password', authPage: true),
            SizedBox(height: 20.h),
            subTitleText('Email Address', authPage: true),
            customTextField(forgotPass, icon: Icons.done, iconColor: green),
            SizedBox(height: 100.h),
            normalButton('Sign In', onPressed: () {
              authController
                  .sendPasswordResetOTP(forgotPass.text)
                  .then((value) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const OtpScreen()));
              });
            }),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
