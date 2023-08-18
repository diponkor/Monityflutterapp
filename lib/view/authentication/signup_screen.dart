import 'package:finance_and_budget/view/authentication/free_trial_screen.dart';
import 'package:finance_and_budget/view/authentication/signin_screen.dart';
import 'package:finance_and_budget/view/authentication/widgets/background_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/normal_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conPass = TextEditingController();

  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    fName.dispose();
    lName.dispose();
    email.dispose();
    pass.dispose();
    conPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      widget: Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 5.h),
        child: Column(
          children: [
            TabBar(
              controller: controller,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: primaryColor.withOpacity(0.1),
                        radius:10,
                        child: subTitleText('1',authPage: true,color: primaryColor),
                      ),SizedBox(width: 2.w),
                      subTitleText('Pesonal Info',authPage: true,
                          fontWeight: FontWeight.w700, color: blackTextColor2),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: primaryColor.withOpacity(0.1),
                        radius:10,
                        child: subTitleText('2',authPage: true,color: primaryColor),
                      ),SizedBox(width: 2.w),
                      subTitleText('Customer Info',authPage: true,
                          fontWeight: FontWeight.w700, color: blackTextColor2),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  firstPageSignUp(),
                  secondPageSignUp(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget firstPageSignUp() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        subTitleText('First Name',authPage: true),
        customTextField(fName),
        SizedBox(height: 10.h),
        subTitleText('Last Name',authPage: true),
        customTextField(lName),
        SizedBox(height: 10.h),
        subTitleText('Email',authPage: true),
        customTextField(email),
        SizedBox(height: 10.h),
        subTitleText('Password',authPage: true),
        customTextField(pass),
        SizedBox(height: 10.h),
        subTitleText('Confirm Password',authPage: true),
        customTextField(conPass),
        SizedBox(height: 20.h),
        normalButton('Next', onPressed: () {
          controller.index;
        }),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget secondPageSignUp() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        subTitleText('Company Name',authPage: true),
        customTextField(fName, icon: Icons.keyboard_arrow_down),
        SizedBox(height: 20.h),
        subTitleText('User Role',authPage: true),
        customTextField(lName, icon: Icons.keyboard_arrow_down),
        SizedBox(height: 120.h),
        normalButton('Sign Up', onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const FreeTrialScreen()));
        }),
        SizedBox(height: 80.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            subTitleText('Already have any account? ',authPage: true, color: blackTextColor2),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => const SigninScreen()));
                },
                child: subTitleText('Sign In',authPage: true, color: secondaryColor)),
          ],
        ),
      ],
    );
  }
}
