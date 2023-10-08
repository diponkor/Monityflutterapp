import 'package:finance_and_budget/controller/manifestation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_card.dart';
import '../global_widgets/custom_text.dart';

class ItemDetails extends StatefulWidget {
  final int index;
  const ItemDetails({super.key, required this.index});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  double intValue = 0;
  ManifestationController manifestationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.h),
        child: Column(
          children: [
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
                        borderRadius: BorderRadius.all(Radius.circular(50.r))),
                    child: const Icon(Icons.arrow_back),
                  ),
                  SizedBox(width: 10.w),
                  titleText(manifestationController.manifestationList[widget.index].goalName,
                      color: titleTextColor, size: 25, authPage: true),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            customCard(
                490,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 79.h,
                          width: 79.w,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14.r))),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Image.asset('assets/images/home2.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            titleText(manifestationController.manifestationList[widget.index].goalName,
                                size: 20, fontWeight: FontWeight.w600),
                            SizedBox(height: 5.h),
                            subTitleText(
                                'You have saved amount of your goal\nGreat Work!',
                                size: 16)
                          ],
                        ),
                      ],
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          showValueIndicator: ShowValueIndicator.always,
                          inactiveTrackColor:
                              secondaryTextColor.withOpacity(0.2),
                        ),
                        child: Slider(
                          onChanged: (value) {
                            setState(() {
                              intValue = value;
                            });
                          },
                          value: intValue,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subTitleText('\$ 250',
                            size: 16, fontWeight: FontWeight.w500),
                        subTitleText('\$ 1500',
                            size: 16, fontWeight: FontWeight.w500),
                        subTitleText('\$ 2500',
                            size: 16, fontWeight: FontWeight.w500),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    subTitleText('Milestones', size: 20, color: blackTextColor),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        SizedBox(
                            height: 142.h,
                            child: Image.asset(
                                'assets/images/vertical_indicator.png')),
                        SizedBox(width: 20.w),
                        SizedBox(
                          height: 130.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              subTitleText('Save \$ 10',
                                  size: 15, fontWeight: FontWeight.w500),
                              subTitleText('Save \$ 100',
                                  size: 15, fontWeight: FontWeight.w500),
                              subTitleText('Save \$ 1500',
                                  size: 15, fontWeight: FontWeight.w500),
                              subTitleText('New Income',
                                  size: 15, fontWeight: FontWeight.w500),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Container(
                        height: 40.h,
                        width: 135.w,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: subTitleText('View Goals', color: white),
                        )),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
