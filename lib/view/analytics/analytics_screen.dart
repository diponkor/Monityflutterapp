import 'package:finance_and_budget/view/analytics/receipts_screen.dart';
import 'package:finance_and_budget/view/analytics/widget/first_analytics_screen.dart';
import 'package:finance_and_budget/view/analytics/widget/second_analytics_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 80.h),
        child: FloatingActionButton(
            onPressed: () {
              Get.to(const ReceiptsScreen());
            },
            backgroundColor: white,
            child: const Icon(Icons.add, color: blackTextColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            DefaultTabController(
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
                                      Text('Account Summary'),
                                      Text('Transactions'),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 600.h,
                        child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            firstAnalyticsScreen(context),
                            secondAnalyticsScreen(context),
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

}
