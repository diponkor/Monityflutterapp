import 'package:finance_and_budget/controller/manifestation_controller.dart';
import 'package:finance_and_budget/model/manifestation_model.dart';
import 'package:finance_and_budget/view/manifestation/milestone_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../utils/utils.dart';
import '../global_widgets/single_text_field.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/normal_button.dart';

class CreateManifestation extends StatefulWidget {
  const CreateManifestation({super.key});

  @override
  State<CreateManifestation> createState() => _CreateManifestationState();
}

class _CreateManifestationState extends State<CreateManifestation> {
  ManifestationController manifestationController =
      Get.put(ManifestationController());
  bool? isChecked = false;
  TextEditingController goalNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  var dateText = 'Ex. - 30 JUNE 2023';

  List<String> popularGoalsList = [
    'Home Loan',
    'Car Loan',
    'Mortgage',
    'Money'
  ];
  String selectedPopularGoal = '';

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb? Center(
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
                            titleText('Manifestation & Goals',
                                color: titleTextColor, size: 25, authPage: true),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      subTitleText('What are you aspiring for?',
                          color: titleTextColor, size: 20),
                      SizedBox(height: 20.h),
                      subTitleText('Name your goal',
                          color: secondaryTextColor.withOpacity(0.8)),
                      SizedBox(height: 5.h),
                      singleTextField(
                          controller: goalNameController,
                          hintText: 'Name your goal'),
                      SizedBox(height: 20.h),
                      subTitleText('Choose Popular goals'),
                      SizedBox(height: 5.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int x = 0; x < popularGoalsList.length; x++)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedPopularGoal = popularGoalsList[x];
                                  });
                                  print(selectedPopularGoal);
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 122.w,
                                  margin: EdgeInsets.only(right: 5.w),
                                  decoration: BoxDecoration(
                                      color:
                                      selectedPopularGoal == popularGoalsList[x]
                                          ? blackTextColor
                                          : bgWhite,
                                      border: Border.all(
                                          color: blackTextColor, width: 1),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(5.r))),
                                  child: Center(
                                    child: subTitleText(popularGoalsList[x],
                                        color: selectedPopularGoal ==
                                            popularGoalsList[x]
                                            ? white
                                            : secondaryTextColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      subTitleText('Amount',
                          color: secondaryTextColor.withOpacity(0.8)),
                      SizedBox(height: 5.h),
                      singleTextField(
                          controller: amountController,
                          hintText: 'Amount',
                          textType: TextInputType.number),
                      SizedBox(height: 20.h),
                      subTitleText('By when',
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
                      // singleTextField(
                      //     controller: TextEditingController(),
                      //     icon: true,
                      //     hintText: 'Ex. - 30 JUNE 2023'),
                      SizedBox(height: 20.h),
                      subTitleText('Bank',
                          color: secondaryTextColor.withOpacity(0.8)),
                      SizedBox(height: 5.h),
                      SizedBox(
                        height: 50.h,
                        width: double.infinity,
                        child: TextFormField(
                            onChanged: (text) async {},
                            onEditingComplete: () async {},
                            keyboardType: TextInputType.text,
                            controller: bankController,
                            style: TextStyle(fontSize: 18.h, color: blackTextColor),
                            decoration: InputDecoration(
                              fillColor: white,
                              suffixIcon: const Icon(Icons.keyboard_arrow_down,
                                  color: secondaryTextColor),
                              hintText: 'Selected Option',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: blackTextColor,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: blackTextColor,
                                  )),
                              hintStyle: TextStyle(
                                  fontSize: 18.sp, color: secondaryTextColor),
                            )),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          SizedBox(
                            height: 50.h,
                            width: 50.w,
                            child: Checkbox(
                              value: isChecked,
                              onChanged: (newBool) {
                                setState(() {
                                  isChecked = newBool;
                                });
                              },
                            ),
                          ),
                          subTitleText(
                            'Do you want to create a sinking fund for this \ngoal',
                            size: 16,
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      normalButton('Next', onPressed: () async {
                        if (goalNameController.text.isNotEmpty &&
                            selectedPopularGoal.isNotEmpty &&
                            amountController.text.isNotEmpty &&
                            dateText.isNotEmpty &&
                            bankController.text.isNotEmpty) {
                          final manifestation = ManifestationModel(
                            goalNameController.text,
                            selectedPopularGoal,
                            amountController.text,
                            dateText,
                            bankController.text,
                          );
                          await manifestationController
                              .createManifestation(manifestation)
                              .then((value) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const MilestoneScreen()));
                          });
                        } else{
                          Utils.showSnackBar('Input Fields is required!');
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ): Scaffold(
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
                        titleText('Manifestation & Goals',
                            color: titleTextColor, size: 25, authPage: true),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  subTitleText('What are you aspiring for?',
                      color: titleTextColor, size: 20),
                  SizedBox(height: 20.h),
                  subTitleText('Name your goal',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: goalNameController,
                      hintText: 'Name your goal'),
                  SizedBox(height: 20.h),
                  subTitleText('Choose Popular goals'),
                  SizedBox(height: 5.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int x = 0; x < popularGoalsList.length; x++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPopularGoal = popularGoalsList[x];
                              });
                              print(selectedPopularGoal);
                            },
                            child: Container(
                              height: 40.h,
                              width: 122.w,
                              margin: EdgeInsets.only(right: 5.w),
                              decoration: BoxDecoration(
                                  color:
                                      selectedPopularGoal == popularGoalsList[x]
                                          ? blackTextColor
                                          : bgWhite,
                                  border: Border.all(
                                      color: blackTextColor, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.r))),
                              child: Center(
                                child: subTitleText(popularGoalsList[x],
                                    color: selectedPopularGoal ==
                                            popularGoalsList[x]
                                        ? white
                                        : secondaryTextColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  subTitleText('Amount',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  singleTextField(
                      controller: amountController,
                      hintText: 'Amount',
                      textType: TextInputType.number),
                  SizedBox(height: 20.h),
                  subTitleText('By when',
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
                  // singleTextField(
                  //     controller: TextEditingController(),
                  //     icon: true,
                  //     hintText: 'Ex. - 30 JUNE 2023'),
                  SizedBox(height: 20.h),
                  subTitleText('Bank',
                      color: secondaryTextColor.withOpacity(0.8)),
                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: TextFormField(
                        onChanged: (text) async {},
                        onEditingComplete: () async {},
                        keyboardType: TextInputType.text,
                        controller: bankController,
                        style: TextStyle(fontSize: 18.h, color: blackTextColor),
                        decoration: InputDecoration(
                          fillColor: white,
                          suffixIcon: const Icon(Icons.keyboard_arrow_down,
                              color: secondaryTextColor),
                          hintText: 'Selected Option',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: blackTextColor,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: blackTextColor,
                              )),
                          hintStyle: TextStyle(
                              fontSize: 18.sp, color: secondaryTextColor),
                        )),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (newBool) {
                            setState(() {
                              isChecked = newBool;
                            });
                          },
                        ),
                      ),
                      subTitleText(
                        'Do you want to create a sinking fund for this \ngoal',
                        size: 16,
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  normalButton('Next', onPressed: () async {
                    if (goalNameController.text.isNotEmpty &&
                        selectedPopularGoal.isNotEmpty &&
                        amountController.text.isNotEmpty &&
                        dateText.isNotEmpty &&
                        bankController.text.isNotEmpty) {
                      final manifestation = ManifestationModel(
                        goalNameController.text,
                        selectedPopularGoal,
                        amountController.text,
                        dateText,
                        bankController.text,
                      );
                      await manifestationController
                          .createManifestation(manifestation)
                          .then((value) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const MilestoneScreen()));
                      });
                    } else{
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
