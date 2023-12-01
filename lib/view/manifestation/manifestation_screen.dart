import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/view/blank_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_appbar.dart';
import 'package:finance_and_budget/view/manifestation/widgets/manifestation_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/manifestation_controller.dart';
import '../../utils/utils.dart';
import '../global_widgets/custom_card.dart';
import '../global_widgets/custom_text.dart';
import 'create_manifestation.dart';
import 'item_details.dart';

class ManifestationScreen extends StatefulWidget {
  const ManifestationScreen({super.key});

  @override
  State<ManifestationScreen> createState() => _ManifestationScreenState();
}

class _ManifestationScreenState extends State<ManifestationScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  ManifestationController manifestationController =
  Get.put(ManifestationController());

  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 80.h),
        child: FloatingActionButton(
            onPressed: () {
              Get.to(const CreateManifestation());
            },
            backgroundColor: white,
            child: const Icon(Icons.add, color: blackTextColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: titleText('Goal',
                    size: 25, color: titleTextColor, authPage: true),
              ),
            ),
            GetBuilder<ManifestationController>(
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
                })
            /*DefaultTabController(
              length: 2,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: [
                            Container(
                                height: 39.h,
                                width: 360.w,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r))),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  child: const TabBar(
                                    indicator: BoxDecoration(
                                      color: primaryColor,
                                    ),
                                    unselectedLabelColor: blackTextColor,
                                    tabs: [
                                      Text('Goals'),
                                      Text('Debts'),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 600.h,
                        child:const TabBarView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            ManifestationMainScreen(),
                             BlankScreen()
                          ],
                        ),
                      )
                    ],
                  )),
            )*/
          ],
        ),
      ),
    );
  }
}
