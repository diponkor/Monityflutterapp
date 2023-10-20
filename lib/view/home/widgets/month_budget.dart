import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controller/budget_controller.dart';
import '../../budget/budget_view_screen.dart';
import '../../global_widgets/custom_card.dart';
import '../../global_widgets/custom_text.dart';

class MonthBudget extends StatefulWidget {
  const MonthBudget({super.key});

  @override
  State<MonthBudget> createState() => _MonthBudgetState();
}

class _MonthBudgetState extends State<MonthBudget> {
  double intValue = 0;
  final BudgetController _budgetController = Get.put(BudgetController());

  @override
  Widget build(BuildContext context) {
    return customCard(
        600,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText('February Budget', color: titleTextColor, size: 20),
            SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  showValueIndicator: ShowValueIndicator.always,
                  inactiveTrackColor: secondaryTextColor.withOpacity(0.2),
                ),
                child: Slider(
                  onChanged: (value) {
                    // setState(() {
                    //   intValue = value;
                    // });
                  },
                  value: intValue,
                )),
            subTitleText('Top Spending categones', size: 18),
            GetBuilder<BudgetController>(
                id: 'updateBudList',
                builder: (controller) {
                  return controller.budgetList.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            for (int i = 0; i < 3; i++)
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          BudgetViewScreen(index: i)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: customCard(
                                      118.h,
                                      Row(
                                        children: [
                                          Container(
                                            height: 80.h,
                                            width: 70.w,
                                            decoration: BoxDecoration(
                                                color: primaryColor
                                                    .withOpacity(0.1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(14.r))),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                          color: blackTextColor,
                                                          size: 24,
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.r)),
                                                            color:
                                                                secondaryTextColor
                                                                    .withOpacity(
                                                                        0.2)),
                                                      ),
                                                      Container(
                                                        height: 8.h,
                                                        width: 177.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.r)),
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
                                                          '${controller.budgetList[i].amount} \$ to go',
                                                          size: 10),
                                                      subTitleText(
                                                          '\$ ${int.parse(_budgetController.budgetList[i].fixedExp) + int.parse(_budgetController.budgetList[i].variableExp) + int.parse(_budgetController.budgetList[i].sinkingFunds)}',
                                                          size: 10),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              ),
                          ],
                        );
                }),
            Divider(
              color: secondaryTextColor.withOpacity(0.2),
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                SizedBox(
                  height: 88.h,
                  width: 94.w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14.r))),
                          child: Center(
                            child: SizedBox(
                              height: 22.h,
                              width: 20.w,
                              child: Image.asset('assets/images/bil.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        titleText('Upcoming Bill', size: 14)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 88.h,
                  width: 94.w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14.r))),
                          child: Center(
                            child: SizedBox(
                              height: 22.h,
                              width: 20.w,
                              child: Image.asset('assets/images/bil.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        titleText('Pending Days', size: 14)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 88.h,
                  width: 94.w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14.r))),
                          child: Center(
                            child: SizedBox(
                              height: 22.h,
                              width: 20.w,
                              child: Image.asset('assets/images/bil.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        titleText('Pay Bill', size: 14)
                      ],
                    ),
                  ),
                ),
                const SizedBox(),
              ],
            )
          ],
        ));
  }
}
