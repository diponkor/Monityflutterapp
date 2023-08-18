import 'package:finance_and_budget/view/budget/create_budget.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h), child: const CustomAppbar(),
      ),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: titleText('Budget',
                      size: 25, color: titleTextColor, authPage: true),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: subTitleText(
                      'Having  multiple Budget to aspire to is a great way to learn \nhow to money manage!',
                      authPage: true,
                      color: secondaryTextColor,
                      size: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 282.h,
                width: 282.w,
                child: Image.asset('assets/images/budget.png'),
              ),
              SizedBox(height: 10.h),
              titleText('Add More Budget',
                  size: 25, color: titleTextColor, authPage: true),
              SizedBox(height: 10.h),

              subTitleText(
                  'Having  multiple Budget to aspire to is a great \nway to learn how to money manage!',
                  authPage: true,
                  color: secondaryTextColor,
                  fontWeight: FontWeight.w400),

              SizedBox(height: 130.h),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const CreateBudget()));
                    },
                    child: Container(
                        height:56.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        borderRadius: BorderRadius.all(Radius.circular(50.r))
                      ),
                      child: const Icon(Icons.add,color: blackTextColor),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
