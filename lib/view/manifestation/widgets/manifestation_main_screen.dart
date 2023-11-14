import 'package:finance_and_budget/controller/manifestation_controller.dart';
import 'package:finance_and_budget/view/manifestation/create_manifestation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../utils/utils.dart';
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
              Get.to(const CreateManifestation());
            },
            backgroundColor: white,
            child: const Icon(Icons.add, color: blackTextColor)),
      ),
      body: GetBuilder<ManifestationController>(
          id: 'updateManifestationList',
          builder: (controller) {
            return Center(
              child: controller.manifestationList.isEmpty
                  ? Container()
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
                                  150,
                                  Column(
                                    children: [
                                      Row(
                                        children: [
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
                                                  'Your goal is to save : \$${manifestationController
                                                      .manifestationList[j].amount}',
                                                  size: 16)
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ItemDetails(index: j)));
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(8.h),
                                              child: Row(
                                                children: [
                                                  subTitleText('View Milestones',
                                                      size: 18,
                                                      color: blackTextColor),
                                                  SizedBox(width: 10.w),
                                                  const Icon(
                                                    Icons.arrow_forward,
                                                    size: 16,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          const Expanded(child: SizedBox()),
                                          GestureDetector(
                                            onTap: (){
                                              Get.to(CreateManifestation(manifestIndex: j));
                                            },
                                            child: const Icon(
                                              Icons.edit,color: primaryColor,
                                            ),
                                          ),
                                          SizedBox(width: 15.w),
                                          GestureDetector(
                                            onTap: (){
                                              Utils.showWarningDialog('Are you sure to delete this?',
                                                  onAccept: (){
                                                    manifestationController.deleteManifes(j);
                                                    Get.back();
                                                  }
                                              );

                                            },
                                            child: const Icon(
                                              Icons.delete_outline,color: red,
                                            ),
                                          ),
                                          SizedBox(width: 20.w),

                                        ],
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
