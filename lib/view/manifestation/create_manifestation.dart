import 'package:finance_and_budget/controller/manifestation_controller.dart';
import 'package:finance_and_budget/model/manifestation_model.dart';
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
  final int? manifestIndex;

  const CreateManifestation({super.key, this.manifestIndex});

  @override
  State<CreateManifestation> createState() => _CreateManifestationState();
}

class _CreateManifestationState extends State<CreateManifestation> {
  ManifestationController manifestationController =
      Get.put(ManifestationController());
  bool? isChecked = false;
  TextEditingController goalNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  var dateText = 'Date';

  @override
  void initState() {
    if (widget.manifestIndex != null) {
      manifestationController.milestoneControllers = [];
      goalNameController.text = manifestationController
          .manifestationList[widget.manifestIndex!].goalName;
      amountController.text = manifestationController
          .manifestationList[widget.manifestIndex!].amount;
      dateText = manifestationController
          .manifestationList[widget.manifestIndex!].byWhen;
      for (var mile in manifestationController
          .manifestationList[widget.manifestIndex!].mileStones) {
        manifestationController.milestoneControllers
            .add(TextEditingController(text: mile));
      }
    }
    // TODO: implement initState
    super.initState();
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50.r))),
                                    child: const Icon(Icons.arrow_back),
                                  ),
                                  SizedBox(width: 10.w),
                                  titleText('Manifestation & Goals',
                                      color: titleTextColor,
                                      size: 25,
                                      authPage: true),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            subTitleText('What are you aspiring for?',
                                color: titleTextColor, size: 20),
                            SizedBox(height: 10.h),
                            subTitleText('Name your goal',
                                color: secondaryTextColor.withOpacity(0.8)),
                            SizedBox(height: 5.h),
                            singleTextField(
                                controller: goalNameController,
                                hintText: 'Name your goal'),
                            SizedBox(height: 10.h),
                            subTitleText('Amount',
                                color: secondaryTextColor.withOpacity(0.8)),
                            SizedBox(height: 5.h),
                            singleTextField(
                                controller: amountController,
                                hintText: 'Amount',
                                textType: TextInputType.number),
                            SizedBox(height: 10.h),
                            subTitleText('By when',
                                color: secondaryTextColor.withOpacity(0.8)),
                            SizedBox(height: 5.h),
                            GestureDetector(
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
                              child: Container(
                                height: 50.h,
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(color: black, width: 1)),
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
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                subTitleText('Set Your Milestones',
                                    color: secondaryTextColor.withOpacity(0.8)),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        manifestationController.milestoneControllers
                                            .add(TextEditingController());
                                      });
                                    },
                                    child: titleText('Add',
                                        size: 20, color: titleTextColor)),
                                const SizedBox(),
                              ],
                            ),
                            for (var i = 0;
                            i <
                                manifestationController
                                    .milestoneControllers.length;
                            i++)
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                height: 50.h,
                                width: double.infinity,
                                child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    controller: manifestationController
                                        .milestoneControllers[i],
                                    style: TextStyle(
                                        fontSize: 18.h,
                                        color: blackTextColor,
                                        fontWeight: FontWeight.w600),
                                    decoration: InputDecoration(
                                      fillColor: white,
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            Utils.showWarningDialog('Are you sure to delete this?',
                                                onAccept: (){
                                                  setState(() {
                                                    manifestationController
                                                        .milestoneControllers
                                                        .removeAt(i);
                                                    Get.back();
                                                  });
                                                }
                                            );
                                          },
                                          child: const Icon(Icons.delete_outline,
                                              color: red)),
                                      hintText: 'Enter Milestone',
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
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: secondaryTextColor),
                                    )),
                              ),
                            SizedBox(height: 40.h),
                            normalButton('Next', onPressed: () async {
                              manifestationController.makeMileList();
                              if (goalNameController.text.isNotEmpty &&
                                  amountController.text.isNotEmpty &&
                                  dateText.isNotEmpty &&
                                  manifestationController.mileTextList.isNotEmpty) {
                                final manifestation = ManifestationModel(
                                    widget.manifestIndex != null
                                        ? manifestationController
                                        .manifestationList[
                                    widget.manifestIndex!]
                                        .id
                                        : '',
                                    goalNameController.text,
                                    amountController.text,
                                    dateText,
                                    manifestationController.mileTextList);

                                widget.manifestIndex != null
                                    ? await manifestationController
                                    .updateManifestation(manifestation)
                                    .then((value) {
                                  Get.back();
                                  manifestationController
                                      .milestoneControllers = [];
                                  manifestationController.mileTextList = [];
                                })
                                    : await manifestationController
                                    .createManifestation(manifestation)
                                    .then((value) {
                                  Get.back();
                                  manifestationController
                                      .milestoneControllers = [];
                                  manifestationController.mileTextList = [];
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50.r))),
                                child: const Icon(Icons.arrow_back),
                              ),
                              SizedBox(width: 10.w),
                              titleText('Manifestation & Goals',
                                  color: titleTextColor,
                                  size: 25,
                                  authPage: true),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        subTitleText('What are you aspiring for?',
                            color: titleTextColor, size: 20),
                        SizedBox(height: 10.h),
                        subTitleText('Name your goal',
                            color: secondaryTextColor.withOpacity(0.8)),
                        SizedBox(height: 5.h),
                        singleTextField(
                            controller: goalNameController,
                            hintText: 'Name your goal'),
                        SizedBox(height: 10.h),
                        subTitleText('Amount',
                            color: secondaryTextColor.withOpacity(0.8)),
                        SizedBox(height: 5.h),
                        singleTextField(
                            controller: amountController,
                            hintText: 'Amount',
                            textType: TextInputType.number),
                        SizedBox(height: 10.h),
                        subTitleText('By when',
                            color: secondaryTextColor.withOpacity(0.8)),
                        SizedBox(height: 5.h),
                        GestureDetector(
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
                          child: Container(
                            height: 50.h,
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(color: black, width: 1)),
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
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            subTitleText('Set Your Milestones',
                                color: secondaryTextColor.withOpacity(0.8)),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    manifestationController.milestoneControllers
                                        .add(TextEditingController());
                                  });
                                },
                                child: titleText('Add',
                                    size: 20, color: titleTextColor)),
                            const SizedBox(),
                          ],
                        ),
                        for (var i = 0;
                            i <
                                manifestationController
                                    .milestoneControllers.length;
                            i++)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            height: 50.h,
                            width: double.infinity,
                            child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: manifestationController
                                    .milestoneControllers[i],
                                style: TextStyle(
                                    fontSize: 18.h,
                                    color: blackTextColor,
                                    fontWeight: FontWeight.w600),
                                decoration: InputDecoration(
                                  fillColor: white,
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        Utils.showWarningDialog('Are you sure to delete this?',
                                            onAccept: (){
                                              setState(() {
                                                manifestationController
                                                    .milestoneControllers
                                                    .removeAt(i);
                                                Get.back();
                                              });
                                            }
                                        );
                                      },
                                      child: const Icon(Icons.delete_outline,
                                          color: red)),
                                  hintText: 'Enter Milestone',
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
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: secondaryTextColor),
                                )),
                          ),
                        SizedBox(height: 40.h),
                        normalButton('Next', onPressed: () async {
                          manifestationController.makeMileList();
                          if (goalNameController.text.isNotEmpty &&
                              amountController.text.isNotEmpty &&
                              dateText.isNotEmpty &&
                              manifestationController.mileTextList.isNotEmpty) {
                            final manifestation = ManifestationModel(
                                widget.manifestIndex != null
                                    ? manifestationController
                                        .manifestationList[
                                            widget.manifestIndex!]
                                        .id
                                    : '',
                                goalNameController.text,
                                amountController.text,
                                dateText,
                                manifestationController.mileTextList);

                            widget.manifestIndex != null
                                ? await manifestationController
                                    .updateManifestation(manifestation)
                                    .then((value) {
                                    Get.back();
                                    manifestationController
                                        .milestoneControllers = [];
                                    manifestationController.mileTextList = [];
                                  })
                                : await manifestationController
                                    .createManifestation(manifestation)
                                    .then((value) {
                                    Get.back();
                                    manifestationController
                                        .milestoneControllers = [];
                                    manifestationController.mileTextList = [];
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
