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
import '../../utils/utils.dart';
import '../manifestation/create_manifestation.dart';
import '../manifestation/item_details.dart';

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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GetBuilder<ManifestationController>(
                                        id: 'updateManifestationList',
                                        builder: (controller) {
                                          return controller.manifestationList.length<2
                                              ? Center(
                                                  child: SizedBox(
                                                    height: 10.h,
                                                  ))
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
                                                            margin: EdgeInsets.only(top: 10.h),
                                                            child: customCard(
                                                                150,
                                                                Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        SizedBox(width: 10.w),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                          CrossAxisAlignment.start,
                                                                          children: [
                                                                            titleText(
                                                                                manifestationController
                                                                                    .manifestationList[j]
                                                                                    .goalName,
                                                                                size: 20,
                                                                                fontWeight: FontWeight.w600),
                                                                            SizedBox(height: 5.h),
                                                                            subTitleText(
                                                                                'You goal is to save : \$${manifestationController
                                                                                    .manifestationList[j].amount}',
                                                                                size: 16)
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap: () {
                                                                            Navigator.of(context).push(
                                                                                MaterialPageRoute(
                                                                                    builder: (_) =>
                                                                                        ItemDetails(index: j)));
                                                                          },
                                                                          child: Padding(
                                                                            padding: EdgeInsets.all(8.h),
                                                                            child: Row(
                                                                              children: [
                                                                                subTitleText('View Milestones',
                                                                                    size: 18,
                                                                                    color: blackTextColor),
                                                                                SizedBox(width: 10.w),
                                                                                const Icon(
                                                                                  Icons.arrow_forward,
                                                                                  size: 16,
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const Expanded(child: SizedBox()),
                                                                        GestureDetector(
                                                                          onTap: (){
                                                                            Get.to(CreateManifestation(manifestIndex: j));
                                                                          },
                                                                          child: const Icon(
                                                                            Icons.edit,color: primaryColor,
                                                                          ),
                                                                        ),
                                                                        SizedBox(width: 15.w),
                                                                        GestureDetector(
                                                                          onTap: (){
                                                                            Utils.showWarningDialog('Are you sure to delete this?',
                                                                                onAccept: (){
                                                                                  manifestationController.deleteManifes(j);
                                                                                  Get.back();
                                                                                }
                                                                            );

                                                                          },
                                                                          child: const Icon(
                                                                            Icons.delete_outline,color: red,
                                                                          ),
                                                                        ),
                                                                        SizedBox(width: 20.w),

                                                                      ],
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
                                ),
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
                            //const MonthBudget(),
                            SizedBox(height: 20.h),
                           /* customCard(
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
                                ))*/
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
