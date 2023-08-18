import 'package:finance_and_budget/view/global_widgets/normal_button.dart';
import 'package:finance_and_budget/view/manifestation/manifestation_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';

class MilestoneScreen extends StatelessWidget {
  const MilestoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h), child: const CustomAppbar(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
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
                      titleText('Milestones',
                          color: titleTextColor, size: 25, authPage: true),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                subTitleText('Create your own milestone',
                    size: 14, fontWeight: FontWeight.w400),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subTitleText('Create your own milestone'),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: SizedBox(
                          height: 18.h,
                          width: 18.w,
                          child: Image.asset('assets/images/edit.png')),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                milestoneTextField(),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 28.h,
                    width: 178.w,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(5.r))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        SizedBox(
                          height: 11.h,
                          width: 11.w,
                          child: Image.asset('assets/images/repeatIcon.png'),
                        ),
                        subTitleText('Regenerate Response',color: blackTextColor,size: 14),
                        const SizedBox(),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                normalButton('Submit',onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ManifestationItemScreen()));
                })
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget milestoneTextField() {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
          maxLines: 3,
          keyboardType: TextInputType.text,
          controller: TextEditingController(),
          style: TextStyle(fontSize: 18.h, color: blackTextColor),
          decoration: InputDecoration(
            fillColor: white,
            hintText: 'Month 1:- You can save \$200\n'
                'Month 2:- You can save \$400\n'
                'Month 3:- You can save \$500',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: const BorderSide(
                  width: 1,
                  color: blackTextColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: const BorderSide(
                  width: 1,
                  color: blackTextColor,
                )),
            hintStyle: TextStyle(fontSize: 18.sp, color: secondaryTextColor),
          )),
    );
  }
}
