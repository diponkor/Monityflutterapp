import 'package:email_otp/email_otp.dart';
import 'package:finance_and_budget/controller/auth_controller.dart';
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
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  //late EmailAuth emailAuth;

  @override
  void initState() {
    EmailOTP myauth = EmailOTP();
    super.initState();

    myauth.setSMTP(
        host: "monityapp@gmail.com",
        auth: true,
        username: "monityapp@gmail.com",
        password: "rajibtalukder1234567890",
        secure: "TLS",
        port: 576
    );

    myauth.setConfig(
        appEmail: "monityapp@gmail.com",
        appName: "Monity",
        userEmail: _emailController.text,
        otpLength: 4,
        otpType: OTPType.digitsOnly
    );
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
    return BackgroundScreen(
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
            normalButton('Sign In', onPressed: () {
             // sendOtp();
            //   authController
            //       .sendPasswordResetOTP(_emailController.text)
            //       .then((value) {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (_) => const OtpScreen()));
            //   });
            }),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
