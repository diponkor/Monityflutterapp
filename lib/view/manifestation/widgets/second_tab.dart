import 'package:finance_and_budget/view/manifestation/create_debts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../global_widgets/custom_text.dart';

Widget secondTab(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: 50.h),
      SizedBox(
        height: 282.h,
        width: 282.w,
        child: Image.asset('assets/images/debts.png'),
      ),
      SizedBox(height: 10.h),
      titleText('Add More Debts',
          size: 25, color: titleTextColor, authPage: true),
      subTitleText('Add your debts here',
          authPage: true,
          color: secondaryTextColor,
          fontWeight: FontWeight.w400),
      kIsWeb ? const SizedBox() : SizedBox(height: 140.h),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const CreateDebts()));
            },
            child: Container(
              height: 56.h,
              width: 60.w,
              decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50.r))),
              child: const Icon(Icons.add, color: blackTextColor),
            ),
          ),
        ),
      ),
    ],
  );
}
