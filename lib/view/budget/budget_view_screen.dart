import 'package:finance_and_budget/controller/budget_controller.dart';
import 'package:finance_and_budget/view/budget/widgets/custom_expence.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
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
  static final BudgetController _budgetController = Get.find();
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

    currentIndex =widget.index;
    var totalExp = int.parse(_budgetController.budgetList[currentIndex].fixedExp) +

        int.parse(_budgetController.budgetList[currentIndex].variableExp)+
        int.parse(_budgetController.budgetList[currentIndex].sinkingFunds) ;
    return Scaffold(
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
                        titleText(_budgetController.budgetList[currentIndex].budgetName,
                            color: titleTextColor, size: 25, authPage: true),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0.h, 20.h, 20.h, 0.h),
                  child: Stack(
                    children: [
                      Container(
                        height: 215.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 2), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          child: Image.asset('assets/images/rec_background.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 20.h),
                          height: 79.h,
                          width: 79.w,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14.r))),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Image.asset(
                                  'assets/images/home_vector.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleText(_budgetController.budgetList[currentIndex].budgetName, size: 25, authPage: true),
                              Row(
                                children: [
                                  subTitleText('Created : '),
                                  subTitleText(_budgetController.budgetList[currentIndex].date,
                                      color: blackTextColor),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
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
                        child: subTitleText('Fixed Expence',
                            authPage: true,
                            fontWeight: FontWeight.w500,
                            color: titleTextColor),
                      ),
                      Tab(
                        child: subTitleText('Variable Expence',
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
                  height: 156.h,
                  padding: EdgeInsets.fromLTRB(20.0.h, 0.h, 20.h, 0.h),
                  child: TabBarView(
                    controller: controller,
                    children: [
                      customExpence(
                          title: 'Income',
                          row1text1: _budgetController.budgetList[currentIndex].income,
                          row1text2: '\$ ${_budgetController.budgetList[currentIndex].amount}',
                          row2text1: '',
                          row2text2: ''),
                      customExpence(
                          title: 'Fixed Expense',
                          row1text1: _budgetController.budgetList[currentIndex].fixedName,
                          row1text2: '\$  ${_budgetController.budgetList[currentIndex].fixedExp}',
                          row2text1: '',
                          row2text2: ''),
                      customExpence(
                          title: 'Variable Expense',
                          row1text1: _budgetController.budgetList[currentIndex].variableName,
                          row1text2: '\$ ${_budgetController.budgetList[currentIndex].variableExp}',
                          row2text1: '',
                          row2text2: ''),
                      customExpence(
                          title: 'Sinking Funds',
                          row1text1: _budgetController.budgetList[currentIndex].sinkingName,
                          row1text2: '\$ ${_budgetController.budgetList[currentIndex].sinkingFunds}',
                          row2text1: '',
                          row2text2: ''),
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
                            subTitleText('Budet Total'),
                            subTitleText('\$ ${_budgetController.budgetList[currentIndex].amount}',
                                color: blackTextColor, size: 22),
                            SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  showValueIndicator: ShowValueIndicator.always,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText('\$ $totalExp',
                                    size: 16, color: secondaryTextColor),
                                subTitleText('\$ ${_budgetController.budgetList[currentIndex].amount}',
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
