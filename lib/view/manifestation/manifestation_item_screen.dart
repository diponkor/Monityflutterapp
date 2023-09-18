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
        customCard(
            250,
            Column(
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
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Image.asset('assets/images/home2.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleText('Home Deposit',
                            size: 20, fontWeight: FontWeight.w600),
                        SizedBox(height: 5.h),
                        subTitleText(
                            'You have saved 10.00% of your goal\nGreat Work!',
                            size: 16)
                      ],
                    ),
                  ],
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      showValueIndicator: ShowValueIndicator.always,
                      inactiveTrackColor: secondaryTextColor.withOpacity(0.2),
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ItemDetails()));
                  },
                  child: Row(
                    children: [
                      subTitleText('View Goals',
                          size: 16, color: blackTextColor),
                      SizedBox(width: 10.w),
                      const Icon(
                        Icons.arrow_forward,
                        size: 16,
                      )
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}
