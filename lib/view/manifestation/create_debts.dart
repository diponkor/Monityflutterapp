import 'package:finance_and_budget/model/debt_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../controller/manifestation_controller.dart';
import '../../utils/utils.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/normal_button.dart';
import '../global_widgets/single_text_field.dart';

class CreateDebts extends StatefulWidget {
  const CreateDebts({super.key});

  @override
  State<CreateDebts> createState() => _CreateDebtsState();
}

class _CreateDebtsState extends State<CreateDebts> {
  ManifestationController manifestationController = Get.find();

  TextEditingController debtNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController requiredController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb?Center(
      child: SizedBox(
        width: 600.w,
        child: Scaffold(
          backgroundColor: bgWhite,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(107.h),
            child: const CustomAppbar(),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
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
                            titleText('What do you owe?',
                                color: titleTextColor, size: 25, authPage: true),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      subTitleText('Debt Name',
                          color: secondaryTextColor.withOpacity(0.8)),
                      SizedBox(height: 5.h),
                      singleTextField(
                          controller: debtNameController, hintText: 'Debt Name'),
                      SizedBox(height: 15.h),
                      subTitleText('Amount',
                          color: secondaryTextColor.withOpacity(0.8)),
                      SizedBox(height: 5.h),
                      singleTextField(
                          controller: amountController, hintText: 'Enter Amount'),
                      subTitleText('Interest Rate',
                          color: secondaryTextColor.withOpacity(0.8)),
                      SizedBox(height: 5.h),
                      singleTextField(
                          controller: interestRateController,
                          hintText: 'Interest Rate'),
                      SizedBox(height: 15.h),
                      subTitleText('Required',
                          color: secondaryTextColor.withOpacity(0.8)),
                      SizedBox(height: 5.h),
                      singleTextField(
                          controller: requiredController, hintText: 'Enter text '),
                      SizedBox(height: 20.h),
                      normalButton('Next', onPressed: () async {
                        if (debtNameController.text.isNotEmpty &&
                            interestRateController.text.isNotEmpty &&
                            amountController.text.isNotEmpty &&
                            requiredController.text.isNotEmpty
                        ) {
                          final debt = DebtModel(
                              debtNameController.text,
                              amountController.text,
                              interestRateController.text,
                              requiredController.text

                          );
                          await manifestationController.createDebt(debt).then((
                              value) {
                            Get.back();
                          });
                        } else {
                          Utils.showSnackBar('Input Fields is required!');
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    ):
    Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
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
                        titleText('What do you owe?',
                            color: titleTextColor, size: 25, authPage: true),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  subTitleText('Debt Name',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: debtNameController, hintText: 'Debt Name'),
                  SizedBox(height: 15.h),
                  subTitleText('Amount',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: amountController, hintText: 'Enter Amount'),
                  subTitleText('Interest Rate',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: interestRateController,
                      hintText: 'Interest Rate'),
                  SizedBox(height: 15.h),
                  subTitleText('Required',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: requiredController, hintText: 'Enter text '),
                  SizedBox(height: 20.h),
                  normalButton('Next', onPressed: () async {
                    if (debtNameController.text.isNotEmpty &&
                        interestRateController.text.isNotEmpty &&
                        amountController.text.isNotEmpty &&
                        requiredController.text.isNotEmpty
                    ) {
                      final debt = DebtModel(
                          debtNameController.text,
                          amountController.text,
                          interestRateController.text,
                          requiredController.text

                      );
                      await manifestationController.createDebt(debt).then((
                          value) {
                        Get.back();
                      });
                    } else {
                      Utils.showSnackBar('Input Fields is required!');
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
