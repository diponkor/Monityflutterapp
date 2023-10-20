import 'package:finance_and_budget/controller/auth_controller.dart';
import 'package:finance_and_budget/model/user_model.dart';
import 'package:finance_and_budget/view/authentication/signin_screen.dart';
import 'package:finance_and_budget/view/authentication/widgets/background_screen.dart';
import 'package:finance_and_budget/view/global_widgets/custom_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/font_constants.dart';
import '../../utils/utils.dart';
import '../custom_navigation_bar.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/normal_button.dart';
import 'package:get/get.dart';

import '../web_navigation.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {

  late TabController controller;

  AuthController authController = Get.find();

  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController conPass = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController userRole = TextEditingController();

  List<String> dropdownItems = ['CEO', 'COO', 'CFO', 'CTO'];
  String? selectedValue;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    fName.dispose();
    lName.dispose();
    email.dispose();
    pass.dispose();
    conPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb?Center(
      child: SizedBox(
        width: 600.w,
        child: BackgroundScreen(
          widget: Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 5.h),
            child: Column(
              children: [
                TabBar(
                  controller: controller,
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor.withOpacity(0.1),
                            radius: 10,
                            child: subTitleText('1',
                                authPage: true, color: primaryColor),
                          ),
                          SizedBox(width: 2.w),
                          subTitleText('Pesonal Info',
                              authPage: true,
                              fontWeight: FontWeight.w700,
                              color: blackTextColor2),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor.withOpacity(0.1),
                            radius: 10,
                            child: subTitleText('2',
                                authPage: true, color: primaryColor),
                          ),
                          SizedBox(width: 2.w),
                          subTitleText('Customer Info',
                              authPage: true,
                              fontWeight: FontWeight.w700,
                              color: blackTextColor2),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller,
                    children: [
                      firstPageSignUp(),
                      secondPageSignUp(screenWidth),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ): BackgroundScreen(
      widget: Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 5.h),
        child: Column(
          children: [
            TabBar(
              controller: controller,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: primaryColor.withOpacity(0.1),
                        radius: 10,
                        child: subTitleText('1',
                            authPage: true, color: primaryColor),
                      ),
                      SizedBox(width: 2.w),
                      subTitleText('Pesonal Info',
                          authPage: true,
                          fontWeight: FontWeight.w700,
                          color: blackTextColor2),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: primaryColor.withOpacity(0.1),
                        radius: 10,
                        child: subTitleText('2',
                            authPage: true, color: primaryColor),
                      ),
                      SizedBox(width: 2.w),
                      subTitleText('Customer Info',
                          authPage: true,
                          fontWeight: FontWeight.w700,
                          color: blackTextColor2),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  firstPageSignUp(),
                  secondPageSignUp(screenWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget firstPageSignUp() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        subTitleText('First Name', authPage: true),
        customTextField(fName),
        SizedBox(height: 10.h),
        subTitleText('Last Name', authPage: true),
        customTextField(lName),
        SizedBox(height: 10.h),
        subTitleText('Email', authPage: true),
        customTextField(email),
        SizedBox(height: 10.h),
        subTitleText('Password', authPage: true),
        customTextField(pass),
        SizedBox(height: 10.h),
        subTitleText('Confirm Password', authPage: true),
        customTextField(conPass),
        SizedBox(height: 20.h),
        normalButton('Next', onPressed: () {
          setState(() {
            controller.index = 1;
          });
        }),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget secondPageSignUp(var screenWidth) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        subTitleText('Company Name', authPage: true),
        customTextField(companyName),
        SizedBox(height: 20.h),
        subTitleText('User Role', authPage: true),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(selectedValue ?? ''),
            Expanded(child: dropDown()),
            const Icon(Icons.keyboard_arrow_down_outlined),
          ],
        ),
        const Divider(thickness: 1, color: black),
        SizedBox(height: 120.h),
        normalButton('Sign Up', onPressed: () {
          if (fName.text.isNotEmpty &&
              lName.text.isNotEmpty &&
              email.text.isNotEmpty &&
              pass.text.isNotEmpty &&
              conPass.text.isNotEmpty &&
              companyName.text.isNotEmpty &&
              selectedValue.toString().isNotEmpty) {
            authController.signUp(email.text, pass.text).then((value) async {
              final user = UserModel(
                firstName: fName.text.trim(),
                lastName: lName.text.trim(),
                email: email.text.trim(),
                password: pass.text.trim(),
                confirmPassword: conPass.text.trim(),
                companyName: companyName.text.trim(),
                userRole: selectedValue.toString(),
              );
              await authController.createUser(user).then((value) {
                Get.offAll( screenWidth > 730 && kIsWeb?const WebNavigation(): const CustomNavigation());
              });
              Utils.showSnackBar('Account has been created');
            });
          } else {
            print(selectedValue);
            Utils.showSnackBar('Input Fields is required!');
          }
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (_) => const FreeTrialScreen()));
        }),
        SizedBox(height: 80.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            subTitleText('Already have any account? ',
                authPage: true, color: blackTextColor2),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SigninScreen()));
                },
                child: subTitleText('Sign In',
                    authPage: true, color: secondaryColor)),
          ],
        ),
      ],
    );
  }

  Widget dropDown() {
    return DropdownButton<String>(
      iconEnabledColor: white,
      value: selectedValue,
      items: dropdownItems.map((dynamic val) {
        return DropdownMenuItem<String>(
          value: val,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(val,
                style: TextStyle(color: white, fontSize: fontVerySmall)),
          ),
        );
      }).toList(),
      borderRadius: BorderRadius.circular(10),
      underline: const SizedBox(),
      disabledHint: const Text('Disable'),
      isExpanded: true,
      dropdownColor: primaryColor,
      hint: const Text('Choose Donation Type', style: TextStyle(color: white)),
      style: TextStyle(color: primaryColor, fontSize: fontVerySmall),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }
}
