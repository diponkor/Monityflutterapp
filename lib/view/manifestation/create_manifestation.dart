import 'package:finance_and_budget/view/manifestation/milestone_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/single_text_field.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/normal_button.dart';

class CreateManifestation extends StatefulWidget {
  const CreateManifestation({super.key});

  @override
  State<CreateManifestation> createState() => _CreateManifestationState();
}

class _CreateManifestationState extends State<CreateManifestation> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 35.h,
                          width: 37.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: titleTextColor,
                                width: 1,
                              ),
                              color: white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.r))),
                          child: const Icon(Icons.arrow_back),
                        ),
                        SizedBox(width: 10.w),
                        titleText('Manifestation & Goals',
                            color: titleTextColor, size: 25, authPage: true),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  subTitleText('What are you aspiring for?',
                      color: titleTextColor, size: 20),
                  SizedBox(height: 20.h),
                  subTitleText('Name your goal',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: TextEditingController(),
                      hintText: 'Name your goal'),
                  SizedBox(height: 20.h),
                  subTitleText('Choose Popular goals'),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Container(
                        height: 40.h,
                        width: 122.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: blackTextColor, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r))),
                        child: Center(
                          child: subTitleText('Home Loan',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        height: 40.h,
                        width: 122.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: blackTextColor, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r))),
                        child: Center(
                          child: subTitleText('Car Loan',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Container(
                        height: 40.h,
                        width: 122.w,
                        decoration: BoxDecoration(
                            color: blackTextColor,
                            border: Border.all(color: blackTextColor, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r))),
                        child: Center(
                          child: subTitleText('Mortgage',
                              color: white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  subTitleText('Amount',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: TextEditingController(), hintText: 'Amount'),
                  SizedBox(height: 20.h),
                  subTitleText('By when',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: TextEditingController(),
                      icon: true,
                      hintText: 'Ex. - 30 JUNE 2023'),
                  SizedBox(height: 20.h),
                  subTitleText('Bank',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: TextFormField(
                        onChanged: (text) async {},
                        onEditingComplete: () async {},
                        keyboardType: TextInputType.text,
                        controller: TextEditingController(),
                        style: TextStyle(fontSize: 18.h, color: blackTextColor),
                        decoration: InputDecoration(
                          fillColor: white,
                          suffixIcon: const Icon(Icons.keyboard_arrow_down,
                              color: secondaryTextColor),
                          hintText: 'Selected Option',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: blackTextColor,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: blackTextColor,
                              )),
                          hintStyle: TextStyle(
                              fontSize: 18.sp, color: secondaryTextColor),
                        )),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (newBool) {
                            setState(() {
                              isChecked = newBool;
                            });
                          },
                        ),
                      ),
                      subTitleText(
                        'Do you want to create a sinking fund for this \ngoal',
                        size: 16,
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  normalButton('Next', onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const MilestoneScreen()));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
