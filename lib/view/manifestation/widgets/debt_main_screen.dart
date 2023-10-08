import 'package:finance_and_budget/controller/manifestation_controller.dart';
import 'package:finance_and_budget/view/manifestation/create_debts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../global_widgets/custom_card.dart';
import '../../global_widgets/custom_text.dart';

class DebtMainScreen extends StatelessWidget {
  const DebtMainScreen({super.key});

  static ManifestationController manifestationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 80.h),
        child: FloatingActionButton(
            onPressed: () {
              print(manifestationController.debtList.length);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const CreateDebts()));
            },
            backgroundColor: white,
            child: const Icon(Icons.add, color: blackTextColor)),
      ),
      body: GetBuilder<ManifestationController>(
        id: 'updateDebtList',
        builder: (controller) {
          return Center(
            child: controller.debtList.isEmpty
                ? Column(
                    children: [
                      SizedBox(height: 50.h),
                      SizedBox(
                        height: 282.h,
                        width: 282.w,
                        child: Image.asset('assets/images/debts.png'),
                      ),
                      SizedBox(height: 10.h),
                      titleText('Add More Debts',
                          size: 25, color: titleTextColor, authPage: true),
                      subTitleText('Add your debts here',
                          authPage: true,
                          color: secondaryTextColor,
                          fontWeight: FontWeight.w400),
                    ],
                  )
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        for (int j = 0;
                            j < controller.debtList.length;
                            j++)
                          Container(
                            margin: EdgeInsets.only(top: 10.h),
                            child: customCard(
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
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(14.r))),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: Image.asset(
                                                'assets/images/creditcard.png',
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  titleText(manifestationController.debtList[j].debtName,
                                                      color: blackTextColor,
                                                      size: 24,
                                                      fontWeight: FontWeight.w400),
                                                  subTitleText('${manifestationController.debtList[j].interestRate}%', size: 10)
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  subTitleText(manifestationController.debtList[j].date,
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
                                                        color: secondaryTextColor
                                                            .withOpacity(0.2)),
                                                  ),
                                                  Container(
                                                    height: 8.h,
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
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  subTitleText('${manifestationController.debtList[j].haveDebt}\$ to go',
                                                      size: 10),
                                                  subTitleText('\$ ${manifestationController.debtList[j].monthlyPayment}', size: 10),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                      ],
                    ),
                  ),
          );
        }
      ),
    );
  }
}
