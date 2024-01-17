import 'package:finance_and_budget/controller/manifestation_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_card.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/normal_button.dart';

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
                body: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.h),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.r))),
                              child: const Icon(Icons.arrow_back),
                            ),
                            SizedBox(width: 10.w),
                            titleText(
                                manifestationController
                                    .manifestationList[widget.index].goalName,
                                color: titleTextColor,
                                size: 25,
                                authPage: true),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      customCard(
                          250,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h),
                              subTitleText('Milestones',
                                  size: 20, color: blackTextColor),
                              SizedBox(height: 15.h),
                              Row(
                                children: [
                                  SizedBox(width: 20.w),
                                  SizedBox(
                                    height: 130.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        for (int x = 0;
                                            x <
                                                manifestationController
                                                    .manifestationList[
                                                        widget.index]
                                                    .mileStones
                                                    .length;
                                            x++)
                                          subTitleText("${x + 1} .",
                                              size: 16,
                                              fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  SizedBox(
                                    height: 130.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        for (var mile in manifestationController
                                            .manifestationList[widget.index]
                                            .mileStones)
                                          subTitleText(mile['text'],
                                              size: 16,
                                              fontWeight: FontWeight.w500),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 15.h),
                            ],
                          ))
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.r))),
                          child: const Icon(Icons.arrow_back),
                        ),
                        SizedBox(width: 10.w),
                        titleText(
                            manifestationController
                                .manifestationList[widget.index].goalName,
                            color: titleTextColor,
                            size: 25,
                            authPage: true),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  customCard(
                      250,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.h),
                          subTitleText('Milestones',
                              size: 20, color: blackTextColor),
                          SizedBox(height: 15.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 20.w),
                              /*SizedBox(
                          height: 130.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for(int x=0; x<manifestationController
                                  .manifestationList[widget.index].mileStones.length;x++ )
                                subTitleText("${x+1} .",
                                    size: 16,
                                    fontWeight: FontWeight.w500),
                            ],
                          ),
                        ),*/
                              SizedBox(width: 20.w),
                              SizedBox(
                                height: 130.h,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    for (var mile =0 ;mile< manifestationController
                                        .manifestationList[widget.index]
                                        .mileStones.length;mile++)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GetBuilder<ManifestationController>(
                                            id:'checkUpdate',
                                            builder: (context) {
                                              return SizedBox(
                                                width: 20.w,
                                                height: 20.w,
                                                child: Checkbox(
                                                  value: manifestationController
                                                      .checkboxValues[mile],
                                                  onChanged: (bool? value) {
                                                    manifestationController
                                                        .toggleCheckbox(mile);
                                                  },
                                                ),
                                              );
                                            }
                                          ),
                                          SizedBox(width: 20.w),
                                          subTitleText(manifestationController
                                              .manifestationList[widget.index]
                                              .mileStones[mile]['text'],
                                              size: 16,
                                              fontWeight: FontWeight.w500),
                                        ],
                                      ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15.h),
                        ],
                      )),
                  Container(
                     alignment: Alignment.centerRight,
                    padding:
                    const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 12.0),
                    child: SizedBox(
                        width: 100.w,
                        child:
                        normalButton('Save')),
                  ),
                ],
              ),
            ),
          );
  }
}
