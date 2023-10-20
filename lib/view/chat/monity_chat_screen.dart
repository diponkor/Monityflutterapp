import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:finance_and_budget/controller/budget_controller.dart';
import 'package:flutter/foundation.dart';
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
    'How much money did I spend last week? ',
  ];

  String answer = 'No Answer';

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 730 && kIsWeb?Center(
      child: SizedBox(
        width: 600.w,
        child: Scaffold(
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
        ),
      ),
    ) : Scaffold(
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
      answer = _controller.spendLastMonth;
    }else{
      answer = 'Data not match';
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
