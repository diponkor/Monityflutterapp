import 'package:finance_and_budget/view/authentication/widgets/background_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/normal_button.dart';

class NewPassowrdScreen extends StatefulWidget {
  const NewPassowrdScreen({super.key});

  @override
  State<NewPassowrdScreen> createState() => _NewPassowrdScreenState();
}

class _NewPassowrdScreenState extends State<NewPassowrdScreen> {
  TextEditingController newPass = TextEditingController();
  TextEditingController conPass = TextEditingController();

  @override
  void dispose() {
    newPass.dispose();
    conPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb?Center(
      child: SizedBox(
        width: 600.w,
        child: BackgroundScreen(
          widget: Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                titleText('New Password', authPage: true),
                SizedBox(height: 20.h),
                subTitleText('New Password', authPage: true),
                customTextField(newPass, icon: Icons.done, iconColor: green),
                SizedBox(height: 20.h),
                subTitleText('Confirm Password', authPage: true),
                customTextField(conPass, icon: Icons.done, iconColor: green),
                SizedBox(height: 100.h),
                normalButton('Sign In', onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          content: Container(
                            height: 280.h,
                            width: 200.w,
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/Group 68.png',
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                                  child: subTitleText('Password Changed !',
                                      authPage: true, color: blackTextColor2),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                                  child: subTitleText(
                                      'Your password has changed successfully',
                                      authPage: true,
                                      size: 15,
                                      color: secondaryTextColor),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    ): BackgroundScreen(
      widget: Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            titleText('New Password', authPage: true),
            SizedBox(height: 20.h),
            subTitleText('New Password', authPage: true),
            customTextField(newPass, icon: Icons.done, iconColor: green),
            SizedBox(height: 20.h),
            subTitleText('Confirm Password', authPage: true),
            customTextField(conPass, icon: Icons.done, iconColor: green),
            SizedBox(height: 100.h),
            normalButton('Sign In', onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: Container(
                        height: 280.h,
                        width: 200.w,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/Group 68.png',
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: subTitleText('Password Changed !',
                                  authPage: true, color: blackTextColor2),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: subTitleText(
                                  'Your password has changed successfully',
                                  authPage: true,
                                  size: 15,
                                  color: secondaryTextColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
