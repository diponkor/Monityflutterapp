import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:finance_and_budget/controller/budget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import 'messages.dart';

class MonityChatScreen extends StatefulWidget {
  const MonityChatScreen({super.key});

  @override
  State<MonityChatScreen> createState() => _MonityChatScreenState();
}

class _MonityChatScreenState extends State<MonityChatScreen> {
  List<Map<String, dynamic>> messages = [];

  final BudgetController _controller = Get.put(BudgetController());


  List<String> suggestons = [
    'What are my top three expenses for this year?',
    'How much did I make last week ?',
    'Where did I spend money last week?',
    'How much money did I spend last week? ',
    'What\'s the best credit card for me based on my spending habits and credit score?',
    'Are there any other types of financial accounts that you recommend for me to open?',
    'Explain what a high yield saving account is?',
    'Show me a summary of my monthly cash flow and highlight areas where I can save more?',
    'Advanced (Optional) Can be used instead of those above - if possible at this stage?',
    'Show me recommendations for reducing unnecessary fees in my financial accounts?',
    'Can you suggest strategies to pay off my high-interest debts more efficiently?',
    'Can you forecast my future financial situation based on my current savings and spending patterns?',
    'What are the key financial milestones I should aim for in the next five years?',
    'Show me a summary of my monthly cash flow and highlight areas where I can save more?',
    'Can you provide personalized tips on how I can reduce my monthly utility bills?',
    'Tell me about any upcoming bills or expenses that I might have forgotten to budget for?',
  ];

  String answer = 'No Answer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(107.h),
      //   child: const CustomAppbar(),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RawAutocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    } else {
                      List<String> matches = <String>[];
                      matches.addAll(suggestons);

                      matches.retainWhere((s) {
                        return s
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                      return matches;
                    }
                  },
                  onSelected: (String selection) {
                    //print('You just selected $selection');
                    buildAnswer(selection);
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      controller: textEditingController,
                      focusNode: focusNode,
                      onSubmitted: (String value) {},
                    );
                  },
                  optionsViewBuilder: (BuildContext context,
                      void Function(String) onSelected,
                      Iterable<String> options) {
                    return Material(
                        child: SizedBox(
                            height: 200,
                            child: SingleChildScrollView(
                                child: Column(
                              children: options.map((opt) {
                                return InkWell(
                                    onTap: () {
                                      onSelected(opt);
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.only(right: 60),
                                        child: Card(
                                            child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(10),
                                          child: Text(opt),
                                        ))));
                              }).toList(),
                            ))));
                  },
                ),
                SizedBox(
                    height: 640.h, child: MessagesScreen(messages: messages)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future buildAnswer(String question) async{
    if (question == suggestons[0]) {
      answer = _controller.top3ExpThisYear;
      print(_controller.top3ExpThisYear);
    } else if (question == suggestons[1]) {
      answer = _controller.makeLastWeek;
    } else if (question == suggestons[2]) {
      answer = 'Expense';
    } else if (question == suggestons[3]) {
      answer = _controller.spendLastMonth;
    } else if (question == suggestons[4]) {
      answer = '5th answer';
    } else if (question == suggestons[5]) {
      answer = '6th answer';
    } else if (question == suggestons[6]) {
      answer = '7th answer';
    } else if (question == suggestons[7]) {
      answer = '8th answer';
    } else if (question == suggestons[8]) {
      answer = '9th answer';
    }

    return await showDialog(
        context: context,
        builder: (_) {
          return SizedBox(
            height: 200.h,
            child: AlertDialog(
              content: Text(answer),
            ),
          );
        });
  }
}
