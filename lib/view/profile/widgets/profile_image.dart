import 'dart:io';

import 'package:finance_and_budget/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/colors.dart';

Widget profileImage() {
  return GetBuilder<ProfileController>(
    id: 'imgPathUpdate',
    builder: (controller) {
      return Stack(
        children: [
          Container(
            height: 110.h,
            width: 110.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50.r))),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: Image.file(File(controller.imagePath), fit: BoxFit.cover)),
          ),
          Positioned(
            bottom: 0.h,
            right: 0.w,
            child: GestureDetector(
              onTap: () {
                controller.pickedImage(ImageSource.gallery);
              },
              child: CircleAvatar(
                radius: 22.r,
                backgroundColor: white,
                child: CircleAvatar(
                  backgroundColor: const Color(0xff928FFF),
                  radius: 20.r,
                  child: const Icon(Icons.camera_alt, color: white),
                ),
              ),
            ),
          ),
        ],
      );
    }
  );
}
