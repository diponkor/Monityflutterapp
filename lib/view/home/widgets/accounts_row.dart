import 'package:finance_and_budget/constants/colors.dart';
import 'package:flutter/cupertino.dart';

import '../../global_widgets/custom_text.dart';

Widget accountsRow(String keytext, String valuetext){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      subTitleText(keytext, size: 14, color: secondaryTextColor,fontWeight: FontWeight.w400),
      subTitleText(valuetext,size: 14,color: blackTextColor),
    ],
  );
}