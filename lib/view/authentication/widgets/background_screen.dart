import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget widget;
  const BackgroundScreen({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      body: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: 200.h,
              child: Center(
                child: SizedBox(
                    height: 169.h,
                    width: 171.w,
                    child: Image.asset('assets/images/monity.png')),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r)),
              ),
              height: 686.h,
              width:double.infinity,
              child: widget,
            ),
          )
        ],
      ),
    );
  }
}
