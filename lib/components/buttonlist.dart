import 'package:flutter/material.dart';

import 'button.dart';

class ButtonList extends StatelessWidget {
  const ButtonList({Key? key, required this.ask, required this.answer})
      : super(key: key);

  final List<String> ask;
  final List<String> answer;

  List<Widget> displayCard(List<String> ask) {
    List<Widget> data = [];
    for (var i = 0; i < ask.length; ++i) {
      if (ask.length != i + 1) {
        data.add(Button(ask: ask[i], answer: answer[i]));
        data.add(const SizedBox(height: 15));
      } else {
        data.add(Button(ask: ask[i], answer: answer[i]));
      }
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      children: displayCard(ask),
    );
  }
}
