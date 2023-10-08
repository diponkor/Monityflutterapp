import 'package:finance_and_budget/view/global_widgets/custom_text_field.dart';
import 'package:finance_and_budget/view/global_widgets/single_text_field.dart';
import 'package:finance_and_budget/view/splash/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';

class ManuallyTransactionScreen extends StatelessWidget {
  const ManuallyTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              titleText('Manually Add Transaction',
                  size: 25, color: titleTextColor, authPage: true),
              SizedBox(height: 20.h),
              subTitleText('Transaction Type',size: 18),
              SizedBox(height: 10.h),
              singleTextField(hintText: 'Selected Option'),
              SizedBox(height: 20.h),
              subTitleText('Name',size: 18),
              SizedBox(height: 10.h),
              singleTextField(hintText: 'Name'),
              SizedBox(height: 20.h),
              subTitleText('Amount',size: 18),
              SizedBox(height: 10.h),
              singleTextField(hintText: 'ex:-  200'),
              SizedBox(height: 20.h),
              subTitleText('Bank',size: 18),
              SizedBox(height: 10.h),
              singleTextField(hintText: 'Selected Option'),
              SizedBox(height: 200.h),
              customButton(text: 'Submit'),

            ],
          ),
        ),
      ),
    );
  }
}
