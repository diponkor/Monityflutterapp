import 'package:finance_and_budget/view/chatgpt/chat_gpt_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import 'analytics/analytics_screen.dart';
import 'blank_screen.dart';
import 'budget/budget_screen.dart';
import 'chat/chat_screen.dart';
import 'home/home_screen.dart';
import 'manifestation/manifestation_screen.dart';

class WebNavigation extends StatefulWidget {
  const WebNavigation({super.key});

  @override
  State<WebNavigation> createState() => _WebNavigationState();
}

class _WebNavigationState extends State<WebNavigation> {
  int index = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const ManifestationScreen(),
    const BudgetScreen(),
    const BlankScreen(), //please add here the required page
    const ChatGptScreen(),  //please add here the required page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
                  width: 200,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            index=0;
                          });
                        },
                        child: ListTile(
                          leading: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset('assets/images/nav_home.png',
                                fit: BoxFit.contain),
                          ),
                          title: Text('Home',
                              style: TextStyle(
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: (){
                          setState(() {
                            index=1;
                          });
                        },
                        child: ListTile(
                          leading: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset('assets/images/nav_manifes.png',
                                fit: BoxFit.contain),
                          ),
                          title: Text('Manifestation',
                              style: TextStyle(
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: (){
                          setState(() {
                            index=2;
                          });
                        },
                        child: ListTile(
                          leading: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset('assets/images/nav_budget.png',
                                fit: BoxFit.contain),
                          ),
                          title: Text('Budget',
                              style: TextStyle(
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: (){
                          setState(() {
                            index=3;
                          });
                        },
                        child: ListTile(
                          leading: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset('assets/images/nav_analytics.png',
                                fit: BoxFit.contain),
                          ),
                          title: Text('Analytics',
                              style: TextStyle(
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: (){
                          setState(() {
                            index=4;
                          });
                        },
                        child: ListTile(
                          leading: SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Image.asset('assets/images/nav_life.png',
                                fit: BoxFit.contain),
                          ),
                          title: Text('Life Admin',
                              style: TextStyle(
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  )),
              SizedBox(width: 600.w, child: pages[index]),
              SizedBox(),
              SizedBox(),
            ],
          )),
    );
  }
}
