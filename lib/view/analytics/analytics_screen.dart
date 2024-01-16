import 'package:finance_and_budget/controller/analytics_controller.dart';
import 'package:finance_and_budget/view/analytics/widget/custom_flow_chart.dart';
import 'package:finance_and_budget/view/analytics/widget/flow_chart_screen.dart';
import 'package:finance_and_budget/view/analytics/widget/pie_chart_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';

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
    controller = TabController(vsync: this, length: 4);
    super.initState();
  }

  //AccountController accountController = Get.put(AccountController());
  AnalyticsController analyticsController = Get.put(AnalyticsController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    analyticsController.fetchBudget().then((value) {
      analyticsController.makeHighest();
      analyticsController.makeLowest();
    });
    return Scaffold(
        backgroundColor: bgWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(107.h),
          child: const CustomAppbar(),
        ),
        body: Obx(
              () => analyticsController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
            child: Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          child: subTitleText('Pie Chart',
                              authPage: true,
                              fontWeight: FontWeight.w500,
                              color: titleTextColor),
                        ),
                        Tab(
                          child: subTitleText('Top 3',
                              authPage: true,
                              fontWeight: FontWeight.w500,
                              color: titleTextColor),
                        ),
                        Tab(
                          child: subTitleText('Budget Comparison',
                              authPage: true,
                              fontWeight: FontWeight.w500,
                              color: titleTextColor),
                        ),
                        Tab(
                          child: subTitleText('Performance Comparison',
                              authPage: true,
                              fontWeight: FontWeight.w500,
                              color: titleTextColor),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 700.h,
                    child: TabBarView(
                      controller: controller,
                      children: [
                        pieWidget(context, screenSize),
                        maxMinWidget(),
                        SizedBox(
                          height: 500.h,
                          child: customFlowChart(),
                        ),
                        SizedBox(
                          height: 500.h,
                          child: LineChartWidget(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      /* body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: GetBuilder<AccountController>(
              id: 'updateDetails',
              builder: (context) {
                return accountController.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                titleText('Accounts Overview',
                                    color: titleTextColor, size: 20),
                                titleText('See Accounts Info',
                                    color: titleTextColor, size: 14),
                              ],
                            ),
                          ),
                          for (int m = 0;
                              m <
                                  accountController
                                      .plaidAccountsModel.accounts!.length;
                              m++)
                            Padding(
                              padding: EdgeInsets.all(8.h),
                              child: Column(
                                children: [
                                  accountsRow(
                                      'Account Name',
                                      accountController.plaidAccountsModel
                                              .accounts?[m].name ??
                                          ''),
                                  accountsRow(
                                      'Balance',
                                      accountController.plaidAccountsModel
                                              .accounts?[m].balances.current
                                              .toString() ??
                                          ''),
                                ],
                              ),
                            ),
                          // accountsRow('Credit Card Utilization',
                          //     'N12,000.00'),
                        ],
                      );
              }),
        ),
      ),*/
    );
  }


  Column maxMinWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleText('Maximum 3 numbers are : ',
                color: titleTextColor, size: 18),
            titleText(
                analyticsController.max3.map((x) => x.toString()).join(" , "),
                color: titleTextColor,
                size: 14),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleText('Minimum 3 numbers are : ',
                color: titleTextColor, size: 18),
            titleText(
                analyticsController.min3.map((x) => x.toString()).join(" , "),
                color: titleTextColor,
                size: 14),
          ],
        ),
      ],
    );
  }

  Column pieWidget(BuildContext context, Size screenSize) {
    return Column(
      children: [
        for (int i = 0;
        i <
            (analyticsController.budgetList.length > 4
                ? 4
                : analyticsController.budgetList.length);
        i++)
          Container(
            height: 100.h,
            width: double.infinity,
            padding: EdgeInsets.all(8.h),
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
                color: white,
                border: Border.all(color: borderColor, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText(analyticsController.budgetList[i].budgetName,
                    size: 20),
                subTitleText(analyticsController.budgetList[i].date, size: 14),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    showCustomDialog(
                        context,
                        'Budget Details',
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const Divider(
                                  color: secondaryTextColor, thickness: 1),
                              subTitleText('Planned Budget', color: black),
                              SizedBox(
                                height: 500.h,
                                child: PieChartScreen(i, false),
                              ),
                              const Divider(
                                  color: secondaryTextColor, thickness: 1),
                              subTitleText('Actual Budget', color: black),
                              SizedBox(
                                height: 500.h,
                                child: PieChartScreen(i, true),
                              ),
                            ],
                          ),
                        ),
                        screenSize.width > 450 ? 100 : 300,
                        300);
                  },
                  child:
                  subTitleText('See Chart', size: 18, color: primaryColor),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
