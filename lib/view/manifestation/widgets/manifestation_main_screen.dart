import 'package:finance_and_budget/controller/manifestation_controller.dart';
import 'package:finance_and_budget/view/manifestation/create_manifestation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../global_widgets/custom_card.dart';
import '../../global_widgets/custom_text.dart';
import '../item_details.dart';

class ManifestationMainScreen extends StatelessWidget {
  const ManifestationMainScreen({super.key});

  static ManifestationController manifestationController =
      Get.put(ManifestationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 80.h),
        child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => const CreateManifestation()));
            },
            backgroundColor: white,
            child: const Icon(Icons.add, color: blackTextColor)),
      ),
      body: GetBuilder<ManifestationController>(
          id: 'updateManifestationList',
          builder: (controller) {
            return Center(
              child: controller.manifestationList.isEmpty
                  ? Column(
                      children: [
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: titleText('Manifestations and Goals',
                              size: 25, color: titleTextColor, authPage: true),
                        ),
                        SizedBox(height: 10.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: subTitleText(
                              'Having  multiple Budget to aspire to is a great way to \nlearn how to money manage!',
                              authPage: true,
                              color: secondaryTextColor,
                              size: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 30.h),
                        SizedBox(
                          height: 282.h,
                          width: 282.w,
                          child: Image.asset('assets/images/goals.png'),
                        ),
                        SizedBox(height: 10.h),
                        titleText('Add More Goals',
                            size: 25, color: titleTextColor, authPage: true),
                      ],
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          for (int j = 0;
                              j <
                                  manifestationController
                                      .manifestationList.length;
                              j++)
                            Container(
                              margin: EdgeInsets.only(top: 10.h),
                              child: customCard(
                                  250,
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          /*Container(
                                            height: 79.h,
                                            width: 79.w,
                                            decoration: BoxDecoration(
                                                color: primaryColor
                                                    .withOpacity(0.1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(14.r))),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0),
                                                child: Image.asset(
                                                    'assets/images/home2.png',
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),*/
                                          SizedBox(width: 10.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              titleText(
                                                  manifestationController
                                                      .manifestationList[j]
                                                      .goalName,
                                                  size: 20,
                                                  fontWeight: FontWeight.w600),
                                              SizedBox(height: 5.h),
                                              subTitleText(
                                                  'You have saved amount of your goal\nGreat Work!',
                                                  size: 16)
                                            ],
                                          ),
                                        ],
                                      ),
                                      SliderTheme(
                                          data:
                                              SliderTheme.of(context).copyWith(
                                            showValueIndicator:
                                                ShowValueIndicator.always,
                                            inactiveTrackColor:
                                                secondaryTextColor
                                                    .withOpacity(0.2),
                                          ),
                                          child: Slider(
                                            onChanged: (value) {},
                                            value: 0,
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          subTitleText('\$ 250',
                                              size: 16,
                                              fontWeight: FontWeight.w500),
                                          subTitleText('\$ 1500',
                                              size: 16,
                                              fontWeight: FontWeight.w500),
                                          subTitleText('\$ 2500',
                                              size: 16,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      ItemDetails(index: j)));
                                        },
                                        child: Row(
                                          children: [
                                            subTitleText('View Goals',
                                                size: 16,
                                                color: blackTextColor),
                                            SizedBox(width: 10.w),
                                            const Icon(
                                              Icons.arrow_forward,
                                              size: 16,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}
