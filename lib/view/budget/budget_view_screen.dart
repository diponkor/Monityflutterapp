import 'package:finance_and_budget/controller/budget_controller.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../model/add_budget_model.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_card.dart';
import '../global_widgets/normal_button.dart';

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
    currentIndex = widget.index;
    controller = TabController(vsync: this, length: 4);
    budgetController.totalActualIncome = 0;
    budgetController.totalActualFixed = 0;
    budgetController.totalActualVar = 0;
    budgetController.totalActualSink = 0;
    budgetController.actualIncomeControllerMap = {};
    budgetController.actualFixedControllerMap = {};
    budgetController.actualVarControllerMap = {};
    budgetController.actualSinkControllerMap = {};
    for (var incomeData
        in budgetController.addBudgetList[currentIndex].actualIncomeMap.entries) {
      budgetController.actualIncomeControllerMap[incomeData.key] =
          TextEditingController(text: incomeData.value);
    }
    for (var fixData in budgetController
        .addBudgetList[currentIndex].actualFixedExpenseMap.entries) {
      budgetController.actualFixedControllerMap[fixData.key] =
          TextEditingController(text: fixData.value);
    }
    for (var varData
        in budgetController.addBudgetList[currentIndex].actualVarExpense.entries) {
      budgetController.actualVarControllerMap[varData.key] =
          TextEditingController(text: varData.value);
    }
    for (var sinkData
        in budgetController.addBudgetList[currentIndex].actualSinkingFund.entries) {
      budgetController.actualSinkControllerMap[sinkData.key] =
          TextEditingController(text: sinkData.value);
    }

    budgetController.getCompareIncome();
    budgetController.getCompareFixed();
    budgetController.getCompareVar();
    budgetController.getCompareSink();

    ///for initial actual total calculation--------
    budgetController
        .totalActualIncome = 0;
    budgetController
        .getTotalActualIncome();
    budgetController
        .getCompareIncome();

    //----------------------------
    budgetController
        .totalActualFixed = 0;
    budgetController
        .getTotalActualFixed();
    budgetController
        .getCompareFixed();
    //----------------------------
    budgetController
        .totalActualVar = 0;
    budgetController
        .getTotalActualVar();
    budgetController
        .getCompareVar();
    //----------------------------
    budgetController
        .totalActualSink = 0;
    budgetController
        .getTotalActualSink();
    budgetController
        .getCompareSink();
    super.initState();
  }

  @override
  void dispose() {
    budgetController.totalActualIncome = 0;
    budgetController.totalActualFixed = 0;
    budgetController.totalActualVar = 0;
    budgetController.totalActualSink = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
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
                            height: 700.h,
                            padding: EdgeInsets.fromLTRB(20.0.h, 0.h, 20.h, 0.h),
                            child: TabBarView(
                              controller: controller,
                              children: [
                                Column(
                                  children: [
                                    customCard(
                                        100,
                                        Center(
                                          child: Container(
                                            child: subTitleText(
                                                budgetController.compareIncomeText),
                                          ),
                                        )),
                                    SizedBox(height: 10.h),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              child: titleText('Planned Income',
                                                  color: titleTextColor,
                                                  size: 22),
                                            ),
                                            Divider(
                                              color: secondaryTextColor
                                                  .withOpacity(0.3),
                                              thickness: 1,
                                            ),
                                            for (var incomeData
                                            in budgetController
                                                .addBudgetList[currentIndex]
                                                .incomeMap
                                                .entries)
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 200.w,
                                                      child: subTitleText(
                                                          incomeData.key),
                                                    ),
                                                    subTitleText(
                                                        '\$${incomeData.value}',
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
                                                  subTitleText(
                                                      'Total Planned Income',
                                                      color: black),
                                                  subTitleText(
                                                      '\$${budgetController.totalIncomeData.toStringAsFixed(2)}',
                                                      color: black),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              child: titleText('Actual Income',
                                                  color: titleTextColor,
                                                  size: 22),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const SizedBox(),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5.h),
                                                  child: subTitleText('You can edit this value',
                                                      color: titleTextColor,
                                                      size: 14),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: secondaryTextColor
                                                  .withOpacity(0.3),
                                              thickness: 1,
                                            ),
                                            for (var incomeData
                                            in budgetController
                                                .addBudgetList[currentIndex]
                                                .actualIncomeMap
                                                .entries)
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 200.w,
                                                      child: subTitleText(
                                                          incomeData.key),
                                                    ),
                                                    Container(
                                                        width: 80.w,
                                                        height: 40.h,
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h),
                                                        child: TextFormField(
                                                          onChanged: (text) {
                                                            setState(() {
                                                              budgetController
                                                                  .totalActualIncome = 0;
                                                              budgetController
                                                                  .getTotalActualIncome();
                                                              budgetController
                                                                  .getCompareIncome();
                                                            });
                                                          },
                                                          controller: budgetController
                                                              .actualIncomeControllerMap[
                                                          incomeData.key],
                                                          // Use the controller from the map
                                                          keyboardType:
                                                          TextInputType
                                                              .number,
                                                        )),
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
                                                  subTitleText(
                                                      'Total Actual Income',
                                                      color: black),
                                                  subTitleText(
                                                      '\$${budgetController.totalActualIncome.toStringAsFixed(2)}',
                                                      color: blackTextColor),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                budgetController.makeNewActualIncomeMap();
                                                // budgetController.makeNewActualFixMap();
                                                // budgetController.makeNewActualVarMap();
                                                // budgetController.makeNewActualSinkMap();
                                                final budget = AddBudgetModel(
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .id,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .budgetName,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .date,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .incomeMap,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .fixedExpenseMap,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .varExpense,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .sinkingFund,
                                                    budgetController.newActualIncomeMap,
                                                    budgetController
                                                        .addBudgetList[currentIndex].actualFixedExpenseMap,
                                                    budgetController
                                                        .addBudgetList[currentIndex].actualVarExpense,
                                                    budgetController
                                                        .addBudgetList[currentIndex].actualSinkingFund
                                                );
                                                await budgetController
                                                    .updateBudget(budget).then((value){
                                                  budgetController.actualIncomeControllerMap.clear();
                                                  // budgetController.actualFixedControllerMap.clear();
                                                  // budgetController.actualVarControllerMap.clear();
                                                  // budgetController.actualSinkControllerMap.clear();

                                                  budgetController.newActualIncomeMap.clear();
                                                  // budgetController.newActualFixMap.clear();
                                                  // budgetController.newActualVarMap.clear();
                                                  // budgetController.newActualSingMap.clear();
                                                });
                                              },
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                    vertical: 12.0),
                                                child: SizedBox(
                                                    width: 100.w,
                                                    child: normalButton('Save')),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                                Column(
                                  children: [
                                    customCard(
                                        100,
                                        Center(
                                          child: Container(
                                            child: subTitleText(
                                                budgetController.compareFixedText),
                                          ),
                                        )),
                                    SizedBox(height: 10.h),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              child: titleText('Planned Fixed',
                                                  color: titleTextColor,
                                                  size: 22),
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
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 200.w,
                                                      child: subTitleText(
                                                          fixedData.key),
                                                    ),
                                                    subTitleText(
                                                        '\$${fixedData.value}',
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
                                                  subTitleText(
                                                      'Total Planned Fixed',
                                                      color: black),
                                                  subTitleText(
                                                      '\$${budgetController.totalFixedExpense.toStringAsFixed(2)}',
                                                      color: blackTextColor),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              child: titleText('Actual Fixed',
                                                  color: titleTextColor,
                                                  size: 22),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const SizedBox(),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5.h),
                                                  child: subTitleText('You can edit this value',
                                                      color: titleTextColor,
                                                      size: 14),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: secondaryTextColor
                                                  .withOpacity(0.3),
                                              thickness: 1,
                                            ),
                                            for (var fixedData in budgetController
                                                .addBudgetList[currentIndex]
                                                .actualFixedExpenseMap
                                                .entries)
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: 200.w,
                                                        child: subTitleText(
                                                            fixedData.key)),
                                                    Container(
                                                        width: 80.w,
                                                        height: 40.h,
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h),
                                                        child: TextFormField(
                                                          onChanged: (text) {
                                                            setState(() {
                                                              budgetController
                                                                  .totalActualFixed = 0;
                                                              budgetController
                                                                  .getTotalActualFixed();
                                                              budgetController
                                                                  .getCompareFixed();
                                                            });
                                                          },
                                                          controller: budgetController
                                                              .actualFixedControllerMap[
                                                          fixedData.key],
                                                          // Use the controller from the map
                                                          keyboardType:
                                                          TextInputType
                                                              .number,
                                                        )),
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
                                                  subTitleText(
                                                      'Total Actual Fixed',
                                                      color: black),
                                                  subTitleText(
                                                      '\$${budgetController.totalActualFixed.toStringAsFixed(2)}',
                                                      color: blackTextColor),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                budgetController.makeNewActualIncomeMap();
                                                budgetController.makeNewActualFixMap();
                                                budgetController.makeNewActualVarMap();
                                                budgetController.makeNewActualSinkMap();
                                                final budget = AddBudgetModel(
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .id,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .budgetName,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .date,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .incomeMap,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .fixedExpenseMap,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .varExpense,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .sinkingFund,
                                                    budgetController
                                                        .addBudgetList[currentIndex].actualIncomeMap,
                                                    budgetController.newActualFixMap,
                                                    budgetController
                                                        .addBudgetList[currentIndex].actualVarExpense,
                                                    budgetController
                                                        .addBudgetList[currentIndex].actualSinkingFund
                                                );
                                                await budgetController
                                                    .updateBudget(budget).then((value){
                                                  //budgetController.actualIncomeControllerMap.clear();
                                                  budgetController.actualFixedControllerMap.clear();
                                                  // budgetController.actualVarControllerMap.clear();
                                                  // budgetController.actualSinkControllerMap.clear();

                                                  // budgetController.newActualIncomeMap.clear();
                                                  budgetController.newActualFixMap.clear();
                                                  // budgetController.newActualVarMap.clear();
                                                  // budgetController.newActualSingMap.clear();
                                                });
                                              },
                                              child: Padding(
                                                  padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 12.0),
                                                  child:  SizedBox(
                                                      width: 100.w,
                                                      child: normalButton('Save'))
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    customCard(
                                        100,
                                        Center(
                                          child: Container(
                                            child: subTitleText(
                                                budgetController.compareVarText),
                                          ),
                                        )),
                                    SizedBox(height: 10.h),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              child: titleText('Planned Variable',
                                                  color: titleTextColor,
                                                  size: 22),
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
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 200.w,
                                                      child: subTitleText(
                                                          varData.key),
                                                    ),
                                                    subTitleText(
                                                        '\$${varData.value}',
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
                                                  subTitleText(
                                                      'Total Planned Variable',
                                                      color: black),
                                                  subTitleText(
                                                      '\$${budgetController.totalVarExpense.toStringAsFixed(2)}',
                                                      color: blackTextColor),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              child: titleText('Actual Variable',
                                                  color: titleTextColor,
                                                  size: 22),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const SizedBox(),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5.h),
                                                  child: subTitleText('You can edit this value',
                                                      color: titleTextColor,
                                                      size: 14),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: secondaryTextColor
                                                  .withOpacity(0.3),
                                              thickness: 1,
                                            ),
                                            for (var varData in budgetController
                                                .addBudgetList[currentIndex]
                                                .actualVarExpense
                                                .entries)
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width: 200.w,
                                                      child: subTitleText(
                                                          varData.key),
                                                    ),
                                                    Container(
                                                        width: 80.w,
                                                        height: 40.h,
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h),
                                                        child: TextFormField(
                                                          onChanged: (text) {
                                                            setState(() {
                                                              budgetController
                                                                  .totalActualVar = 0;
                                                              budgetController
                                                                  .getTotalActualVar();
                                                              budgetController
                                                                  .getCompareVar();
                                                            });
                                                          },
                                                          controller: budgetController
                                                              .actualVarControllerMap[
                                                          varData.key],
                                                          // Use the controller from the map
                                                          keyboardType:
                                                          TextInputType
                                                              .number,
                                                        )),
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
                                                  subTitleText(
                                                      'Total Actual Variable',
                                                      color: black),
                                                  subTitleText(
                                                      '\$${budgetController.totalActualVar.toStringAsFixed(2)}',
                                                      color: blackTextColor),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                budgetController.makeNewActualIncomeMap();
                                                budgetController.makeNewActualFixMap();
                                                budgetController.makeNewActualVarMap();
                                                budgetController.makeNewActualSinkMap();
                                                final budget = AddBudgetModel(
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .id,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .budgetName,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .date,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .incomeMap,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .fixedExpenseMap,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .varExpense,
                                                    budgetController
                                                        .addBudgetList[currentIndex]
                                                        .sinkingFund,
                                                    budgetController
                                                        .addBudgetList[currentIndex].actualIncomeMap,
                                                    budgetController
                                                        .addBudgetList[currentIndex].actualFixedExpenseMap,
                                                    budgetController.newActualVarMap,
                                                    budgetController
                                                        .addBudgetList[currentIndex].actualSinkingFund
                                                );
                                                await budgetController
                                                    .updateBudget(budget).then((value){
                                                  // budgetController.actualIncomeControllerMap.clear();
                                                  // budgetController.actualFixedControllerMap.clear();
                                                  budgetController.actualVarControllerMap.clear();
                                                  // budgetController.actualSinkControllerMap.clear();

                                                  // budgetController.newActualIncomeMap.clear();
                                                  // budgetController.newActualFixMap.clear();
                                                  budgetController.newActualVarMap.clear();
                                                  // budgetController.newActualSingMap.clear();
                                                });
                                              },
                                              child: Padding(
                                                  padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 12.0),
                                                  child:  SizedBox(
                                                      width: 100.w,
                                                      child: normalButton('Save'))
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    customCard(
                                        100,
                                        Center(
                                          child: Container(
                                            child: subTitleText(
                                                budgetController.compareSinkText),
                                          ),
                                        )),
                                    SizedBox(height: 10.h),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              child: titleText('Planned Sinking',
                                                  color: titleTextColor,
                                                  size: 22),
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
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: 200.w,
                                                        child: subTitleText(
                                                            sinkData.key)),
                                                    subTitleText(
                                                        '\$${sinkData.value}',
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
                                                  subTitleText(
                                                      'Total Planned Sinking',
                                                      color: black),
                                                  subTitleText(
                                                      '\$${budgetController.totalSinkFund.toStringAsFixed(2)}',
                                                      color: blackTextColor),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h),
                                              child: titleText('Actual Sinking',
                                                  color: titleTextColor,
                                                  size: 22),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const SizedBox(),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 5.h),
                                                  child: subTitleText('You can edit this value',
                                                      color: titleTextColor,
                                                      size: 14),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: secondaryTextColor
                                                  .withOpacity(0.3),
                                              thickness: 1,
                                            ),
                                            for (var sinkData in budgetController
                                                .addBudgetList[currentIndex]
                                                .actualSinkingFund
                                                .entries)
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                        width: 200.w,
                                                        child: subTitleText(
                                                            sinkData.key)),
                                                    Container(
                                                        width: 80.w,
                                                        height: 40.h,
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 2.h),
                                                        child: TextFormField(
                                                          onChanged: (text) {
                                                            setState(() {
                                                              budgetController
                                                                  .totalActualSink = 0;
                                                              budgetController
                                                                  .getTotalActualSink();
                                                              budgetController
                                                                  .getCompareSink();
                                                            });
                                                          },
                                                          controller: budgetController
                                                              .actualSinkControllerMap[
                                                          sinkData.key],
                                                          // Use the controller from the map
                                                          keyboardType:
                                                          TextInputType
                                                              .number,
                                                        )),
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
                                                  subTitleText(
                                                      'Total Actual Sinking',
                                                      color: black),
                                                  subTitleText(
                                                      '\$${budgetController.totalActualSink.toStringAsFixed(2)}',
                                                      color: blackTextColor),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                budgetController.makeNewActualIncomeMap();
                                                budgetController.makeNewActualFixMap();
                                                budgetController.makeNewActualVarMap();
                                                budgetController.makeNewActualSinkMap();
                                                final budget = AddBudgetModel(
                                                  budgetController
                                                      .addBudgetList[currentIndex]
                                                      .id,
                                                  budgetController
                                                      .addBudgetList[currentIndex]
                                                      .budgetName,
                                                  budgetController
                                                      .addBudgetList[currentIndex]
                                                      .date,
                                                  budgetController
                                                      .addBudgetList[currentIndex]
                                                      .incomeMap,
                                                  budgetController
                                                      .addBudgetList[currentIndex]
                                                      .fixedExpenseMap,
                                                  budgetController
                                                      .addBudgetList[currentIndex]
                                                      .varExpense,
                                                  budgetController
                                                      .addBudgetList[currentIndex]
                                                      .sinkingFund,
                                                  budgetController
                                                      .addBudgetList[currentIndex].actualIncomeMap,
                                                  budgetController
                                                      .addBudgetList[currentIndex].actualFixedExpenseMap,
                                                  budgetController
                                                      .addBudgetList[currentIndex].actualVarExpense,
                                                  budgetController.newActualSingMap,
                                                );
                                                await budgetController
                                                    .updateBudget(budget).then((value){
                                                  // budgetController.actualIncomeControllerMap.clear();
                                                  // budgetController.actualFixedControllerMap.clear();
                                                  // budgetController.actualVarControllerMap.clear();
                                                  budgetController.actualSinkControllerMap.clear();

                                                  // budgetController.newActualIncomeMap.clear();
                                                  // budgetController.newActualFixMap.clear();
                                                  // budgetController.newActualVarMap.clear();
                                                  budgetController.newActualSingMap.clear();
                                                });
                                              },
                                              child: Padding(
                                                  padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0,
                                                      vertical: 12.0),
                                                  child:  SizedBox(
                                                      width: 100.w,
                                                      child: normalButton('Save'))
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                  height: 700.h,
                  padding: EdgeInsets.fromLTRB(20.0.h, 0.h, 20.h, 0.h),
                  child: TabBarView(
                    controller: controller,
                    children: [
                      Column(
                        children: [
                          customCard(
                              100,
                              Center(
                                child: Container(
                                  child: subTitleText(
                                      budgetController.compareIncomeText),
                                ),
                              )),
                          SizedBox(height: 10.h),
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h),
                                      child: titleText('Planned Income',
                                          color: titleTextColor,
                                          size: 22),
                                    ),
                                    Divider(
                                      color: secondaryTextColor
                                          .withOpacity(0.3),
                                      thickness: 1,
                                    ),
                                    for (var incomeData
                                    in budgetController
                                        .addBudgetList[currentIndex]
                                        .incomeMap
                                        .entries)
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 200.w,
                                              child: subTitleText(
                                                  incomeData.key),
                                            ),
                                            subTitleText(
                                                '\$${incomeData.value}',
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
                                          subTitleText(
                                              'Total Planned Income',
                                              color: black),
                                          subTitleText(
                                              '\$${budgetController.totalIncomeData.toStringAsFixed(2)}',
                                              color: black),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.h),
                                      child: titleText('Actual Income',
                                          color: titleTextColor,
                                          size: 22),
                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h),
                                          child: subTitleText('You can edit this value',
                                              color: titleTextColor,
                                              size: 14),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: secondaryTextColor
                                          .withOpacity(0.3),
                                      thickness: 1,
                                    ),
                                    for (var incomeData
                                    in budgetController
                                        .addBudgetList[currentIndex]
                                        .actualIncomeMap
                                        .entries)
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 200.w,
                                              child: subTitleText(
                                                  incomeData.key),
                                            ),
                                            Container(
                                                width: 80.w,
                                                height: 40.h,
                                                padding:
                                                EdgeInsets.symmetric(
                                                    vertical: 2.h),
                                                child: TextFormField(
                                                  onChanged: (text) {
                                                    setState(() {
                                                      budgetController
                                                          .totalActualIncome = 0;
                                                      budgetController
                                                          .getTotalActualIncome();
                                                      budgetController
                                                          .getCompareIncome();
                                                    });
                                                  },
                                                  controller: budgetController
                                                      .actualIncomeControllerMap[
                                                  incomeData.key],
                                                  // Use the controller from the map
                                                  keyboardType:
                                                  TextInputType
                                                      .number,
                                                )),
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
                                          subTitleText(
                                              'Total Actual Income',
                                              color: black),
                                          subTitleText(
                                              '\$${budgetController.totalActualIncome.toStringAsFixed(2)}',
                                              color: blackTextColor),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        budgetController.makeNewActualIncomeMap();
                                        // budgetController.makeNewActualFixMap();
                                        // budgetController.makeNewActualVarMap();
                                        // budgetController.makeNewActualSinkMap();
                                        final budget = AddBudgetModel(
                                          budgetController
                                              .addBudgetList[currentIndex]
                                              .id,
                                          budgetController
                                              .addBudgetList[currentIndex]
                                              .budgetName,
                                          budgetController
                                              .addBudgetList[currentIndex]
                                              .date,
                                          budgetController
                                              .addBudgetList[currentIndex]
                                              .incomeMap,
                                          budgetController
                                              .addBudgetList[currentIndex]
                                              .fixedExpenseMap,
                                          budgetController
                                              .addBudgetList[currentIndex]
                                              .varExpense,
                                          budgetController
                                              .addBudgetList[currentIndex]
                                              .sinkingFund,
                                          budgetController.newActualIncomeMap,
                                            budgetController
                                                .addBudgetList[currentIndex].actualFixedExpenseMap,
                                            budgetController
                                                .addBudgetList[currentIndex].actualVarExpense,
                                            budgetController
                                                .addBudgetList[currentIndex].actualSinkingFund
                                        );
                                        await budgetController
                                            .updateBudget(budget).then((value){
                                          budgetController.actualIncomeControllerMap.clear();
                                          // budgetController.actualFixedControllerMap.clear();
                                          // budgetController.actualVarControllerMap.clear();
                                          // budgetController.actualSinkControllerMap.clear();

                                          budgetController.newActualIncomeMap.clear();
                                          // budgetController.newActualFixMap.clear();
                                          // budgetController.newActualVarMap.clear();
                                          // budgetController.newActualSingMap.clear();
                                        });
                                      },
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                            vertical: 12.0),
                                        child: SizedBox(
                                            width: 100.w,
                                            child: normalButton('Save')),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                        ],
                      ),
                      Column(
                        children: [
                          customCard(
                              100,
                              Center(
                                child: Container(
                                  child: subTitleText(
                                      budgetController.compareFixedText),
                                ),
                              )),
                          SizedBox(height: 10.h),
                            Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.h),
                                        child: titleText('Planned Fixed',
                                            color: titleTextColor,
                                            size: 22),
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
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 200.w,
                                                child: subTitleText(
                                                    fixedData.key),
                                              ),
                                              subTitleText(
                                                  '\$${fixedData.value}',
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
                                            subTitleText(
                                                'Total Planned Fixed',
                                                color: black),
                                            subTitleText(
                                                '\$${budgetController.totalFixedExpense.toStringAsFixed(2)}',
                                                color: blackTextColor),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.h),
                                        child: titleText('Actual Fixed',
                                            color: titleTextColor,
                                            size: 22),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: subTitleText('You can edit this value',
                                                color: titleTextColor,
                                                size: 14),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: secondaryTextColor
                                            .withOpacity(0.3),
                                        thickness: 1,
                                      ),
                                      for (var fixedData in budgetController
                                          .addBudgetList[currentIndex]
                                          .actualFixedExpenseMap
                                          .entries)
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 200.w,
                                                  child: subTitleText(
                                                      fixedData.key)),
                                              Container(
                                                  width: 80.w,
                                                  height: 40.h,
                                                  padding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 2.h),
                                                  child: TextFormField(
                                                    onChanged: (text) {
                                                      setState(() {
                                                        budgetController
                                                            .totalActualFixed = 0;
                                                        budgetController
                                                            .getTotalActualFixed();
                                                        budgetController
                                                            .getCompareFixed();
                                                      });
                                                    },
                                                    controller: budgetController
                                                        .actualFixedControllerMap[
                                                    fixedData.key],
                                                    // Use the controller from the map
                                                    keyboardType:
                                                    TextInputType
                                                        .number,
                                                  )),
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
                                            subTitleText(
                                                'Total Actual Fixed',
                                                color: black),
                                            subTitleText(
                                                '\$${budgetController.totalActualFixed.toStringAsFixed(2)}',
                                                color: blackTextColor),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          budgetController.makeNewActualIncomeMap();
                                          budgetController.makeNewActualFixMap();
                                          budgetController.makeNewActualVarMap();
                                          budgetController.makeNewActualSinkMap();
                                          final budget = AddBudgetModel(
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .id,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .budgetName,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .date,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .incomeMap,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .fixedExpenseMap,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .varExpense,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .sinkingFund,
                                            budgetController
                                                .addBudgetList[currentIndex].actualIncomeMap,
                                            budgetController.newActualFixMap,
                                            budgetController
                                                .addBudgetList[currentIndex].actualVarExpense,
                                              budgetController
                                              .addBudgetList[currentIndex].actualSinkingFund
                                          );
                                          await budgetController
                                              .updateBudget(budget).then((value){
                                            //budgetController.actualIncomeControllerMap.clear();
                                            budgetController.actualFixedControllerMap.clear();
                                            // budgetController.actualVarControllerMap.clear();
                                            // budgetController.actualSinkControllerMap.clear();

                                           // budgetController.newActualIncomeMap.clear();
                                            budgetController.newActualFixMap.clear();
                                            // budgetController.newActualVarMap.clear();
                                            // budgetController.newActualSingMap.clear();
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                              vertical: 12.0),
                                          child:  SizedBox(
                                              width: 100.w,
                                              child: normalButton('Save'))
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        ],
                      ),
                      Column(
                        children: [
                          customCard(
                              100,
                              Center(
                                child: Container(
                                  child: subTitleText(
                                      budgetController.compareVarText),
                                ),
                              )),
                          SizedBox(height: 10.h),
                           Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.h),
                                        child: titleText('Planned Variable',
                                            color: titleTextColor,
                                            size: 22),
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
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 200.w,
                                                child: subTitleText(
                                                    varData.key),
                                              ),
                                              subTitleText(
                                                  '\$${varData.value}',
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
                                            subTitleText(
                                                'Total Planned Variable',
                                                color: black),
                                            subTitleText(
                                                '\$${budgetController.totalVarExpense.toStringAsFixed(2)}',
                                                color: blackTextColor),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.h),
                                        child: titleText('Actual Variable',
                                            color: titleTextColor,
                                            size: 22),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: subTitleText('You can edit this value',
                                                color: titleTextColor,
                                                size: 14),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: secondaryTextColor
                                            .withOpacity(0.3),
                                        thickness: 1,
                                      ),
                                      for (var varData in budgetController
                                          .addBudgetList[currentIndex]
                                          .actualVarExpense
                                          .entries)
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 200.w,
                                                child: subTitleText(
                                                    varData.key),
                                              ),
                                              Container(
                                                  width: 80.w,
                                                  height: 40.h,
                                                  padding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 2.h),
                                                  child: TextFormField(
                                                    onChanged: (text) {
                                                      setState(() {
                                                        budgetController
                                                            .totalActualVar = 0;
                                                        budgetController
                                                            .getTotalActualVar();
                                                        budgetController
                                                            .getCompareVar();
                                                      });
                                                    },
                                                    controller: budgetController
                                                        .actualVarControllerMap[
                                                    varData.key],
                                                    // Use the controller from the map
                                                    keyboardType:
                                                    TextInputType
                                                        .number,
                                                  )),
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
                                            subTitleText(
                                                'Total Actual Variable',
                                                color: black),
                                            subTitleText(
                                                '\$${budgetController.totalActualVar.toStringAsFixed(2)}',
                                                color: blackTextColor),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          budgetController.makeNewActualIncomeMap();
                                          budgetController.makeNewActualFixMap();
                                          budgetController.makeNewActualVarMap();
                                          budgetController.makeNewActualSinkMap();
                                          final budget = AddBudgetModel(
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .id,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .budgetName,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .date,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .incomeMap,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .fixedExpenseMap,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .varExpense,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .sinkingFund,
                                              budgetController
                                                  .addBudgetList[currentIndex].actualIncomeMap,
                                              budgetController
                                                  .addBudgetList[currentIndex].actualFixedExpenseMap,
                                            budgetController.newActualVarMap,
                                              budgetController
                                                  .addBudgetList[currentIndex].actualSinkingFund
                                          );
                                          await budgetController
                                              .updateBudget(budget).then((value){
                                            // budgetController.actualIncomeControllerMap.clear();
                                            // budgetController.actualFixedControllerMap.clear();
                                            budgetController.actualVarControllerMap.clear();
                                           // budgetController.actualSinkControllerMap.clear();

                                            // budgetController.newActualIncomeMap.clear();
                                            // budgetController.newActualFixMap.clear();
                                            budgetController.newActualVarMap.clear();
                                            // budgetController.newActualSingMap.clear();
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                              vertical: 12.0),
                                          child:  SizedBox(
                                              width: 100.w,
                                              child: normalButton('Save'))
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        ],
                      ),
                      Column(
                        children: [
                          customCard(
                              100,
                              Center(
                                child: Container(
                                  child: subTitleText(
                                      budgetController.compareSinkText),
                                ),
                              )),
                          SizedBox(height: 10.h),
                          Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.h),
                                        child: titleText('Planned Sinking',
                                            color: titleTextColor,
                                            size: 22),
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
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 200.w,
                                                  child: subTitleText(
                                                      sinkData.key)),
                                              subTitleText(
                                                  '\$${sinkData.value}',
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
                                            subTitleText(
                                                'Total Planned Sinking',
                                                color: black),
                                            subTitleText(
                                                '\$${budgetController.totalSinkFund.toStringAsFixed(2)}',
                                                color: blackTextColor),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.h),
                                        child: titleText('Actual Sinking',
                                            color: titleTextColor,
                                            size: 22),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox(),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h),
                                            child: subTitleText('You can edit this value',
                                                color: titleTextColor,
                                                size: 14),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: secondaryTextColor
                                            .withOpacity(0.3),
                                        thickness: 1,
                                      ),
                                      for (var sinkData in budgetController
                                          .addBudgetList[currentIndex]
                                          .actualSinkingFund
                                          .entries)
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SizedBox(
                                                  width: 200.w,
                                                  child: subTitleText(
                                                      sinkData.key)),
                                              Container(
                                                  width: 80.w,
                                                  height: 40.h,
                                                  padding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 2.h),
                                                  child: TextFormField(
                                                    onChanged: (text) {
                                                      setState(() {
                                                        budgetController
                                                            .totalActualSink = 0;
                                                        budgetController
                                                            .getTotalActualSink();
                                                        budgetController
                                                            .getCompareSink();
                                                      });
                                                    },
                                                    controller: budgetController
                                                        .actualSinkControllerMap[
                                                    sinkData.key],
                                                    // Use the controller from the map
                                                    keyboardType:
                                                    TextInputType
                                                        .number,
                                                  )),
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
                                            subTitleText(
                                                'Total Actual Sinking',
                                                color: black),
                                            subTitleText(
                                                '\$${budgetController.totalActualSink.toStringAsFixed(2)}',
                                                color: blackTextColor),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          budgetController.makeNewActualIncomeMap();
                                          budgetController.makeNewActualFixMap();
                                          budgetController.makeNewActualVarMap();
                                          budgetController.makeNewActualSinkMap();
                                          final budget = AddBudgetModel(
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .id,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .budgetName,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .date,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .incomeMap,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .fixedExpenseMap,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .varExpense,
                                            budgetController
                                                .addBudgetList[currentIndex]
                                                .sinkingFund,
                                            budgetController
                                                .addBudgetList[currentIndex].actualIncomeMap,
                                            budgetController
                                                .addBudgetList[currentIndex].actualFixedExpenseMap,
                                            budgetController
                                            .addBudgetList[currentIndex].actualVarExpense,
                                            budgetController.newActualSingMap,
                                          );
                                          await budgetController
                                              .updateBudget(budget).then((value){
                                            // budgetController.actualIncomeControllerMap.clear();
                                            // budgetController.actualFixedControllerMap.clear();
                                            // budgetController.actualVarControllerMap.clear();
                                            budgetController.actualSinkControllerMap.clear();

                                            // budgetController.newActualIncomeMap.clear();
                                            // budgetController.newActualFixMap.clear();
                                            // budgetController.newActualVarMap.clear();
                                            budgetController.newActualSingMap.clear();
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                              vertical: 12.0),
                                          child:  SizedBox(
                                              width: 100.w,
                                              child: normalButton('Save'))
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
