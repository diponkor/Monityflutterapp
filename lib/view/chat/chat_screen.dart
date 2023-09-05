import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import '../global_widgets/custom_text.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 648.h,
                child: ListView(
                  physics: BouncingScrollPhysics(),
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
                          titleText('New chat',
                              color: titleTextColor, size: 25, authPage: true),
                        ],
                      ),
                    ),
                    SizedBox(height: 100.h),
                    SizedBox(
                      height: 314.h,
                      child: Image.asset('assets/images/chat.png'),
                    ),

                  ],
                ),
              ),
              Container(
                height: 48.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(36.r),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 340.w,
                      child: TextFormField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                            hintText: 'Send a message',
                            hintStyle: TextStyle(
                                color: secondaryTextColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 20.w)),
                      ),
                    ),
                    const Icon(Icons.send,color: secondaryTextColor)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
