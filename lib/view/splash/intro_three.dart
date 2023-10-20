import 'package:finance_and_budget/view/splash/widgets/custom_button.dart';
import 'package:finance_and_budget/view/authentication/signin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroThree extends StatelessWidget {
  const IntroThree({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb?Center(
      child: SizedBox(
        width: 600.w,
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child:
                  Image.asset('assets/images/intro3.png', fit: BoxFit.cover)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const SigninScreen()));
                      },
                      child: customButton(text: 'Let\'s Go')),
                ),
              ),
            ],
          ),
        ),
      ),
    ): Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child:
                  Image.asset('assets/images/intro3.png', fit: BoxFit.cover)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const SigninScreen()));
                  },
                  child: customButton(text: 'Let\'s Go')),
            ),
          ),
        ],
      ),
    );
  }
}
