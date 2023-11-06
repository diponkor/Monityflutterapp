import 'package:finance_and_budget/model/add_budget_model.dart';
import 'package:finance_and_budget/model/create_budget_model.dart';
import 'package:finance_and_budget/view/budget/widgets/double_text_field.dart';
import 'package:finance_and_budget/view/global_widgets/single_text_field.dart';
import 'package:finance_and_budget/view/global_widgets/normal_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../constants/font_constants.dart';
import '../../controller/budget_controller.dart';
import '../../utils/utils.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';

class CreateBudget extends StatefulWidget {
  final int? budgetIndex;

  const CreateBudget({super.key, this.budgetIndex});

  @override
  State<CreateBudget> createState() => _CreateBudgetState();
}

class _CreateBudgetState extends State<CreateBudget> {
  BudgetController budgetController = Get.find();
  final TextEditingController _budgetName = TextEditingController();
  final TextEditingController _income = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _fixedName = TextEditingController();
  final TextEditingController _fixedExp = TextEditingController();
  final TextEditingController _varName = TextEditingController();
  final TextEditingController _varExp = TextEditingController();
  final TextEditingController _sinkName = TextEditingController();
  final TextEditingController _sinkFunds = TextEditingController();

  String startDate = 'Start Date';
  String endDate = 'End Date';
  var dateText;

  //DropDown....
  List<String> dropdownItems = ['Drop 1', 'Drop 2', 'Drop 3', 'Drop 4'];
  String? selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.budgetIndex != null) {
      _budgetName.text =
          budgetController.budgetList[widget.budgetIndex!].budgetName;
      // _income.text = budgetController.budgetList[widget.budgetIndex!].income;
      // _amount.text = budgetController.budgetList[widget.budgetIndex!].amount;
      // _fixedName.text =
      //     budgetController.budgetList[widget.budgetIndex!].fixedName;
      // _fixedExp.text =
      //     budgetController.budgetList[widget.budgetIndex!].fixedExp;
      // _varName.text =
      //     budgetController.budgetList[widget.budgetIndex!].variableName;
      // _varExp.text =
      //     budgetController.budgetList[widget.budgetIndex!].variableExp;
      // _sinkName.text =
      //     budgetController.budgetList[widget.budgetIndex!].sinkingName;
      // _sinkFunds.text =
      //     budgetController.budgetList[widget.budgetIndex!].sinkingFunds;
    }
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _budgetName.dispose();
    _income.dispose();
    _amount.dispose();
    _fixedName.dispose();
    _fixedExp.dispose();
    _varName.dispose();
    _varExp.dispose();
    _sinkName.dispose();
    _sinkFunds.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb
        ? Center(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            titleText('Budget',
                                size: 30, color: titleTextColor, authPage: true),
                            SizedBox(height: 10.h),
                            subTitleText('Budget Name',
                                color: secondaryTextColor.withOpacity(0.8)),
                            SizedBox(height: 5.h),
                            singleTextField(
                                controller: _budgetName, hintText: 'Budget Name'),
                            SizedBox(height: 10.h),
                            subTitleText('Start Date & End Date',
                                color: secondaryTextColor.withOpacity(0.8)),
                            SizedBox(height: 5.h),
                            Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                                border: Border.all(
                                  color: blackTextColor,
                                  width: 1.w,
                                ),
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101));
                                      String formattedDate =
                                      DateFormat('yMMMMd').format(pickedDate!);

                                      setState(() {
                                        startDate = formattedDate;
                                        dateText = '$startDate $endDate';
                                      });
                                    },
                                    child: SizedBox(
                                      width: 175.w,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: TextFormField(
                                          enabled: false,
                                          controller: TextEditingController(
                                              text: startDate),
                                          style: TextStyle(
                                              fontSize: 16.h,
                                              color: blackTextColor),
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(
                                                fontSize: 16.sp,
                                                color: secondaryTextColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const VerticalDivider(
                                    color: blackTextColor,
                                    thickness: 1,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101));
                                      String formattedDate =
                                      DateFormat('yMMMMd').format(pickedDate!);

                                      setState(() {
                                        endDate = formattedDate;
                                        dateText = '$startDate $endDate';
                                      });
                                    },
                                    child: SizedBox(
                                      width: 175.w,
                                      child: TextFormField(
                                        enabled: false,
                                        controller:
                                        TextEditingController(text: endDate),
                                        style: TextStyle(
                                            fontSize: 16.h, color: blackTextColor),
                                        decoration: InputDecoration(
                                          hintText: 'hintText2',
                                          hintStyle: TextStyle(
                                              fontSize: 16.sp,
                                              color: secondaryTextColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120.w,
                                  child: subTitleText('Income',
                                      color: secondaryTextColor.withOpacity(0.8)),
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        budgetController.incomeControllers.add(TextEditingController());
                                        budgetController.amountControllers.add(TextEditingController());
                                      });
                                    },
                                    child: titleText('Add',
                                        size: 20, color: titleTextColor)),
                                Row(
                                  children: [
                                    titleText('Choose',
                                        size: 20, color: titleTextColor),
                                    SizedBox(
                                        height: 20.h,
                                        width: 100.h,
                                        child: incomeDropDown()),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Column(children: [
                              for (int i = 0;
                              i < budgetController.incomeControllers.length;
                              i++)
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0.h),
                                  child: doubleTextField(
                                      icon: Icons.delete_forever,
                                      iconPress: () {
                                        setState(() {
                                          budgetController.incomeControllers.removeAt(i);
                                          budgetController.amountControllers.removeAt(i);
                                        });
                                      },
                                      isEnable: true,
                                      controller1:budgetController.incomeControllers[i],
                                      controller2: budgetController.amountControllers[i],
                                      hintText1: 'Income',
                                      hintText2: 'Amount',
                                      iconBgColor: extraColor),
                                ),
                            ]),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120.w,
                                  child: subTitleText('Fixed Expense',
                                      color: secondaryTextColor.withOpacity(0.8)),
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        budgetController.fixedNameControllers.add(TextEditingController());
                                        budgetController.fixedExpControllers.add(TextEditingController());
                                      });
                                    },
                                    child: titleText('Add',
                                        size: 20, color: titleTextColor)),
                                Row(
                                  children: [
                                    titleText('Choose',
                                        size: 20, color: titleTextColor),
                                    SizedBox(
                                        height: 20.h,
                                        width: 100.h,
                                        child: fixedExpDropDown()),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Column(children: [
                              for (int i = 0; i <budgetController.fixedNameControllers.length; i++)
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0.h),
                                  child: doubleTextField(
                                      icon: Icons.delete_forever,
                                      iconPress: () {
                                        setState(() {
                                          budgetController.fixedNameControllers.removeAt(i);
                                          budgetController.fixedExpControllers.removeAt(i);
                                        });
                                      },
                                      isEnable: true,
                                      controller1:budgetController.fixedNameControllers[i],
                                      controller2: budgetController.fixedExpControllers[i],
                                      hintText1: 'Fixed Name',
                                      hintText2: 'Fixed Expense',
                                      iconBgColor: extraColor),
                                ),
                            ]),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120.w,
                                  child: subTitleText('Variable Expense',
                                      color: secondaryTextColor.withOpacity(0.8)),
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        budgetController.varNameControllers.add(TextEditingController());
                                        budgetController.varExpControllers.add(TextEditingController());
                                      });
                                    },
                                    child: titleText('Add',
                                        size: 20, color: titleTextColor)),
                                Row(
                                  children: [
                                    titleText('Choose',
                                        size: 20, color: titleTextColor),
                                    SizedBox(
                                        height: 20.h,
                                        width: 100.h,
                                        child: varExpDropDown()),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Column(children: [
                              for (int i = 0; i < budgetController.varNameControllers.length; i++)
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0.h),
                                  child: doubleTextField(
                                      icon: Icons.delete_forever,
                                      iconPress: () {
                                        setState(() {
                                          budgetController.varNameControllers.removeAt(i);
                                          budgetController.varExpControllers.removeAt(i);
                                        });
                                      },
                                      controller1: budgetController.varNameControllers[i],
                                      controller2: budgetController.varExpControllers[i],
                                      hintText1: 'Variable Name',
                                      hintText2: 'Variable Expense',
                                      iconBgColor: extraColor),
                                ),
                            ]),
                            SizedBox(height: 15.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120.w,
                                  child: subTitleText('Sinking Funds',
                                      color: secondaryTextColor.withOpacity(0.8)),
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        budgetController.sinkNameControllers.add(TextEditingController());
                                        budgetController.sinkFundControllers.add(TextEditingController());
                                      });
                                    },
                                    child: titleText('Add',
                                        size: 20, color: titleTextColor)),
                                Row(
                                  children: [
                                    titleText('Choose',
                                        size: 20, color: titleTextColor),
                                    SizedBox(
                                        height: 20.h,
                                        width: 100.h,
                                        child: sinkFundsDropDown()),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Column(children: [
                              for (int i = 0; i < budgetController.sinkNameControllers.length; i++)
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0.h),
                                  child: GestureDetector(
                                    child: doubleTextField(
                                        icon: Icons.delete_forever,
                                        iconPress: () {
                                          setState(() {
                                            budgetController.sinkNameControllers.removeAt(i);
                                            budgetController.sinkFundControllers.removeAt(i);
                                          });
                                        },
                                        controller1: budgetController.sinkNameControllers[i],
                                        controller2: budgetController.sinkFundControllers[i],
                                        hintText1: 'Sinking Name',
                                        hintText2: 'Sinking Funds',
                                        iconBgColor: extraColor),
                                  ),
                                ),
                            ]),
                            SizedBox(height: 15.h),
                            normalButton('Next', onPressed: () async {
                              budgetController.makeIncomeMap();
                              budgetController.makeFixedExpMap();
                              budgetController.makeVarExpMap();
                              budgetController.makeSinkFundMap();
                              // if (_budgetName.text.isNotEmpty &&
                              //     dateText.isNotEmpty &&
                              //     _income.text.isNotEmpty &&
                              //     _amount.text.isNotEmpty &&
                              //     _fixedName.text.isNotEmpty &&
                              //     _fixedExp.text.isNotEmpty &&
                              //     _varName.text.isNotEmpty &&
                              //     _varExp.text.isNotEmpty &&
                              //     _sinkName.text.isNotEmpty &&
                              //     _sinkFunds.text.isNotEmpty) {
                              final budget = AddBudgetModel(
                                // widget.budgetIndex != null
                                //     ? budgetController
                                //         .budgetList[widget.budgetIndex!].id
                                //     :
                                  '',
                                  _budgetName.text,
                                  dateText,
                                  budgetController.incomeAmountMap,
                                  budgetController.fixedExpMap,
                                  budgetController.varExpMap,
                                  budgetController.sinkFundMap

                              );
                              // widget.budgetIndex != null
                              //     ? await budgetController
                              //         .updateBudget(budget)
                              //         .then((value) {
                              //         Navigator.of(context).pop();
                              //       })
                              //     :
                              await budgetController
                                  .createBudget(budget)
                                  .then((value) {
                                Navigator.of(context).pop();
                                budgetController.incomeControllers=[];
                                budgetController.amountControllers=[];
                                budgetController.fixedNameControllers=[];
                                budgetController.fixedExpControllers=[];
                                budgetController.varNameControllers=[];
                                budgetController.varExpControllers=[];
                                budgetController.sinkNameControllers=[];
                                budgetController.sinkFundControllers=[];
                                budgetController.incomeAmountMap={};
                                budgetController.fixedExpMap={};
                                budgetController.varExpMap={};
                                budgetController.sinkFundMap={};
                              });
                              // } else {
                              //   Utils.showSnackBar('Input Fields is required!');
                              // }
                            }),
                            SizedBox(height: 15.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: bgWhite,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(107.h),
              child: const CustomAppbar(),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        titleText('Budget',
                            size: 30, color: titleTextColor, authPage: true),
                        SizedBox(height: 10.h),
                        subTitleText('Budget Name',
                            color: secondaryTextColor.withOpacity(0.8)),
                        SizedBox(height: 5.h),
                        singleTextField(
                            controller: _budgetName, hintText: 'Budget Name'),
                        SizedBox(height: 10.h),
                        subTitleText('Start Date & End Date',
                            color: secondaryTextColor.withOpacity(0.8)),
                        SizedBox(height: 5.h),
                        Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.r)),
                            border: Border.all(
                              color: blackTextColor,
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));
                                  String formattedDate =
                                      DateFormat('yMMMMd').format(pickedDate!);

                                  setState(() {
                                    startDate = formattedDate;
                                    dateText = '$startDate $endDate';
                                  });
                                },
                                child: SizedBox(
                                  width: 175.w,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: TextFormField(
                                      enabled: false,
                                      controller: TextEditingController(
                                          text: startDate),
                                      style: TextStyle(
                                          fontSize: 16.h,
                                          color: blackTextColor),
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            fontSize: 16.sp,
                                            color: secondaryTextColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                color: blackTextColor,
                                thickness: 1,
                              ),
                              InkWell(
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));
                                  String formattedDate =
                                      DateFormat('yMMMMd').format(pickedDate!);

                                  setState(() {
                                    endDate = formattedDate;
                                    dateText = '$startDate $endDate';
                                  });
                                },
                                child: SizedBox(
                                  width: 175.w,
                                  child: TextFormField(
                                    enabled: false,
                                    controller:
                                        TextEditingController(text: endDate),
                                    style: TextStyle(
                                        fontSize: 16.h, color: blackTextColor),
                                    decoration: InputDecoration(
                                      hintText: 'hintText2',
                                      hintStyle: TextStyle(
                                          fontSize: 16.sp,
                                          color: secondaryTextColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: subTitleText('Income',
                                  color: secondaryTextColor.withOpacity(0.8)),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    budgetController.incomeControllers.add(TextEditingController());
                                    budgetController.amountControllers.add(TextEditingController());
                                  });
                                },
                                child: titleText('Add',
                                    size: 20, color: titleTextColor)),
                            Row(
                              children: [
                                titleText('Choose',
                                    size: 20, color: titleTextColor),
                                SizedBox(
                                    height: 20.h,
                                    width: 100.h,
                                    child: incomeDropDown()),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Column(children: [
                          for (int i = 0;
                              i < budgetController.incomeControllers.length;
                              i++)
                            Padding(
                              padding: EdgeInsets.only(top: 5.0.h),
                              child: doubleTextField(
                                  icon: Icons.delete_forever,
                                  iconPress: () {
                                    setState(() {
                                      budgetController.incomeControllers.removeAt(i);
                                      budgetController.amountControllers.removeAt(i);
                                    });
                                  },
                                  isEnable: true,
                                  controller1:budgetController.incomeControllers[i],
                                  controller2: budgetController.amountControllers[i],
                                  hintText1: 'Income',
                                  hintText2: 'Amount',
                                  iconBgColor: extraColor),
                            ),
                        ]),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: subTitleText('Fixed Expense',
                                  color: secondaryTextColor.withOpacity(0.8)),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    budgetController.fixedNameControllers.add(TextEditingController());
                                    budgetController.fixedExpControllers.add(TextEditingController());
                                  });
                                },
                                child: titleText('Add',
                                    size: 20, color: titleTextColor)),
                            Row(
                              children: [
                                titleText('Choose',
                                    size: 20, color: titleTextColor),
                                SizedBox(
                                    height: 20.h,
                                    width: 100.h,
                                    child: fixedExpDropDown()),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Column(children: [
                          for (int i = 0; i <budgetController.fixedNameControllers.length; i++)
                            Padding(
                              padding: EdgeInsets.only(top: 5.0.h),
                              child: doubleTextField(
                                  icon: Icons.delete_forever,
                                  iconPress: () {
                                    setState(() {
                                      budgetController.fixedNameControllers.removeAt(i);
                                      budgetController.fixedExpControllers.removeAt(i);
                                    });
                                  },
                                  isEnable: true,
                                  controller1:budgetController.fixedNameControllers[i],
                                  controller2: budgetController.fixedExpControllers[i],
                                  hintText1: 'Fixed Name',
                                  hintText2: 'Fixed Expense',
                                  iconBgColor: extraColor),
                            ),
                        ]),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: subTitleText('Variable Expense',
                                  color: secondaryTextColor.withOpacity(0.8)),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    budgetController.varNameControllers.add(TextEditingController());
                                    budgetController.varExpControllers.add(TextEditingController());
                                  });
                                },
                                child: titleText('Add',
                                    size: 20, color: titleTextColor)),
                            Row(
                              children: [
                                titleText('Choose',
                                    size: 20, color: titleTextColor),
                                SizedBox(
                                    height: 20.h,
                                    width: 100.h,
                                    child: varExpDropDown()),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Column(children: [
                          for (int i = 0; i < budgetController.varNameControllers.length; i++)
                            Padding(
                              padding: EdgeInsets.only(top: 5.0.h),
                              child: doubleTextField(
                                  icon: Icons.delete_forever,
                                  iconPress: () {
                                    setState(() {
                                      budgetController.varNameControllers.removeAt(i);
                                      budgetController.varExpControllers.removeAt(i);
                                    });
                                  },
                                  controller1: budgetController.varNameControllers[i],
                                  controller2: budgetController.varExpControllers[i],
                                  hintText1: 'Variable Name',
                                  hintText2: 'Variable Expense',
                                  iconBgColor: extraColor),
                            ),
                        ]),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 120.w,
                              child: subTitleText('Sinking Funds',
                                  color: secondaryTextColor.withOpacity(0.8)),
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    budgetController.sinkNameControllers.add(TextEditingController());
                                    budgetController.sinkFundControllers.add(TextEditingController());
                                  });
                                },
                                child: titleText('Add',
                                    size: 20, color: titleTextColor)),
                            Row(
                              children: [
                                titleText('Choose',
                                    size: 20, color: titleTextColor),
                                SizedBox(
                                    height: 20.h,
                                    width: 100.h,
                                    child: sinkFundsDropDown()),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Column(children: [
                          for (int i = 0; i < budgetController.sinkNameControllers.length; i++)
                            Padding(
                              padding: EdgeInsets.only(top: 5.0.h),
                              child: GestureDetector(
                                child: doubleTextField(
                                    icon: Icons.delete_forever,
                                    iconPress: () {
                                      setState(() {
                                        budgetController.sinkNameControllers.removeAt(i);
                                        budgetController.sinkFundControllers.removeAt(i);
                                      });
                                    },
                                    controller1: budgetController.sinkNameControllers[i],
                                    controller2: budgetController.sinkFundControllers[i],
                                    hintText1: 'Sinking Name',
                                    hintText2: 'Sinking Funds',
                                    iconBgColor: extraColor),
                              ),
                            ),
                        ]),
                        SizedBox(height: 15.h),
                        normalButton('Next', onPressed: () async {
                          budgetController.makeIncomeMap();
                          budgetController.makeFixedExpMap();
                          budgetController.makeVarExpMap();
                          budgetController.makeSinkFundMap();
                          // if (_budgetName.text.isNotEmpty &&
                          //     dateText.isNotEmpty &&
                          //     _income.text.isNotEmpty &&
                          //     _amount.text.isNotEmpty &&
                          //     _fixedName.text.isNotEmpty &&
                          //     _fixedExp.text.isNotEmpty &&
                          //     _varName.text.isNotEmpty &&
                          //     _varExp.text.isNotEmpty &&
                          //     _sinkName.text.isNotEmpty &&
                          //     _sinkFunds.text.isNotEmpty) {
                            final budget = AddBudgetModel(
                              // widget.budgetIndex != null
                              //     ? budgetController
                              //         .budgetList[widget.budgetIndex!].id
                              //     :
                              '',
                              _budgetName.text,
                              dateText,
                              budgetController.incomeAmountMap,
                              budgetController.fixedExpMap,
                              budgetController.varExpMap,
                              budgetController.sinkFundMap

                            );
                            // widget.budgetIndex != null
                            //     ? await budgetController
                            //         .updateBudget(budget)
                            //         .then((value) {
                            //         Navigator.of(context).pop();
                            //       })
                            //     :
                            await budgetController
                                    .createBudget(budget)
                                    .then((value) {
                                    Navigator.of(context).pop();
                                    budgetController.incomeControllers=[];
                                    budgetController.amountControllers=[];
                                    budgetController.fixedNameControllers=[];
                                    budgetController.fixedExpControllers=[];
                                    budgetController.varNameControllers=[];
                                    budgetController.varExpControllers=[];
                                    budgetController.sinkNameControllers=[];
                                    budgetController.sinkFundControllers=[];
                                    budgetController.incomeAmountMap={};
                                    budgetController.fixedExpMap={};
                                    budgetController.varExpMap={};
                                    budgetController.sinkFundMap={};
                                  });
                          // } else {
                          //   Utils.showSnackBar('Input Fields is required!');
                          // }
                        }),
                        SizedBox(height: 15.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget incomeDropDown() {
    return DropdownButton<String>(
      iconEnabledColor: titleTextColor,
      value: selectedValue,
      items: dropdownItems.map((dynamic val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(val,
                style: TextStyle(color: white, fontSize: fontVerySmall)),
          ),
        );
      }).toList(),
      borderRadius: BorderRadius.circular(10),
      underline: const SizedBox(),
      disabledHint: const Text('Disable'),
      isExpanded: true,
      dropdownColor: primaryColor,
      hint: const Text('Choose Donation Type', style: TextStyle(color: white)),
      style: TextStyle(color: primaryColor, fontSize: fontVerySmall),
      onChanged: (value) {
        setState(() {
          budgetController.incomeControllers.add(TextEditingController(text: value));
          budgetController.amountControllers.add(TextEditingController());
        });
      },
    );
  }

  Widget fixedExpDropDown() {
    return DropdownButton<String>(
      iconEnabledColor: titleTextColor,
      value: selectedValue,
      items: dropdownItems.map((dynamic val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(val,
                style: TextStyle(color: white, fontSize: fontVerySmall)),
          ),
        );
      }).toList(),
      borderRadius: BorderRadius.circular(10),
      underline: const SizedBox(),
      disabledHint: const Text('Disable'),
      isExpanded: true,
      dropdownColor: primaryColor,
      hint: const Text('Choose Donation Type', style: TextStyle(color: white)),
      style: TextStyle(color: primaryColor, fontSize: fontVerySmall),
      onChanged: (value) {
        setState(() {
          budgetController.fixedNameControllers.add(TextEditingController(text: value));
          budgetController.fixedExpControllers.add(TextEditingController());
        });
      },
    );
  }

  Widget varExpDropDown() {
    return DropdownButton<String>(
      iconEnabledColor: titleTextColor,
      value: selectedValue,
      items: dropdownItems.map((dynamic val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(val,
                style: TextStyle(color: white, fontSize: fontVerySmall)),
          ),
        );
      }).toList(),
      borderRadius: BorderRadius.circular(10),
      underline: const SizedBox(),
      disabledHint: const Text('Disable'),
      isExpanded: true,
      dropdownColor: primaryColor,
      hint: const Text('Choose Donation Type', style: TextStyle(color: white)),
      style: TextStyle(color: primaryColor, fontSize: fontVerySmall),
      onChanged: (value) {
        setState(() {
          budgetController.varNameControllers.add(TextEditingController(text: value));
          budgetController.varExpControllers.add(TextEditingController());
        });
      },
    );
  }

  Widget sinkFundsDropDown() {
    return DropdownButton<String>(
      iconEnabledColor: titleTextColor,
      value: selectedValue,
      items: dropdownItems.map((dynamic val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(val,
                style: TextStyle(color: white, fontSize: fontVerySmall)),
          ),
        );
      }).toList(),
      borderRadius: BorderRadius.circular(10),
      underline: const SizedBox(),
      disabledHint: const Text('Disable'),
      isExpanded: true,
      dropdownColor: primaryColor,
      hint: const Text('Choose Donation Type', style: TextStyle(color: white)),
      style: TextStyle(color: primaryColor, fontSize: fontVerySmall),
      onChanged: (value) {
        setState(() {
          budgetController.sinkNameControllers.add(TextEditingController(text: value));
          budgetController.sinkFundControllers.add(TextEditingController());
        });
      },
    );
  }
}
