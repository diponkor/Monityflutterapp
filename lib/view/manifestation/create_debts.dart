import 'package:finance_and_budget/view/manifestation/debts_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/normal_button.dart';
import '../global_widgets/single_text_field.dart';

class CreateDebts extends StatelessWidget {
  const CreateDebts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h), child: const CustomAppbar(),
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
                        titleText('What debt do you have?',
                            color: titleTextColor, size: 25, authPage: true),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  subTitleText('Debt Name',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: TextEditingController(),
                      hintText: 'Debt Name'),
                  SizedBox(height: 15.h),
                  subTitleText('Choose Popular debt'),
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
                          child: subTitleText('Bank Loan',fontWeight: FontWeight.w500),
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
                          child: subTitleText('Car Loan',fontWeight: FontWeight.w500),
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
                          child: subTitleText('Mortgage',color: white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  subTitleText('Interest Rate',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: TextEditingController(), hintText: 'ex:-  200'),
                  SizedBox(height: 15.h),
                  subTitleText('How much remaining debt do you have ?',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: TextEditingController(),
                      hintText: 'ex:-  200'),
                  SizedBox(height: 15.h),
                  subTitleText('Monthly Payment ',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: TextEditingController(),
                      hintText: 'Monthly'),

                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.center,
                    child: subTitleText('Or',
                        color: secondaryTextColor.withOpacity(0.8)),
                  ),
                  SizedBox(height: 15.h),
                  subTitleText('Target Date',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: TextEditingController(),
                      icon: true,
                      hintText: 'Ex. - 30 JUNE 2023'),
                  SizedBox(height: 20.h),
                  normalButton('Next', onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const DebtsItemScreen()));
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
