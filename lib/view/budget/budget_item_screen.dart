import 'package:finance_and_budget/view/budget/budget_view_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';

class BudgetItemScreen extends StatelessWidget {
  const BudgetItemScreen({super.key});

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
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const BudgetViewScreen()));
                },
                child: customCard(
                    118.h,
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          Container(
                            height: 80.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14.r))),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Image.asset('assets/images/home_vector.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          SizedBox(
                            width: 250.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    titleText('Car loan',color: blackTextColor,size: 24,fontWeight: FontWeight.w400),
                                    subTitleText('80.00%',size: 10)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    subTitleText('13/12/2023',size: 10)
                                  ],
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 8.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.r)),
                                          color: secondaryTextColor
                                              .withOpacity(0.2)),
                                    ),
                                    Container(
                                      height: 8.h,
                                      width: 177.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.r)),
                                          color: primaryColor),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    subTitleText('20\$ to go',size: 10),
                                    subTitleText('\$ 300',size: 10),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              SizedBox(height: 400.h),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (_) => CreateBudget()));
                    },
                    child: Container(
                      height: 56.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  const Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.r))),
                      child: const Icon(Icons.add, color: blackTextColor),
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
