import 'package:finance_and_budget/view/profile/view_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/custom_text_field.dart';
import '../global_widgets/named_back_button.dart';
import '../global_widgets/normal_button.dart';

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: profileBgColor,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
              child: namedBackButton(context, text: 'Add Account'),
            ),
            SizedBox(
              height: 155.h,
            ),
            Container(
                height: 600.h,
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.h),
                    titleText('Add New Account', authPage: true),
                    SizedBox(height: 30.h),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          subTitleText('Name of the Bank', authPage: true),
                          customTextField(TextEditingController()),
                          SizedBox(height: 10.h),
                          subTitleText('Account Number', authPage: true),
                          customTextField(TextEditingController()),
                          SizedBox(height: 10.h),
                          subTitleText('IFSC Number', authPage: true),
                          customTextField(TextEditingController()),
                          SizedBox(height: 50.h),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40.0.h),
                      child: normalButton('Add Account',onPressed: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const ViewAccountScreen()));
                      }),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
