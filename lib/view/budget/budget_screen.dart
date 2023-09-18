import 'package:finance_and_budget/view/budget/create_budget.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../controller/budget_controller.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_card.dart';
import 'budget_view_screen.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  static final BudgetController _budgetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                _budgetController.budgetList.isEmpty
                    ? Column(
                        children: [
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
                        ],
                      )
                    : GetBuilder<BudgetController>(
                        id: 'updateBudList',
                        builder: (controller) {
                          return Column(
                            children: [
                              for (int i = 0;
                                  i < controller.budgetList.length;
                                  i++)
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                BudgetViewScreen(index: i)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: customCard(
                                        118.h,
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 80.h,
                                                width: 70.w,
                                                decoration: BoxDecoration(
                                                    color: primaryColor
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                14.r))),
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 15.0),
                                                    child: Image.asset(
                                                        'assets/images/home_vector.png',
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 20.w),
                                              SizedBox(
                                                width: 250.w,
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          titleText(
                                                              controller
                                                                  .budgetList[i]
                                                                  .budgetName,
                                                              color:
                                                                  blackTextColor,
                                                              size: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          subTitleText('80.00%',
                                                              size: 10)
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          subTitleText(
                                                              controller
                                                                  .budgetList[i]
                                                                  .date,
                                                              size: 10)
                                                        ],
                                                      ),
                                                      Stack(
                                                        children: [
                                                          Container(
                                                            height: 8.h,
                                                            width:
                                                                double.infinity,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(10
                                                                            .r)),
                                                                color: secondaryTextColor
                                                                    .withOpacity(
                                                                        0.2)),
                                                          ),
                                                          Container(
                                                            height: 8.h,
                                                            width: 177.w,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(10
                                                                            .r)),
                                                                color:
                                                                    primaryColor),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          subTitleText(
                                                              '20\$ to go',
                                                              size: 10),
                                                          subTitleText(
                                                              '\$ ${controller.budgetList[i].amount}',
                                                              size: 10),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                            ],
                          );
                        }),
                SizedBox(height: 60.h)
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            right: 10,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CreateBudget()));
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
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50.r))),
                    child: const Icon(Icons.add, color: blackTextColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
