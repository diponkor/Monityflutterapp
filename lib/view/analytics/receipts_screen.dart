import 'package:finance_and_budget/view/analytics/manually_transaction_screen.dart';
import 'package:finance_and_budget/view/analytics/qr_screen.dart';
import 'package:finance_and_budget/view/splash/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';

class ReceiptsScreen extends StatelessWidget {
  const ReceiptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb?Center(
      child: SizedBox(
        width: 600.w,
        child: Scaffold(
          backgroundColor: bgWhite,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(107.h),
            child: const CustomAppbar(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  titleText('Receipts',
                      size: 25, color: titleTextColor, authPage: true),
                  SizedBox(height: 20.h),
                  subTitleText(
                      'Let\'s say the user\'s total monthly income is \nreceipts',
                      size: 18),
                  SizedBox(height: 20.h),
                  subTitleText('Receipts', size: 18),
                  SizedBox(height: 20.h),
                  Container(
                      height: 210.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Center(
                        child: subTitleText(
                            'Click to browse or \ndrag and drop your files',
                            size: 14,
                            fontWeight: FontWeight.w400),
                      )),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 170.w,
                        child: Divider(
                          color: secondaryTextColor.withOpacity(0.2),
                          thickness: 0.8,
                        ),
                      ),
                      subTitleText('OR', size: 18),
                      SizedBox(
                        width: 170.w,
                        child: Divider(
                          color: secondaryTextColor.withOpacity(0.2),
                          thickness: 0.8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(const QRScreen());
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 88.h,
                        width: 88.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: primaryColor),
                        child: Center(
                          child: SizedBox(
                              height: 50.h,
                              width: 50.h,
                              child: Image.asset('assets/images/qr.png',
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Align(
                      alignment: Alignment.center,
                      child: subTitleText('Scan QR Code',
                          size: 20, color: black, fontWeight: FontWeight.w400)),
                  SizedBox(height: 20.h),
                  customButton(text: 'Save'),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: (){
                      Get.to(const ManuallyTransactionScreen());
                    },
                    child: Center(
                        child: subTitleText('Add  Transaction Manually',
                            size: 20, color: primaryColor)),
                  ),
                  Center(
                    child: SizedBox(
                      width: 250.w,
                      child: const Divider(
                        thickness: 1,
                        color: primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ): Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              titleText('Receipts',
                  size: 25, color: titleTextColor, authPage: true),
              SizedBox(height: 20.h),
              subTitleText(
                  'Let\'s say the user\'s total monthly income is \nreceipts',
                  size: 18),
              SizedBox(height: 20.h),
              subTitleText('Receipts', size: 18),
              SizedBox(height: 20.h),
              Container(
                  height: 210.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 1),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: subTitleText(
                        'Click to browse or \ndrag and drop your files',
                        size: 14,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170.w,
                    child: Divider(
                      color: secondaryTextColor.withOpacity(0.2),
                      thickness: 0.8,
                    ),
                  ),
                  subTitleText('OR', size: 18),
                  SizedBox(
                    width: 170.w,
                    child: Divider(
                      color: secondaryTextColor.withOpacity(0.2),
                      thickness: 0.8,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Get.to(const QRScreen());
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 88.h,
                    width: 88.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: primaryColor),
                    child: Center(
                      child: SizedBox(
                          height: 50.h,
                          width: 50.h,
                          child: Image.asset('assets/images/qr.png',
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                  alignment: Alignment.center,
                  child: subTitleText('Scan QR Code',
                      size: 20, color: black, fontWeight: FontWeight.w400)),
              SizedBox(height: 20.h),
              customButton(text: 'Save'),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: (){
                  Get.to(const ManuallyTransactionScreen());
                },
                child: Center(
                    child: subTitleText('Add  Transaction Manually',
                        size: 20, color: primaryColor)),
              ),
              Center(
                child: SizedBox(
                  width: 250.w,
                  child: const Divider(
                    thickness: 1,
                    color: primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
