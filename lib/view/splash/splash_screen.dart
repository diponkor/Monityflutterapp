import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/view/splash/intro_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: AnimatedSplashScreen(
        splash: Center(
          child: SizedBox(
            height: 180.h,
            width: 160.w,
            child: Image.asset("assets/images/monity.png"),
          ),
        ),
        nextScreen: const IntroOne(),
        splashIconSize: 1000.sp,
        splashTransition: SplashTransition.fadeTransition,
        duration: 2000,
        animationDuration: const Duration(seconds: 1),
      ),
    );
  }
}
