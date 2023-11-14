import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/view/blank_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_appbar.dart';
import 'package:finance_and_budget/view/manifestation/widgets/manifestation_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManifestationScreen extends StatefulWidget {
  const ManifestationScreen({super.key});

  @override
  State<ManifestationScreen> createState() => _ManifestationScreenState();
}

class _ManifestationScreenState extends State<ManifestationScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

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
            )
          ],
        ),
      ),
    );
  }
}
