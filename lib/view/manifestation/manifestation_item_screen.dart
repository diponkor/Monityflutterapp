import 'package:finance_and_budget/view/global_widgets/custom_card.dart';
import 'package:finance_and_budget/view/manifestation/item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';

class ManifestationItemScreen extends StatefulWidget {
  const ManifestationItemScreen({super.key});

  @override
  State<ManifestationItemScreen> createState() =>
      _ManifestationItemScreenState();
}

class _ManifestationItemScreenState extends State<ManifestationItemScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  double intValue = 0;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            DefaultTabController(
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
                        child: TabBarView(
                          children: [first(), first()],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  first() {
    return Column(
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
        SizedBox(height: 40.h),
      ],
    );
  }
}
