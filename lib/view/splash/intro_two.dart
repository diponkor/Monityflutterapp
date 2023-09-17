import 'package:finance_and_budget/view/splash/widgets/custom_button.dart';
import 'package:finance_and_budget/view/splash/intro_three.dart';
import 'package:flutter/material.dart';

class IntroTwo extends StatelessWidget {
  const IntroTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child:
                  Image.asset('assets/images/intro2.png', fit: BoxFit.cover)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const IntroThree()));
                  },
                  child: customButton(text: 'Let\'s Go')),
            ),
          ),
        ],
      ),
    );
  }
}
