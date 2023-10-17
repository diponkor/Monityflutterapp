import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../global_widgets/custom_appbar.dart';
import 'messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    // TODO: implement initState

    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(107.h),
        child: const CustomAppbar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /*SizedBox(
                height: 648.h,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
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
              ),*/

              // SizedBox(
              //     height: 640.h, child: MessagesScreen(messages: messages)),

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
                  print('You just selected $selection');
                  sendMessage(selection.toString());
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextField(
                    decoration: const InputDecoration(border: OutlineInputBorder()),
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
                                      padding: EdgeInsets.only(right: 60),
                                      child: Card(
                                          child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10),
                                        child: Text(opt),
                                      ))));
                            }).toList(),
                          ))));
                },
              ),

              SizedBox(
                  height: 640.h, child: MessagesScreen(messages: messages)),

              // Container(
              //   height: 48.h,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(36.r),
              //   ),
              //   child: Row(
              //     children: [
              //       SizedBox(
              //         width: 340.w,
              //         child: TextFormField(
              //           controller: _controller,
              //           decoration: InputDecoration(
              //               hintText: 'Send a message',
              //               hintStyle: TextStyle(
              //                   color: secondaryTextColor,
              //                   fontSize: 18.sp,
              //                   fontWeight: FontWeight.w400),
              //               border: InputBorder.none,
              //               contentPadding: EdgeInsets.only(left: 20.w)),
              //         ),
              //       ),
              //       GestureDetector(
              //           onTap: () {
              //             // sendMessage(_controller.text);
              //             // _controller.clear();
              //           },
              //           child:
              //               const Icon(Icons.send, color: secondaryTextColor))
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
