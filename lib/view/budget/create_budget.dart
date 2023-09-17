import 'package:finance_and_budget/view/budget/budget_item_screen.dart';
import 'package:finance_and_budget/view/budget/widgets/double_text_field.dart';
import 'package:finance_and_budget/view/global_widgets/single_text_field.dart';
import 'package:finance_and_budget/view/global_widgets/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';

class CreateBudget extends StatelessWidget {
  const CreateBudget({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  titleText('Budget',
                      size: 30, color: titleTextColor, authPage: true),
                  SizedBox(height: 10.h),
                  subTitleText(
                      'Let\'s say the user\'s total monthly income is '),
                  SizedBox(height: 10.h),
                  subTitleText('Budget Name',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: TextEditingController(),
                      hintText: 'Budget Name'),
                  SizedBox(height: 10.h),
                  subTitleText('Start Date & End Date',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: TextEditingController(),
                      icon: true,
                      hintText: '30 JUNE 2023 - 30 JULY 2023'),
                  SizedBox(height: 10.h),
                  subTitleText('Income',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: TextEditingController(), hintText: 'Income'),
                  SizedBox(height: 10.h),
                  subTitleText('Fixed Expense',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  doubleTextField(
                      icon: Icons.add,
                      controller: TextEditingController(),
                      hintText1: 'Fixed Name',
                      hintText2: 'Fixed Expense',
                      iconBgColor: primaryColor),
                  SizedBox(height: 15.h),
                  doubleTextField(
                      icon: Icons.remove,
                      controller: TextEditingController(),
                      hintText1: 'Fixed Name',
                      hintText2: 'Fixed Expense',
                      iconBgColor: extraColor),
                  SizedBox(height: 10.h),
                  subTitleText('Variable Expense',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  doubleTextField(
                      icon: Icons.add,
                      controller: TextEditingController(),
                      hintText1: 'Variable Name',
                      hintText2: 'Variable Expense',
                      iconBgColor: primaryColor),
                  SizedBox(height: 10.h),
                  subTitleText('Sinking Funds',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  doubleTextField(
                      icon: Icons.add,
                      controller: TextEditingController(),
                      hintText1: 'Sinking Name',
                      hintText2: 'Sinking Funds',
                      iconBgColor: primaryColor),
                  SizedBox(height: 15.h),
                  normalButton('Next', onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const BudgetItemScreen()));
                  }),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
