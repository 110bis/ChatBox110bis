import 'package:flutter/material.dart';
import 'package:chatboxlab/global.dart' as global;

import 'button.dart';

class ButtonList extends StatelessWidget {
  const ButtonList({Key? key}) : super(key: key);

  List<Widget> displayCard() {
    List<Widget> data = [];
    for (var i = 0; i < global.faq.length; ++i) {
      if (global.faq.length != i + 1) {
        data.add(Button(faq: global.faq[i]));
        data.add(const SizedBox(height: 15));
      } else {
        data.add(Button(faq: global.faq[i]));
      }
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      children: displayCard(),
    );
  }
}
