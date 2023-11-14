import 'package:finance_and_budget/controller/auth_controller.dart';
import 'package:finance_and_budget/view/authentication/widgets/background_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../utils/utils.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/normal_button.dart';
import 'package:get/get.dart';

import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  AuthController authController = Get.find();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  //late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();


    // Initialize the package
    // final remoteServerConfiguration = {
    //   "server": "https://vltajkttjkfkrvrvtycx.supabase.co",
    //   "serverKey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZsdGFqa3R0amtma3J2cnZ0eWN4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY1MDgwODgsImV4cCI6MjAxMjA4NDA4OH0._BeTdTp7GoyYFGjS-Lj68864F1T35xTAjsMF0OfK5zo"
    // };
    // emailAuth = EmailAuth(
    //   sessionName: "Sample session",
    // );

   // emailAuth.config(remoteServerConfiguration);
  }

  // void sendOtp() async {
  //   var res = await emailAuth.sendOtp(
  //       recipientMail: _emailController.text, otpLength: 4
  //   );
  //   if(res){
  //     print('Sent Otp');
  //   }else{
  //     print('We could not sent otp');
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb? Center(
      child: SizedBox(
        width: 600.w,
        child: BackgroundScreen(
          widget: Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                titleText('Forgot Password', authPage: true),
                SizedBox(height: 20.h),
                subTitleText('Email Address', authPage: true),
                customTextField(_emailController, icon: Icons.done, iconColor: green),
                SizedBox(height: 100.h),
                normalButton('Send', onPressed: () {
                  // sendOtp();
                  authController
                      .sendPasswordResetOTP(_emailController.text)
                      .then((value) {

                    Get.dialog(
                      AlertDialog(
                        backgroundColor: white,
                        title: const Row(
                          children: [
                            Icon(
                              Icons.warning,
                              color: secondaryTextColor,
                            ),
                            Text(' Warning!', style: TextStyle(color: black)),
                          ],
                        ),
                        content: const Text('Please check your email...', style: TextStyle(color: black)),
                        actions: [
                          TextButton(
                            onPressed: (){
                              Get.back();
                            },
                            child: const Text("Ok"),
                          ),
                        ],
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
            titleText('Forgot Password', authPage: true),
            SizedBox(height: 20.h),
            subTitleText('Email Address', authPage: true),
            customTextField(_emailController, icon: Icons.done, iconColor: green),
            SizedBox(height: 100.h),
            normalButton('Send', onPressed: () {
              // sendOtp();
              authController
                  .sendPasswordResetOTP(_emailController.text)
                  .then((value) {

                Get.dialog(
                  AlertDialog(
                    backgroundColor: white,
                    title: const Row(
                      children: [
                        Icon(
                          Icons.warning,
                          color: secondaryTextColor,
                        ),
                        Text(' Warning!', style: TextStyle(color: black)),
                      ],
                    ),
                    content: const Text('Please check your email...', style: TextStyle(color: black)),
                    actions: [
                      TextButton(
                        onPressed: (){
                          Get.back();
                        },
                        child: const Text("Ok"),
                      ),
                    ],
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
