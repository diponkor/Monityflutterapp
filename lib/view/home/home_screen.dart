import 'package:finance_and_budget/view/global_widgets/custom_appbar.dart';
import 'package:finance_and_budget/view/global_widgets/custom_card.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text.dart';
import 'package:finance_and_budget/view/home/widgets/accounts_row.dart';
import 'package:finance_and_budget/view/home/widgets/month_budget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../controller/account_controller.dart';
import '../../controller/budget_controller.dart';
import '../../controller/manifestation_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double intValue = 0;
  final BudgetController _budgetController = Get.put(BudgetController());
  ManifestationController manifestationController =
      Get.put(ManifestationController());
  AccountController accountController = Get.put(AccountController());

  @override
  void initState() {
    setState(() {
      _budgetController.fetchBudget();
      accountController.generateLinkToken().then((value) {
        accountController.generatePublicToken().then((value) {
          accountController.generateAccessToken().then((value) {
            accountController.getAllAccount();
          });
        });
      });
    });
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
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(20.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            customCard(
                                400,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // titleText('Pay off \$5000 Debt',
                                    //     color: titleTextColor, size: 20),
                                    SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          showValueIndicator:
                                              ShowValueIndicator.always,
                                          inactiveTrackColor: secondaryTextColor
                                              .withOpacity(0.2),
                                        ),
                                        child: Slider(
                                          onChanged: (value) {
                                            // setState(() {
                                            //   intValue = value;
                                            // });
                                          },
                                          value: intValue,
                                        )),
                                    subTitleText(
                                        'Cool! let\'s keep your expense below the budget',
                                        size: 15),
                                    GetBuilder<ManifestationController>(
                                        id: 'updateDebtList',
                                        builder: (controller) {
                                          return controller.debtList.isEmpty
                                              ? const Center(
                                                  child: SizedBox())
                                              : Center(
                                                  child: SingleChildScrollView(
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    child: Column(
                                                      children: [
                                                        for (int j = 0;
                                                            j < 2;
                                                            j++)
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 10.h),
                                                            child: customCard(
                                                                118.h,
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          80.h,
                                                                      width:
                                                                          70.w,
                                                                      decoration: BoxDecoration(
                                                                          color: primaryColor.withOpacity(
                                                                              0.1),
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(14.r))),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 15.0),
                                                                          child: Image.asset(
                                                                              'assets/images/creditcard.png',
                                                                              fit: BoxFit.cover),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 20
                                                                            .w),
                                                                    SizedBox(
                                                                      width:
                                                                          250.w,
                                                                      child:
                                                                          SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                titleText(manifestationController.debtList[j].debtName, color: blackTextColor, size: 24, fontWeight: FontWeight.w400),
                                                                                subTitleText('${manifestationController.debtList[j].interestRate}%', size: 10)
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                subTitleText(manifestationController.debtList[j].interestRate, size: 10)
                                                                              ],
                                                                            ),
                                                                            Stack(
                                                                              children: [
                                                                                Container(
                                                                                  height: 8.h,
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.r)), color: secondaryTextColor.withOpacity(0.2)),
                                                                                ),
                                                                                Container(
                                                                                  height: 8.h,
                                                                                  width: 177.w,
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.r)), color: primaryColor),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                subTitleText('${manifestationController.debtList[j].amount}\$ to go', size: 10),
                                                                                subTitleText('\$ ${manifestationController.debtList[j].amount}', size: 10),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                )),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                        }),
                                  ],
                                )),
                            SizedBox(height: 20.h),
                            customCard(
                                200,
                                GetBuilder<AccountController>(
                                    id: 'updateDetails',
                                    builder: (context) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap:(){
                                              setState(() {

                                              });
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
                                          for (int m = 0; m < 2; m++)
                                            Column(
                                              children: [
                                                accountsRow(
                                                    'Account Name',
                                                    accountController
                                                            .plaidAccountsModel
                                                            .accounts?[m]
                                                            .name ??
                                                        ''),
                                                accountsRow(
                                                    'Balance',
                                                    accountController
                                                            .plaidAccountsModel
                                                            .accounts?[m]
                                                            .balances
                                                            .current
                                                            .toString() ??
                                                        ''),
                                              ],
                                            ),
                                          // accountsRow('Credit Card Utilization',
                                          //     'N12,000.00'),
                                        ],
                                      );
                                    })),
                            SizedBox(height: 20.h),
                            const MonthBudget(),
                            SizedBox(height: 20.h),
                            customCard(
                                228,
                                Container(
                                  padding: EdgeInsets.all(10.h),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 56.h,
                                            width: 60.w,
                                            decoration: BoxDecoration(
                                                color: primaryColor
                                                    .withOpacity(0.1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(14.r))),
                                            child: Center(
                                              child: SizedBox(
                                                height: 22.h,
                                                width: 20.w,
                                                child: Image.asset(
                                                    'assets/images/transVector.png',
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          titleText('Transactions',
                                              size: 20, color: titleTextColor)
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              titleText('Store-1', size: 16),
                                              titleText('\$350', size: 16),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 4.h,
                                                    width: 237.w,
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
                                                    height: 4.h,
                                                    width: 177.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.r)),
                                                        color: primaryColor),
                                                  ),
                                                ],
                                              ),
                                              titleText('Left \$186',
                                                  color: secondaryTextColor,
                                                  size: 12),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              titleText('Store-2', size: 16),
                                              titleText('\$250', size: 16),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 4.h,
                                                    width: 237.w,
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
                                                    height: 4.h,
                                                    width: 137.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.r)),
                                                        color: primaryColor),
                                                  ),
                                                ],
                                              ),
                                              titleText('Left \$186',
                                                  color: secondaryTextColor,
                                                  size: 12),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              )),
        ));
  }
}
