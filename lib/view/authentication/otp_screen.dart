import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/view/authentication/new_password_screen.dart';
import 'package:finance_and_budget/view/authentication/signup_screen.dart';
import 'package:finance_and_budget/view/authentication/widgets/background_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:finance_and_budget/view/global_widgets/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
          children: [
            titleText('OTP code',authPage: true),
            SizedBox(height: 20.h),
            subTitleText('We have send you a one time password on',authPage: true,
                color: blackTextColor2),
            subTitleText('Admin@gmail.com',authPage: true,
                color: blackTextColor, fontWeight: FontWeight.w800),
            SizedBox(height: 20.h),
            Form(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                SizedBox(
                  height: 50.h,
                  width: 49.5.h,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onSaved: (pin1){},
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    maxLength: 1,

                    decoration: InputDecoration(
                      counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        )),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  width: 49.5.h,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onSaved: (pin2){},
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    maxLength: 1,
                    decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        )),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  width: 49.5.h,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onSaved: (pin3){},
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    maxLength: 1,
                    decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        )),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  width: 49.5.h,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    onSaved: (pin3){},
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    maxLength: 1,
                    decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        )),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                const SizedBox()
              ],
            ),),
            SizedBox(height:30.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                subTitleText('Din\'t received OTP ! ',authPage: true,fontWeight: FontWeight.w400,
                    color: blackTextColor),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => SignupScreen()));
                    },
                    child: subTitleText('Resend Again',authPage: true, color: primaryColor)),
              ],
            ),
            SizedBox(height:50.h),

            normalButton('Submit',onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const NewPassowrdScreen()));
            }),
          ],
        ),
      ),
    );
  }
}
