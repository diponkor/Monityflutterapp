import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/controller/account_controller.dart';
import 'package:finance_and_budget/view/global_widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShowAccountDetails extends StatelessWidget {
  const ShowAccountDetails({super.key});

  static AccountController accountController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileBgColor,
      body: SafeArea(
        child: GetBuilder<AccountController>(
            id: 'updateDetails',
            builder: (con) {
              return con.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 50.h),
                          for (int i = 0;
                              i <
                                  accountController
                                      .plaidAccountsModel.accounts!.length;
                              i++)
                            Column(
                              children: [
                                Center(
                                  child: customCard(
                                    210,
                                    Column(
                                      children: [
                                        buildDetailsRow(
                                            'Account Name : ',
                                            accountController.plaidAccountsModel
                                                    .accounts?[i].name ??
                                                ''),
                                        buildDetailsRow(
                                            'Type : ',
                                            accountController.plaidAccountsModel
                                                    .accounts?[i].type ??
                                                ''),
                                        buildDetailsRow(
                                            'Subtype : ',
                                            accountController.plaidAccountsModel
                                                    .accounts?[i].subtype ??
                                                ''),
                                        buildDetailsRow(
                                            'Mask : ',
                                            accountController.plaidAccountsModel
                                                    .accounts?[i].mask ??
                                                ''),
                                        buildDetailsRow(
                                            'Balance Available : ',
                                            accountController.plaidAccountsModel
                                                .accounts![i].balances.available
                                                .toString()),
                                        buildDetailsRow(
                                            'Current Balance : ',
                                            accountController.plaidAccountsModel
                                                .accounts![i].balances.current
                                                .toString()),
                                        buildDetailsRow(
                                            'Limit : ',
                                            accountController.plaidAccountsModel
                                                .accounts![i].balances.limit
                                                .toString()),
                                        buildDetailsRow(
                                            'Iso Currency Code : ',
                                            accountController
                                                .plaidAccountsModel
                                                .accounts![i]
                                                .balances
                                                .isoCurrencyCode
                                                .toString()),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                        ],
                      ),
                    );
            }),
      ),
    );
  }

  Widget buildDetailsRow(String text1, String text2) {
    return Row(
      children: [
        Text(text1),
        Text(text2),
      ],
    );
  }
}
