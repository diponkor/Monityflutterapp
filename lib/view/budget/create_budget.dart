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
  int incomeItem = 0;
  int fixedItem = 0;
  int varItem = 0;
  int sinkItem = 0;
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

   String startDate = '30 JUNE 2023';
   String endDate = '30 JULY 2023';
  var dateText ;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.budgetIndex != null) {
      _budgetName.text =
          budgetController.budgetList[widget.budgetIndex!].budgetName;
      _income.text = budgetController.budgetList[widget.budgetIndex!].income;
      _amount.text = budgetController.budgetList[widget.budgetIndex!].amount;
      _fixedName.text =
          budgetController.budgetList[widget.budgetIndex!].fixedName;
      _fixedExp.text =
          budgetController.budgetList[widget.budgetIndex!].fixedExp;
      _varName.text =
          budgetController.budgetList[widget.budgetIndex!].variableName;
      _varExp.text =
          budgetController.budgetList[widget.budgetIndex!].variableExp;
      _sinkName.text =
          budgetController.budgetList[widget.budgetIndex!].sinkingName;
      _sinkFunds.text =
          budgetController.budgetList[widget.budgetIndex!].sinkingFunds;
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
                                size: 30,
                                color: titleTextColor,
                                authPage: true),
                            SizedBox(height: 10.h),
                            subTitleText('Budget Name',
                                color: secondaryTextColor.withOpacity(0.8)),
                            SizedBox(height: 5.h),
                            singleTextField(
                                controller: _budgetName,
                                hintText: 'Budget Name'),
                            SizedBox(height: 10.h),
                            subTitleText('Start Date & End Date',
                                color: secondaryTextColor.withOpacity(0.8)),
                            SizedBox(height: 5.h),
                            Container(
                              height: 50.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                                border: Border.all(
                                  color: blackTextColor,
                                  width: 1.w,
                                ),
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap:() async {
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
                                          controller: TextEditingController(text: startDate),
                                          style: TextStyle(fontSize: 16.h, color: blackTextColor),
                                          decoration: InputDecoration(
                                            hintStyle:
                                            TextStyle(fontSize: 16.sp, color: secondaryTextColor),
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
                                    onTap:() async {
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
                                        controller: TextEditingController(text: endDate),
                                        style: TextStyle(fontSize: 16.h, color: blackTextColor),
                                        decoration: InputDecoration(
                                          hintText: 'hintText2',
                                          hintStyle: TextStyle(fontSize: 16.sp, color: secondaryTextColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            subTitleText('Income',
                                color: secondaryTextColor.withOpacity(0.8)),
                            SizedBox(height: 5.h),
                            doubleTextField(
                                iconPress: () {
                                  setState(() {
                                    incomeItem++;
                                  });
                                },
                                icon: Icons.add,
                                controller1: _income,
                                controller2: _amount,
                                hintText1: 'Income',
                                hintText2: 'Amount',
                                iconBgColor: primaryColor),
                            Column(children: [
                              for (int i = 0; i < incomeItem; i++)
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: const Text(
                                                'Please upgrade your storage'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    incomeItem = 0;
                                                    fixedItem = 0;
                                                    varItem = 0;
                                                    sinkItem = 0;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: doubleTextField(
                                        icon: Icons.remove,
                                        iconPress: () {
                                          setState(() {
                                            incomeItem--;
                                          });
                                        },
                                        isEnable: false,
                                        controller1: TextEditingController(),
                                        controller2: TextEditingController(),
                                        hintText1: 'Income',
                                        hintText2: 'Amount',
                                        iconBgColor: extraColor),
                                  ),
                                ),
                            ]),
                            SizedBox(height: 10.h),
                            subTitleText('Fixed Expense',
                                color: secondaryTextColor.withOpacity(0.8)),
                            SizedBox(height: 5.h),
                            doubleTextField(
                                icon: Icons.add,
                                iconPress: () {
                                  setState(() {
                                    fixedItem++;
                                  });
                                },
                                controller1: _fixedName,
                                controller2: _fixedExp,
                                hintText1: 'Fixed Name',
                                hintText2: 'Fixed Expense',
                                iconBgColor: primaryColor),
                            Column(children: [
                              for (int i = 0; i < fixedItem; i++)
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: const Text(
                                                'Please upgrade your storage'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    incomeItem = 0;
                                                    fixedItem = 0;
                                                    varItem = 0;
                                                    sinkItem = 0;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: doubleTextField(
                                        icon: Icons.remove,
                                        iconPress: () {
                                          setState(() {
                                            fixedItem--;
                                          });
                                        },
                                        isEnable: false,
                                        controller1: TextEditingController(),
                                        controller2: TextEditingController(),
                                        hintText1: 'Fixed Name',
                                        hintText2: 'Fixed Expense',
                                        iconBgColor: extraColor),
                                  ),
                                ),
                            ]),
                            SizedBox(height: 15.h),
                            subTitleText('Variable Expense',
                                color: secondaryTextColor.withOpacity(0.8)),
                            SizedBox(height: 5.h),
                            doubleTextField(
                                icon: Icons.add,
                                iconPress: () {
                                  setState(() {
                                    varItem++;
                                  });
                                },
                                controller1: _varName,
                                controller2: _varExp,
                                hintText1: 'Variable Name',
                                hintText2: 'Variable Expense',
                                iconBgColor: primaryColor),
                            Column(children: [
                              for (int i = 0; i < varItem; i++)
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: const Text(
                                                'Please upgrade your storage'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    incomeItem = 0;
                                                    fixedItem = 0;
                                                    varItem = 0;
                                                    sinkItem = 0;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: doubleTextField(
                                        icon: Icons.remove,
                                        iconPress: () {
                                          setState(() {
                                            varItem--;
                                          });
                                        },
                                        isEnable: false,
                                        controller1: TextEditingController(),
                                        controller2: TextEditingController(),
                                        hintText1: 'Variable Name',
                                        hintText2: 'Variable Expense',
                                        iconBgColor: extraColor),
                                  ),
                                ),
                            ]),
                            SizedBox(height: 10.h),
                            subTitleText('Sinking Funds',
                                color: secondaryTextColor.withOpacity(0.8)),
                            SizedBox(height: 5.h),
                            doubleTextField(
                                icon: Icons.add,
                                iconPress: () {
                                  setState(() {
                                    sinkItem++;
                                  });
                                },
                                controller1: _sinkName,
                                controller2: _sinkFunds,
                                hintText1: 'Sinking Name',
                                hintText2: 'Sinking Funds',
                                iconBgColor: primaryColor),
                            Column(children: [
                              for (int i = 0; i < sinkItem; i++)
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: const Text(
                                                'Please upgrade your storage'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    incomeItem = 0;
                                                    fixedItem = 0;
                                                    varItem = 0;
                                                    sinkItem = 0;
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: doubleTextField(
                                        icon: Icons.remove,
                                        iconPress: () {
                                          setState(() {
                                            sinkItem--;
                                          });
                                        },
                                        isEnable: false,
                                        controller1: TextEditingController(),
                                        controller2: TextEditingController(),
                                        hintText1: 'Sinking Name',
                                        hintText2: 'Sinking Funds',
                                        iconBgColor: extraColor),
                                  ),
                                ),
                            ]),
                            SizedBox(height: 15.h),
                            normalButton('Next', onPressed: () async {
                              if (_budgetName.text.isNotEmpty &&
                                  dateText.isNotEmpty &&
                                  _income.text.isNotEmpty &&
                                  _amount.text.isNotEmpty &&
                                  _fixedName.text.isNotEmpty &&
                                  _fixedExp.text.isNotEmpty &&
                                  _varName.text.isNotEmpty &&
                                  _varExp.text.isNotEmpty &&
                                  _sinkName.text.isNotEmpty &&
                                  _sinkFunds.text.isNotEmpty) {
                                final budget = CreateBudgetModel(
                                  widget.budgetIndex != null
                                      ? budgetController
                                      .budgetList[widget.budgetIndex!].id
                                      : '',
                                  _budgetName.text,
                                  dateText,
                                  _income.text,
                                  _amount.text,
                                  _fixedName.text,
                                  _fixedExp.text,
                                  _varName.text,
                                  _varExp.text,
                                  _sinkName.text,
                                  _sinkFunds.text,
                                );
                                widget.budgetIndex!= null
                                    ? await budgetController
                                    .updateBudget(budget)
                                    .then((value) {
                                  Navigator.of(context).pop();
                                })
                                    : await budgetController
                                    .createBudget(budget)
                                    .then((value) {
                                  Navigator.of(context).pop();
                                });
                              } else {
                                Utils.showSnackBar('Input Fields is required!');
                              }
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
                            borderRadius: BorderRadius.all(Radius.circular(5.r)),
                            border: Border.all(
                              color: blackTextColor,
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap:() async {
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
                                      controller: TextEditingController(text: startDate),
                                      style: TextStyle(fontSize: 16.h, color: blackTextColor),
                                      decoration: InputDecoration(
                                        hintStyle:
                                        TextStyle(fontSize: 16.sp, color: secondaryTextColor),
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
                                onTap:() async {
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
                                    controller: TextEditingController(text: endDate),
                                    style: TextStyle(fontSize: 16.h, color: blackTextColor),
                                    decoration: InputDecoration(
                                      hintText: 'hintText2',
                                      hintStyle: TextStyle(fontSize: 16.sp, color: secondaryTextColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        subTitleText('Income',
                            color: secondaryTextColor.withOpacity(0.8)),
                        SizedBox(height: 5.h),
                        doubleTextField(
                            iconPress: () {
                              setState(() {
                                incomeItem++;
                              });
                            },
                            icon: Icons.add,
                            controller1: _income,
                            controller2: _amount,
                            hintText1: 'Income',
                            hintText2: 'Amount',
                            iconBgColor: primaryColor),
                        Column(children: [
                          for (int i = 0; i < incomeItem; i++)
                            Padding(
                              padding: EdgeInsets.only(top: 5.0.h),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: const Text(
                                            'Please upgrade your storage'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                incomeItem = 0;
                                                fixedItem = 0;
                                                varItem = 0;
                                                sinkItem = 0;
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: doubleTextField(
                                    icon: Icons.remove,
                                    iconPress: () {
                                      setState(() {
                                        incomeItem--;
                                      });
                                    },
                                    isEnable: false,
                                    controller1: TextEditingController(),
                                    controller2: TextEditingController(),
                                    hintText1: 'Income',
                                    hintText2: 'Amount',
                                    iconBgColor: extraColor),
                              ),
                            ),
                        ]),
                        SizedBox(height: 10.h),
                        subTitleText('Fixed Expense',
                            color: secondaryTextColor.withOpacity(0.8)),
                        SizedBox(height: 5.h),
                        doubleTextField(
                            icon: Icons.add,
                            iconPress: () {
                              setState(() {
                                fixedItem++;
                              });
                            },
                            controller1: _fixedName,
                            controller2: _fixedExp,
                            hintText1: 'Fixed Name',
                            hintText2: 'Fixed Expense',
                            iconBgColor: primaryColor),
                        Column(children: [
                          for (int i = 0; i < fixedItem; i++)
                            Padding(
                              padding: EdgeInsets.only(top: 5.0.h),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: const Text(
                                            'Please upgrade your storage'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                incomeItem = 0;
                                                fixedItem = 0;
                                                varItem = 0;
                                                sinkItem = 0;
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: doubleTextField(
                                    icon: Icons.remove,
                                    iconPress: () {
                                      setState(() {
                                        fixedItem--;
                                      });
                                    },
                                    isEnable: false,
                                    controller1: TextEditingController(),
                                    controller2: TextEditingController(),
                                    hintText1: 'Fixed Name',
                                    hintText2: 'Fixed Expense',
                                    iconBgColor: extraColor),
                              ),
                            ),
                        ]),
                        SizedBox(height: 15.h),
                        subTitleText('Variable Expense',
                            color: secondaryTextColor.withOpacity(0.8)),
                        SizedBox(height: 5.h),
                        doubleTextField(
                            icon: Icons.add,
                            iconPress: () {
                              setState(() {
                                varItem++;
                              });
                            },
                            controller1: _varName,
                            controller2: _varExp,
                            hintText1: 'Variable Name',
                            hintText2: 'Variable Expense',
                            iconBgColor: primaryColor),
                        Column(children: [
                          for (int i = 0; i < varItem; i++)
                            Padding(
                              padding: EdgeInsets.only(top: 5.0.h),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: const Text(
                                            'Please upgrade your storage'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                incomeItem = 0;
                                                fixedItem = 0;
                                                varItem = 0;
                                                sinkItem = 0;
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: doubleTextField(
                                    icon: Icons.remove,
                                    iconPress: () {
                                      setState(() {
                                        varItem--;
                                      });
                                    },
                                    isEnable: false,
                                    controller1: TextEditingController(),
                                    controller2: TextEditingController(),
                                    hintText1: 'Variable Name',
                                    hintText2: 'Variable Expense',
                                    iconBgColor: extraColor),
                              ),
                            ),
                        ]),
                        SizedBox(height: 10.h),
                        subTitleText('Sinking Funds',
                            color: secondaryTextColor.withOpacity(0.8)),
                        SizedBox(height: 5.h),
                        doubleTextField(
                            icon: Icons.add,
                            iconPress: () {
                              setState(() {
                                sinkItem++;
                              });
                            },
                            controller1: _sinkName,
                            controller2: _sinkFunds,
                            hintText1: 'Sinking Name',
                            hintText2: 'Sinking Funds',
                            iconBgColor: primaryColor),
                        Column(children: [
                          for (int i = 0; i < sinkItem; i++)
                            Padding(
                              padding: EdgeInsets.only(top: 5.0.h),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: const Text(
                                            'Please upgrade your storage'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                incomeItem = 0;
                                                fixedItem = 0;
                                                varItem = 0;
                                                sinkItem = 0;
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: doubleTextField(
                                    icon: Icons.remove,
                                    iconPress: () {
                                      setState(() {
                                        sinkItem--;
                                      });
                                    },
                                    isEnable: false,
                                    controller1: TextEditingController(),
                                    controller2: TextEditingController(),
                                    hintText1: 'Sinking Name',
                                    hintText2: 'Sinking Funds',
                                    iconBgColor: extraColor),
                              ),
                            ),
                        ]),
                        SizedBox(height: 15.h),
                        normalButton('Next', onPressed: () async {
                          if (_budgetName.text.isNotEmpty &&
                              dateText.isNotEmpty &&
                              _income.text.isNotEmpty &&
                              _amount.text.isNotEmpty &&
                              _fixedName.text.isNotEmpty &&
                              _fixedExp.text.isNotEmpty &&
                              _varName.text.isNotEmpty &&
                              _varExp.text.isNotEmpty &&
                              _sinkName.text.isNotEmpty &&
                              _sinkFunds.text.isNotEmpty) {
                            final budget = CreateBudgetModel(
                              widget.budgetIndex != null
                                  ? budgetController
                                      .budgetList[widget.budgetIndex!].id
                                  : '',
                              _budgetName.text,
                              dateText,
                              _income.text,
                              _amount.text,
                              _fixedName.text,
                              _fixedExp.text,
                              _varName.text,
                              _varExp.text,
                              _sinkName.text,
                              _sinkFunds.text,
                            );
                            widget.budgetIndex!= null
                                ? await budgetController
                                    .updateBudget(budget)
                                    .then((value) {
                                    Navigator.of(context).pop();
                                  })
                                : await budgetController
                                    .createBudget(budget)
                                    .then((value) {
                                    Navigator.of(context).pop();
                                  });
                          } else {
                            Utils.showSnackBar('Input Fields is required!');
                          }
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
}
