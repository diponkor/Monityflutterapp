import 'package:finance_and_budget/model/create_budget_model.dart';
import 'package:finance_and_budget/view/budget/widgets/double_text_field.dart';
import 'package:finance_and_budget/view/global_widgets/single_text_field.dart';
import 'package:finance_and_budget/view/global_widgets/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../controller/budget_controller.dart';
import '../../utils/utils.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';

class CreateBudget extends StatefulWidget {
  const CreateBudget({super.key});

  @override
  State<CreateBudget> createState() => _CreateBudgetState();
}

class _CreateBudgetState extends State<CreateBudget> {
  BudgetController budgetController = Get.find();
  final TextEditingController _budgetName = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _income = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _fixedName = TextEditingController();
  final TextEditingController _fixedExp = TextEditingController();
  final TextEditingController _varName = TextEditingController();
  final TextEditingController _varExp = TextEditingController();
  final TextEditingController _sinkName = TextEditingController();
  final TextEditingController _sinkFunds = TextEditingController();

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
                      controller: _budgetName, hintText: 'Budget Name'),
                  SizedBox(height: 10.h),
                  subTitleText('Start Date & End Date',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: _date,
                      //icon: true,
                      hintText: '30 JUNE 2023 - 30 JULY 2023'),
                  SizedBox(height: 10.h),
                  subTitleText('Income',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  doubleTextField(
                      icon: Icons.add,
                      controller1: _income,
                      controller2: _amount,
                      hintText1: 'Income',
                      hintText2: 'Amount',
                      iconBgColor: primaryColor),
                  SizedBox(height: 10.h),
                  subTitleText('Fixed Expense',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  doubleTextField(
                      icon: Icons.add,
                      controller1: _fixedName,
                      controller2: _fixedExp,
                      hintText1: 'Fixed Name',
                      hintText2: 'Fixed Expense',
                      iconBgColor: primaryColor),
                  SizedBox(height: 15.h),
                  // doubleTextField(
                  //     icon: Icons.remove,
                  //     controller: TextEditingController(),
                  //     hintText1: 'Fixed Name',
                  //     hintText2: 'Fixed Expense',
                  //     iconBgColor: extraColor),
                  // SizedBox(height: 10.h),
                  subTitleText('Variable Expense',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  doubleTextField(
                      icon: Icons.add,
                      controller1: _varName,
                      controller2: _varExp,
                      hintText1: 'Variable Name',
                      hintText2: 'Variable Expense',
                      iconBgColor: primaryColor),
                  SizedBox(height: 10.h),
                  subTitleText('Sinking Funds',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  doubleTextField(
                      icon: Icons.add,
                      controller1: _sinkName,
                      controller2: _sinkFunds,
                      hintText1: 'Sinking Name',
                      hintText2: 'Sinking Funds',
                      iconBgColor: primaryColor),
                  SizedBox(height: 15.h),
                  normalButton('Next', onPressed: () async {
                    if (_budgetName.text.isNotEmpty &&
                        _date.text.isNotEmpty &&
                        _income.text.isNotEmpty &&
                        _amount.text.isNotEmpty &&
                        _fixedName.text.isNotEmpty &&
                        _fixedExp.text.isNotEmpty &&
                        _varName.text.isNotEmpty &&
                        _varExp.text.isNotEmpty &&
                        _sinkName.text.isNotEmpty &&
                        _sinkFunds.text.isNotEmpty) {
                      final budget = CreateBudgetModel(
                        _budgetName.text,
                        _date.text,
                        _income.text,
                        _amount.text,
                        _fixedName.text,
                        _fixedExp.text,
                        _varName.text,
                        _varExp.text,
                        _sinkName.text,
                        _sinkFunds.text,
                      );
                      await budgetController.createBudget(budget).then((value) {
                        Navigator.of(context).pop();
                      });
                    }else{
                      Utils.showSnackBar('Input Fields is required!');
                    }
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
