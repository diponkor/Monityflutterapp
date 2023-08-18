import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

Widget profileImage() {
  return Stack(
    children: [
      CircleAvatar(
        radius: 50.r,
        child: Image.asset('assets/images/girl_img.png', fit: BoxFit.contain),
      ),
      Positioned(
        bottom: 0.h,
        right: 0.w,
        child: CircleAvatar(
          radius: 22.r,
          backgroundColor: white,
          child: CircleAvatar(
            backgroundColor: Color(0xff928FFF),
            radius: 20.r,
            child: Icon(Icons.camera_alt, color: white),
          ),
        ),
      ),
    ],
  );
}
