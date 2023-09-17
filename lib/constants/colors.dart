import 'package:flutter/material.dart';

const primaryColor = Color(0xff0387D0);
const secondaryColor = Color(0xff2743FD);
const profileBgColor = Color(0xffE6F3FA);

const primaryTextColor = Color(0xff3A3A3A);
const secondaryTextColor = Color(0xff737373);
const blackTextColor = Color(0xff020202);
const blackTextColor2 = Color(0xff081224);
const titleTextColor = Color(0xff0C4C68);
const secondaryDarkTextColor = Color(0xff555555);

const borderColor = Color(0xffE9E9E9);

const red = Color(0xffFF2B18);
const black = Color(0xff020202);
const white = Color(0xffFFFFFF);
const bgWhite = Color(0xffF5F5F5);
const green = Color(0xff04AB04);
const extraColor = Color(0xffFB6464);

final Map<int, Color> _yellow700Map = {
  50: primaryColor.withOpacity(0.1),
  100: primaryColor.withOpacity(0.2),
  200: primaryColor.withOpacity(0.3),
  300: primaryColor.withOpacity(0.4),
  400: primaryColor.withOpacity(0.5),
  500: primaryColor.withOpacity(0.6),
  600: primaryColor.withOpacity(0.7),
  700: primaryColor.withOpacity(0.8),
  800: primaryColor.withOpacity(0.9),
  900: primaryColor.withOpacity(0.10),
};

final MaterialColor primarySwatch =
    MaterialColor(primaryColor.value, _yellow700Map);
