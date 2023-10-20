import 'package:finance_and_budget/view/global_widgets/custom_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';

class DebtsItemScreen extends StatefulWidget {
  const DebtsItemScreen({super.key});

  @override
  State<DebtsItemScreen> createState() => _DebtsItemScreenState();
}

class _DebtsItemScreenState extends State<DebtsItemScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb? Center(
      child: SizedBox(
        width: 600.w,
        child: Scaffold(
          backgroundColor: bgWhite,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(107.h),
            child: const CustomAppbar(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                DefaultTabController(
                  initialIndex: 1,
                  length: 2,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 39.h,
                                    width: 360.w,
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.r))),
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                      child: const TabBar(
                                        indicator: BoxDecoration(
                                          color: primaryColor,
                                        ),
                                        unselectedLabelColor: blackTextColor,
                                        tabs: [
                                          Text('Goals'),
                                          Text('Debts'),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 600.h,
                            child: TabBarView(
                              children: [
                                second(),
                                second(),
                              ],
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    ): Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            DefaultTabController(
              initialIndex: 1,
              length: 2,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Container(
                                height: 39.h,
                                width: 360.w,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.r))),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  child: const TabBar(
                                    indicator: BoxDecoration(
                                      color: primaryColor,
                                    ),
                                    unselectedLabelColor: blackTextColor,
                                    tabs: [
                                      Text('Goals'),
                                      Text('Debts'),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 600.h,
                        child: TabBarView(
                          children: [
                            second(),
                            second(),
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  second() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        titleText('Debts', size: 25, color: titleTextColor, authPage: true),
        SizedBox(height: 10.h),
        subTitleText(
            'Having  multiple Debt to aspire to is a great way to learn \nhow to money manage!',
            authPage: true,
            color: secondaryTextColor,
            size: 14,
            fontWeight: FontWeight.w400),
        SizedBox(height: 40.h),
        customCard(
            118.h,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Container(
                    height: 80.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(14.r))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Image.asset('assets/images/creditcard.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  SizedBox(
                    width: 250.w,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              titleText('Credit card',
                                  color: blackTextColor,
                                  size: 24,
                                  fontWeight: FontWeight.w400),
                              subTitleText('80.00%', size: 10)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [subTitleText('13/12/2023', size: 10)],
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 8.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                    color: secondaryTextColor.withOpacity(0.2)),
                              ),
                              Container(
                                height: 8.h,
                                width: 177.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                    color: primaryColor),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              subTitleText('20\$ to go', size: 10),
                              subTitleText('\$ 300', size: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
