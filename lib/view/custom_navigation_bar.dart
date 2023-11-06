import 'package:finance_and_budget/constants/colors.dart';
import 'package:finance_and_budget/view/analytics/analytics_screen.dart';
import 'package:finance_and_budget/view/budget/budget_screen.dart';
import 'package:finance_and_budget/view/home/home_screen.dart';
import 'package:finance_and_budget/view/manifestation/manifestation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat/chat_screen.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  int _bottomNavIndex = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const ManifestationScreen(),
    const BudgetScreen(),
    const AnalyticsScreen(), //please add here the required page
    const ChatScreen(), //please add here the required page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: pages[_bottomNavIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _bottomNavIndex,
          elevation: 10,
          selectedLabelStyle:
              const TextStyle(color: primaryColor, fontSize: 12),
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 20.h,
                width: 20.w,
                child: Image.asset('assets/images/nav_home.png',
                    fit: BoxFit.contain),
              ),
              activeIcon: SizedBox(
                  height: 20.h,
                  width: 21.w,
                  child: Image.asset('assets/images/nav_home.png',
                      fit: BoxFit.contain, color: primaryColor)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 20.h,
                width: 20.w,
                child: Image.asset('assets/images/nav_manifes.png',
                    fit: BoxFit.contain),
              ),
              activeIcon: SizedBox(
                  height: 20.h,
                  width: 21.w,
                  child: Image.asset('assets/images/nav_manifes.png',
                      fit: BoxFit.contain, color: primaryColor)),
              label: 'Manifestation',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 20.h,
                width: 20.w,
                child: Image.asset('assets/images/nav_budget.png',
                    fit: BoxFit.contain),
              ),
              activeIcon: SizedBox(
                  height: 20.h,
                  width: 21.w,
                  child: Image.asset('assets/images/nav_budget.png',
                      fit: BoxFit.contain, color: primaryColor)),
              label: 'Budget',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 20.h,
                width: 20.w,
                child: Image.asset('assets/images/nav_analytics.png',
                    fit: BoxFit.contain),
              ),
              activeIcon: SizedBox(
                  height: 20.h,
                  width: 21.w,
                  child: Image.asset('assets/images/nav_analytics.png',
                      fit: BoxFit.contain, color: primaryColor)),
              label: 'Analytics',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 20.h,
                width: 20.w,
                child: Image.asset('assets/images/nav_life.png',
                    fit: BoxFit.contain),
              ),
              activeIcon: SizedBox(
                  height: 20.h,
                  width: 21.w,
                  child: Image.asset('assets/images/nav_life.png',
                      fit: BoxFit.contain, color: primaryColor)),
              label: 'Life Admin',
            ),
          ],
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          },
        ));
  }
}
