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
   final BudgetController _budgetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 80.h),
        child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CreateBudget()));
            },
            backgroundColor: white,
            child: const Icon(Icons.add, color: blackTextColor)),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: GetBuilder<BudgetController>(
              id: 'updateBudList',
              builder: (con) {
                return Column(
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
                    _budgetController.addBudgetList.isEmpty
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
                              i < controller.addBudgetList.length;
                              i++)
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                BudgetViewScreen(index: i)));
                                    _budgetController.getTotalIncomeData(i);
                                    _budgetController.getTotalFixedExpenseData(i);
                                    _budgetController.getTotalVarExpenseData(i);
                                    _budgetController.getTotalSinkFundData(i);
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
                                              SizedBox(width: 10.w),
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
                                                                  .addBudgetList[i]
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
                                                                  .addBudgetList[i]
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
                                                              '${controller
                                                                  .addBudgetList[i].id} \$ to go',
                                                              size: 10),
                                                          subTitleText(
                                                              'Amount',
                                                              size: 10),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.w),
                                              InkWell(
                                                onTap: () {
                                                  //Get.to(CreateBudget(budgetIndex: i,));
                                                },
                                                child: Container(
                                                    height: 30.h,
                                                    width: 30.w,
                                                    decoration: BoxDecoration(
                                                      color: bgWhite,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          50.r),
                                                    ),
                                                    child: const Icon(
                                                        Icons.edit,
                                                        color: primaryColor,
                                                        size: 18)),
                                              ),
                                              SizedBox(width: 10.w),
                                              InkWell(
                                                onTap: () {
                                                  _budgetController.deleteBudget(i);
                                                },
                                                child: Container(
                                                    height: 30.h,
                                                    width: 30.w,
                                                    decoration: BoxDecoration(
                                                      color: bgWhite,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          50.r),
                                                    ),
                                                    child: const Icon(
                                                        Icons.delete_outline,
                                                        color: red,
                                                        size: 18)),
                                              ),
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
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
