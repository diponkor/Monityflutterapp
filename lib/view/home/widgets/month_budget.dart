import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../global_widgets/custom_card.dart';
import '../../global_widgets/custom_text.dart';

class MonthBudget extends StatefulWidget {
  const MonthBudget({super.key});

  @override
  State<MonthBudget> createState() => _MonthBudgetState();
}

class _MonthBudgetState extends State<MonthBudget> {
  double intValue = 0;

  @override
  Widget build(BuildContext context) {
    return customCard(
        473,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleText('February Budget', color: titleTextColor, size: 20),
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
            subTitleText('Top Spending categones', size: 18),
            SizedBox(
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor.withOpacity(0.1),
                    radius: 20,
                    child: Image.asset(
                      'assets/images/shopping.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      titleText('Shopping',
                          size: 18, fontWeight: FontWeight.w400),
                      SizedBox(height: 8.w),
                      subTitleText('15 Mar 2019, 8:20 PM',
                          size: 12, fontWeight: FontWeight.w300)
                    ],
                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  titleText('-\$120', size: 18, fontWeight: FontWeight.w400),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: secondaryTextColor,
                    size: 15,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: primaryColor.withOpacity(0.1),
                    child: Image.asset(
                      'assets/images/medicine.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      titleText('Medicine',
                          size: 18, fontWeight: FontWeight.w400),
                      SizedBox(height: 8.w),
                      subTitleText('13 Mar 2019, 12:10 AM',
                          size: 12, fontWeight: FontWeight.w300)
                    ],
                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  titleText('- \$89.50', size: 18, fontWeight: FontWeight.w400),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: secondaryTextColor,
                    size: 15,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 70.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor.withOpacity(0.1),
                    radius: 20,
                    child: Image.asset(
                      'assets/images/sport.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      titleText('Sport', size: 18, fontWeight: FontWeight.w400),
                      SizedBox(height: 8.w),
                      subTitleText('10 Mar 2019, 6:50 PM',
                          size: 12, fontWeight: FontWeight.w300)
                    ],
                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  titleText('- \$99.90', size: 18, fontWeight: FontWeight.w400),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: secondaryTextColor,
                    size: 15,
                  )
                ],
              ),
            ),
            Divider(
              color: secondaryTextColor.withOpacity(0.2),
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                SizedBox(
                  height: 88.h,
                  width: 94.w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14.r))),
                          child: Center(
                            child: SizedBox(
                              height: 22.h,
                              width: 20.w,
                              child: Image.asset('assets/images/bil.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        titleText('Upcoming Bill', size: 14)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 88.h,
                  width: 94.w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14.r))),
                          child: Center(
                            child: SizedBox(
                              height: 22.h,
                              width: 20.w,
                              child: Image.asset('assets/images/bil.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        titleText('Pending Days', size: 14)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 88.h,
                  width: 94.w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 5.h),
                        Container(
                          height: 60.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14.r))),
                          child: Center(
                            child: SizedBox(
                              height: 22.h,
                              width: 20.w,
                              child: Image.asset('assets/images/bil.png',
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        titleText('Pay Bill', size: 14)
                      ],
                    ),
                  ),
                ),
                const SizedBox(),
              ],
            )
          ],
        ));
  }
}
