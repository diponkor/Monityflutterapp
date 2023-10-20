
import 'package:finance_and_budget/view/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/colors.dart';

/*
  ------Here is some necessary information about this project------
  Firebase Account Information(Google Account).......
        Email:monityapp@gmail.com
        Password:monityapp123

   Plaid Account Information.......
        Email:monityapp@gmail.com
        Password:Monity12345678
*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check the current platform
  if (kIsWeb) {
    // Web configuration
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBmPZKCqoup_p1AiRo5xlv8KmKomt7rLXw",
      appId: "1:467595902392:web:113fbb3c517f6d4f7de34d",
      messagingSenderId: "467595902392",
      projectId: "monity-app-9dcb7",
    ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: screenWidth > 730 ? const Size(1424, 768) : const Size(430, 844),
        builder: (context, child) {
          if (screenWidth > 730 && kIsWeb) {
            return Center(
              child: SizedBox(
                height: 768.h,
                //width: 530.w,
                child: GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: _buildTheme(Brightness.light),
                  home:
                  const Scaffold(
                    //body: SplashScreen(),
                    body: SplashScreen(),
                  ),
                ),
              ),
            );
          } else if (screenWidth > 430) {
            return Center(
              child: SizedBox(
                height: 768.h,
                width: 430.w,
                child: GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: _buildTheme(Brightness.light),
                  home: const Scaffold(
                    body: SplashScreen(),
                    //body: CustomNavigation(),
                  ),
                ),
              ),
            );
          }
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: _buildTheme(Brightness.light),
              home: const Scaffold(
                body: SplashScreen(),
              ));
        });
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(
    brightness: brightness,
    primarySwatch: primarySwatch,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.ralewayTextTheme(),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
  );
}


//-------- For Update hosting firebase by command ****************

//flutter build web --no-tree-shake-icons
//npm install -g firebase-tools
//PowerShell -ExecutionPolicy Bypass -File "C:\Users\Admin\AppData\Roaming\npm\firebase.ps1" login
//PowerShell -ExecutionPolicy Bypass -File "C:\Users\Admin\AppData\Roaming\npm\firebase.ps1" deploy --only hosting