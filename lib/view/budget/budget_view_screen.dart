import 'package:finance_and_budget/controller/budget_controller.dart';
import 'package:finance_and_budget/view/budget/widgets/custom_expence.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_card.dart';

class BudgetViewScreen extends StatefulWidget {
  final int index;

  const BudgetViewScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<BudgetViewScreen> createState() => _BudgetViewScreenState();
}

class _BudgetViewScreenState extends State<BudgetViewScreen>
    with SingleTickerProviderStateMixin {
  static final BudgetController budgetController = Get.find();
  late TabController controller;
  double intValue = 0;
  var currentIndex;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    currentIndex = widget.index;
    // var totalExp = int.parse(_budgetController.budgetList[currentIndex].fixedExp) +
    //     int.parse(_budgetController.budgetList[currentIndex].variableExp)+
    //     int.parse(_budgetController.budgetList[currentIndex].sinkingFunds) ;
    return screenWidth > 730 && kIsWeb
        ? Center(
            child: SizedBox(
              width: 600.w,
              child: Scaffold(
                  backgroundColor: bgWhite,
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(107.h),
                    child: const CustomAppbar(),
                  ),
                  body: SingleChildScrollView(
                    child: Column(children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20.0.h, 20.h, 20.h, 0.h),
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
                                  titleText(
                                      budgetController
                                          .addBudgetList[currentIndex].budgetName,
                                      color: titleTextColor,
                                      size: 25,
                                      authPage: true),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Container(
                            height: 50.h,
                            color: white,
                            child: TabBar(
                              physics: const BouncingScrollPhysics(),
                              controller: controller,
                              isScrollable: true,
                              labelColor: primaryColor,
                              indicatorColor: primaryColor,
                              tabs: [
                                Tab(
                                  child: subTitleText('Income',
                                      authPage: true,
                                      fontWeight: FontWeight.w500,
                                      color: titleTextColor),
                                ),
                                Tab(
                                  child: subTitleText('Fixed Expense',
                                      authPage: true,
                                      fontWeight: FontWeight.w500,
                                      color: titleTextColor),
                                ),
                                Tab(
                                  child: subTitleText('Variable Expense',
                                      authPage: true,
                                      fontWeight: FontWeight.w500,
                                      color: titleTextColor),
                                ),
                                Tab(
                                  child: subTitleText('Sinking Funds',
                                      authPage: true,
                                      fontWeight: FontWeight.w500,
                                      color: titleTextColor),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Container(
                            height: 200.h,
                            padding: EdgeInsets.fromLTRB(20.0.h, 0.h, 20.h, 0.h),
                            child: TabBarView(
                              controller: controller,
                              children: [
                                customCard(
                                  156,
                                  SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 160.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.h),
                                                child: titleText('Income', size: 20),
                                              ),
                                              Divider(
                                                color: secondaryTextColor
                                                    .withOpacity(0.3),
                                                thickness: 1,
                                              ),
                                              for (var incomeData in budgetController
                                                  .addBudgetList[currentIndex]
                                                  .incomeMap
                                                  .entries)
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      subTitleText(incomeData.key),
                                                      subTitleText(incomeData.value,
                                                          color: blackTextColor),
                                                    ],
                                                  ),
                                                ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Divider(
                                                  color: secondaryTextColor
                                                      .withOpacity(0.3),
                                                  thickness: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: 50.w,
                                                        child: subTitleText('Total Budget Income')),
                                                    SizedBox(
                                                      width:50.w,
                                                      child: subTitleText(budgetController.totalIncomeData.toString(),
                                                          color: blackTextColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 160.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.h),
                                                child: titleText('Actual Income',
                                                    size: 20),
                                              ),
                                              Divider(
                                                color: secondaryTextColor
                                                    .withOpacity(0.3),
                                                thickness: 1,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    subTitleText('Salary'),
                                                    subTitleText('\$ 45350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    subTitleText('Support'),
                                                    subTitleText('\$ 55350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Divider(
                                                  color: secondaryTextColor
                                                      .withOpacity(0.3),
                                                  thickness: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: 60.w,
                                                        child: subTitleText(
                                                            'Total Actual Income')),
                                                    subTitleText('\$ 55350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                customCard(
                                  156,
                                  SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 160.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.h),
                                                child: titleText('Fixed Expense', size: 20),
                                              ),
                                              Divider(
                                                color: secondaryTextColor
                                                    .withOpacity(0.3),
                                                thickness: 1,
                                              ),
                                              for (var fixedData in budgetController
                                                  .addBudgetList[currentIndex]
                                                  .fixedExpenseMap
                                                  .entries)
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      subTitleText(fixedData.key),
                                                      subTitleText(fixedData.value,
                                                          color: blackTextColor),
                                                    ],
                                                  ),
                                                ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Divider(
                                                  color: secondaryTextColor
                                                      .withOpacity(0.3),
                                                  thickness: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: 50.w,
                                                        child: subTitleText('Total Budget Income')),
                                                    SizedBox(
                                                      width:50.w,
                                                      child: subTitleText(budgetController.totalFixedExpense.toString(),
                                                          color: blackTextColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 160.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.h),
                                                child: titleText('Actual Income',
                                                    size: 20),
                                              ),
                                              Divider(
                                                color: secondaryTextColor
                                                    .withOpacity(0.3),
                                                thickness: 1,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    subTitleText('Salary'),
                                                    subTitleText('\$ 45350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    subTitleText('Support'),
                                                    subTitleText('\$ 55350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Divider(
                                                  color: secondaryTextColor
                                                      .withOpacity(0.3),
                                                  thickness: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: 60.w,
                                                        child: subTitleText(
                                                            'Total Actual Income')),
                                                    subTitleText('\$ 55350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                customCard(
                                  156,
                                  SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 160.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.h),
                                                child: titleText('Variable Expense', size: 20),
                                              ),
                                              Divider(
                                                color: secondaryTextColor
                                                    .withOpacity(0.3),
                                                thickness: 1,
                                              ),
                                              for (var varData in budgetController
                                                  .addBudgetList[currentIndex]
                                                  .varExpense
                                                  .entries)
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      subTitleText(varData.key),
                                                      subTitleText(varData.value,
                                                          color: blackTextColor),
                                                    ],
                                                  ),
                                                ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Divider(
                                                  color: secondaryTextColor
                                                      .withOpacity(0.3),
                                                  thickness: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: 50.w,
                                                        child: subTitleText('Total Budget Income')),
                                                    SizedBox(
                                                      width:50.w,
                                                      child: subTitleText(budgetController.totalVarExpense.toString(),
                                                          color: blackTextColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 160.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.h),
                                                child: titleText('Actual Income',
                                                    size: 20),
                                              ),
                                              Divider(
                                                color: secondaryTextColor
                                                    .withOpacity(0.3),
                                                thickness: 1,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    subTitleText('Salary'),
                                                    subTitleText('\$ 45350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    subTitleText('Support'),
                                                    subTitleText('\$ 55350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Divider(
                                                  color: secondaryTextColor
                                                      .withOpacity(0.3),
                                                  thickness: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: 60.w,
                                                        child: subTitleText(
                                                            'Total Actual Income')),
                                                    subTitleText('\$ 55350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                customCard(
                                  156,
                                  SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 160.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.h),
                                                child: titleText('Sinking Funds', size: 20),
                                              ),
                                              Divider(
                                                color: secondaryTextColor
                                                    .withOpacity(0.3),
                                                thickness: 1,
                                              ),
                                              for (var sinkData in budgetController
                                                  .addBudgetList[currentIndex]
                                                  .sinkingFund
                                                  .entries)
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      subTitleText(sinkData.key),
                                                      subTitleText(sinkData.value,
                                                          color: blackTextColor),
                                                    ],
                                                  ),
                                                ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Divider(
                                                  color: secondaryTextColor
                                                      .withOpacity(0.3),
                                                  thickness: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: 50.w,
                                                        child: subTitleText('Total Budget Income')),
                                                    SizedBox(
                                                      width:50.w,
                                                      child: subTitleText(budgetController.totalSinkFund.toString(),
                                                          color: blackTextColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 160.w,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.h),
                                                child: titleText('Actual Income',
                                                    size: 20),
                                              ),
                                              Divider(
                                                color: secondaryTextColor
                                                    .withOpacity(0.3),
                                                thickness: 1,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    subTitleText('Salary'),
                                                    subTitleText('\$ 45350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    subTitleText('Support'),
                                                    subTitleText('\$ 55350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Divider(
                                                  color: secondaryTextColor
                                                      .withOpacity(0.3),
                                                  thickness: 1,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: 60.w,
                                                        child: subTitleText(
                                                            'Total Actual Income')),
                                                    subTitleText('\$ 55350',
                                                        color: blackTextColor),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.h),
                          customCard(
                              160,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      subTitleText('Budget Total'),
                                      subTitleText('totalExp',
                                          color: blackTextColor, size: 22),
                                      SliderTheme(
                                          data: SliderTheme.of(context).copyWith(
                                            showValueIndicator:
                                            ShowValueIndicator.always,
                                            inactiveTrackColor:
                                            secondaryTextColor.withOpacity(0.2),
                                          ),
                                          child: Slider(
                                            onChanged: (value) {
                                              // setState(() {
                                              //   intValue = value;
                                              // });
                                            },
                                            value: intValue,
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          subTitleText('total ',
                                              size: 16, color: secondaryTextColor),
                                          subTitleText('amount',
                                              size: 16, color: secondaryTextColor)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      )
                    ]),
                  )),
            ),
          )
        : Scaffold(
            backgroundColor: bgWhite,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(107.h),
              child: const CustomAppbar(),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.0.h, 20.h, 20.h, 0.h),
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
                            titleText(
                                budgetController
                                    .addBudgetList[currentIndex].budgetName,
                                color: titleTextColor,
                                size: 25,
                                authPage: true),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      height: 50.h,
                      color: white,
                      child: TabBar(
                        physics: const BouncingScrollPhysics(),
                        controller: controller,
                        isScrollable: true,
                        labelColor: primaryColor,
                        indicatorColor: primaryColor,
                        tabs: [
                          Tab(
                            child: subTitleText('Income',
                                authPage: true,
                                fontWeight: FontWeight.w500,
                                color: titleTextColor),
                          ),
                          Tab(
                            child: subTitleText('Fixed Expense',
                                authPage: true,
                                fontWeight: FontWeight.w500,
                                color: titleTextColor),
                          ),
                          Tab(
                            child: subTitleText('Variable Expense',
                                authPage: true,
                                fontWeight: FontWeight.w500,
                                color: titleTextColor),
                          ),
                          Tab(
                            child: subTitleText('Sinking Funds',
                                authPage: true,
                                fontWeight: FontWeight.w500,
                                color: titleTextColor),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      height: 250.h,
                      padding: EdgeInsets.fromLTRB(20.0.h, 0.h, 20.h, 0.h),
                      child: TabBarView(
                        controller: controller,
                        children: [
                          customCard(
                            156,
                            SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 160.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: titleText('Income', size: 20),
                                        ),
                                        Divider(
                                          color: secondaryTextColor
                                              .withOpacity(0.3),
                                          thickness: 1,
                                        ),
                                        for (var incomeData in budgetController
                                            .addBudgetList[currentIndex]
                                            .incomeMap
                                            .entries)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                subTitleText(incomeData.key),
                                                subTitleText(incomeData.value,
                                                    color: blackTextColor),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Divider(
                                            color: secondaryTextColor
                                                .withOpacity(0.3),
                                            thickness: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 50.w,
                                                  child: subTitleText('Total Budget Income')),
                                              SizedBox(
                                                width:50.w,
                                                child: subTitleText(budgetController.totalIncomeData.toString(),
                                                    color: blackTextColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: titleText('Actual Income',
                                              size: 20),
                                        ),
                                        Divider(
                                          color: secondaryTextColor
                                              .withOpacity(0.3),
                                          thickness: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              subTitleText('Salary'),
                                              subTitleText('\$ 45350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              subTitleText('Support'),
                                              subTitleText('\$ 55350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Divider(
                                            color: secondaryTextColor
                                                .withOpacity(0.3),
                                            thickness: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 60.w,
                                                  child: subTitleText(
                                                      'Total Actual Income')),
                                              subTitleText('\$ 55350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          customCard(
                            156,
                            SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 160.w,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: titleText('Fixed Expense', size: 20),
                                        ),
                                        Divider(
                                          color: secondaryTextColor
                                              .withOpacity(0.3),
                                          thickness: 1,
                                        ),
                                        for (var fixedData in budgetController
                                            .addBudgetList[currentIndex]
                                            .fixedExpenseMap
                                            .entries)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                subTitleText(fixedData.key),
                                                subTitleText(fixedData.value,
                                                    color: blackTextColor),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Divider(
                                            color: secondaryTextColor
                                                .withOpacity(0.3),
                                            thickness: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 50.w,
                                                  child: subTitleText('Total Budget Income')),
                                              SizedBox(
                                                width:50.w,
                                                child: subTitleText(budgetController.totalFixedExpense.toString(),
                                                    color: blackTextColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160.w,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: titleText('Actual Income',
                                              size: 20),
                                        ),
                                        Divider(
                                          color: secondaryTextColor
                                              .withOpacity(0.3),
                                          thickness: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              subTitleText('Salary'),
                                              subTitleText('\$ 45350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              subTitleText('Support'),
                                              subTitleText('\$ 55350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Divider(
                                            color: secondaryTextColor
                                                .withOpacity(0.3),
                                            thickness: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 60.w,
                                                  child: subTitleText(
                                                      'Total Actual Income')),
                                              subTitleText('\$ 55350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          customCard(
                            156,
                            SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 160.w,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: titleText('Variable Expense', size: 20),
                                        ),
                                        Divider(
                                          color: secondaryTextColor
                                              .withOpacity(0.3),
                                          thickness: 1,
                                        ),
                                        for (var varData in budgetController
                                            .addBudgetList[currentIndex]
                                            .varExpense
                                            .entries)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                subTitleText(varData.key),
                                                subTitleText(varData.value,
                                                    color: blackTextColor),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Divider(
                                            color: secondaryTextColor
                                                .withOpacity(0.3),
                                            thickness: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 50.w,
                                                  child: subTitleText('Total Budget Income')),
                                              SizedBox(
                                                width:50.w,
                                                child: subTitleText(budgetController.totalVarExpense.toString(),
                                                    color: blackTextColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160.w,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: titleText('Actual Income',
                                              size: 20),
                                        ),
                                        Divider(
                                          color: secondaryTextColor
                                              .withOpacity(0.3),
                                          thickness: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              subTitleText('Salary'),
                                              subTitleText('\$ 45350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              subTitleText('Support'),
                                              subTitleText('\$ 55350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Divider(
                                            color: secondaryTextColor
                                                .withOpacity(0.3),
                                            thickness: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 60.w,
                                                  child: subTitleText(
                                                      'Total Actual Income')),
                                              subTitleText('\$ 55350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          customCard(
                            156,
                            SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 160.w,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: titleText('Sinking Funds', size: 20),
                                        ),
                                        Divider(
                                          color: secondaryTextColor
                                              .withOpacity(0.3),
                                          thickness: 1,
                                        ),
                                        for (var sinkData in budgetController
                                            .addBudgetList[currentIndex]
                                            .sinkingFund
                                            .entries)
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                subTitleText(sinkData.key),
                                                subTitleText(sinkData.value,
                                                    color: blackTextColor),
                                              ],
                                            ),
                                          ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Divider(
                                            color: secondaryTextColor
                                                .withOpacity(0.3),
                                            thickness: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 50.w,
                                                  child: subTitleText('Total Budget Income')),
                                              SizedBox(
                                                width:50.w,
                                                child: subTitleText(budgetController.totalSinkFund.toString(),
                                                    color: blackTextColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160.w,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: titleText('Actual Income',
                                              size: 20),
                                        ),
                                        Divider(
                                          color: secondaryTextColor
                                              .withOpacity(0.3),
                                          thickness: 1,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              subTitleText('Salary'),
                                              subTitleText('\$ 45350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              subTitleText('Support'),
                                              subTitleText('\$ 55350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Divider(
                                            color: secondaryTextColor
                                                .withOpacity(0.3),
                                            thickness: 1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 60.w,
                                                  child: subTitleText(
                                                      'Total Actual Income')),
                                              subTitleText('\$ 55350',
                                                  color: blackTextColor),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    customCard(
                        160,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                subTitleText('Budget Total'),
                                subTitleText('totalExp',
                                    color: blackTextColor, size: 22),
                                SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      showValueIndicator:
                                          ShowValueIndicator.always,
                                      inactiveTrackColor:
                                          secondaryTextColor.withOpacity(0.2),
                                    ),
                                    child: Slider(
                                      onChanged: (value) {
                                        // setState(() {
                                        //   intValue = value;
                                        // });
                                      },
                                      value: intValue,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    subTitleText('total ',
                                        size: 16, color: secondaryTextColor),
                                    subTitleText('amount',
                                        size: 16, color: secondaryTextColor)
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                )
              ]),
            ));
  }
}
