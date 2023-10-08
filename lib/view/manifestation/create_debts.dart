import 'package:finance_and_budget/model/debt_model.dart';
import 'package:finance_and_budget/view/manifestation/debts_item_screen.dart';
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
  TextEditingController interestRateController = TextEditingController();
  TextEditingController haveDebtController = TextEditingController();
  TextEditingController monthlyPaymentController = TextEditingController();

  var dateText = 'Ex. - 30 JUNE 2023';

  List<String> popularDebtsList = [
    'Bank Loan',
    'Car Loan',
    'Mortgage',
    'Money'
  ];
  String selectedPopularDebt = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        titleText('What debt do you have?',
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
                  subTitleText('Choose Popular debt'),
                  SizedBox(height: 5.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int x = 0; x < popularDebtsList.length; x++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPopularDebt = popularDebtsList[x];
                              });
                              print(selectedPopularDebt);
                            },
                            child: Container(
                              height: 40.h,
                              width: 122.w,
                              margin: EdgeInsets.only(right: 5.w),
                              decoration: BoxDecoration(
                                  color:
                                  selectedPopularDebt == popularDebtsList[x]
                                      ? blackTextColor
                                      : bgWhite,
                                  border: Border.all(
                                      color: blackTextColor, width: 1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.r))),
                              child: Center(
                                child: subTitleText(popularDebtsList[x],
                                    color: selectedPopularDebt ==
                                        popularDebtsList[x]
                                        ? white
                                        : secondaryTextColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  subTitleText('Interest Rate',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: interestRateController,
                      hintText: 'ex:-  200'),
                  SizedBox(height: 15.h),
                  subTitleText('How much remaining debt do you have ?',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: haveDebtController, hintText: 'ex:-  200'),
                  SizedBox(height: 15.h),
                  subTitleText('Monthly Payment ',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: monthlyPaymentController,
                      hintText: 'Monthly'),
                  SizedBox(height: 15.h),
                  Align(
                    alignment: Alignment.center,
                    child: subTitleText('Or',
                        color: secondaryTextColor.withOpacity(0.8)),
                  ),
                  SizedBox(height: 15.h),
                  subTitleText('Target Date',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  Container(
                    height: 50.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: black, width: 1)),
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));
                        String formattedDate =
                        DateFormat('yMMMMd').format(pickedDate!);

                        setState(() {
                          dateText = formattedDate;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: subTitleText(dateText,
                                  color: blackTextColor,
                                  fontWeight: FontWeight.w400,
                                  size: 18)),
                          const Icon(
                            Icons.calendar_month,
                            color: secondaryTextColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  normalButton('Next', onPressed: () async {
                    if (debtNameController.text.isNotEmpty &&
                        selectedPopularDebt.isNotEmpty &&
                        interestRateController.text.isNotEmpty &&
                        haveDebtController.text.isNotEmpty &&
                        monthlyPaymentController.text.isNotEmpty &&
                        dateText.isNotEmpty) {
                      final debt = DebtModel(
                        debtNameController.text,
                        selectedPopularDebt,
                        interestRateController.text,
                        haveDebtController.text,
                        monthlyPaymentController.text,
                        dateText,
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
