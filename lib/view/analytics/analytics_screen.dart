import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../controller/account_controller.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';
import '../home/widgets/accounts_row.dart';

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

  AccountController accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
     /* floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 80.h),
        child: FloatingActionButton(
            onPressed: () {
              Get.to(const ReceiptsScreen());
            },
            backgroundColor: white,
            child: const Icon(Icons.add, color: blackTextColor)),
      ),*/
      body: SingleChildScrollView(
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
      ),
    );
  }
}
