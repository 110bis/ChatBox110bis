import 'package:flutter/material.dart';

import 'package:chatboxlab/global.dart' as global;
import 'package:chatboxlab/models/faq.dart';

class Button extends StatefulWidget {
  const Button({Key? key, required this.faq}) : super(key: key);

  final FAQ faq;

  @override
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<Button> {
  bool display = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width * 0.95, 35)),
            maximumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width * 0.95, 200)),
            elevation: MaterialStateProperty.resolveWith<double>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed) ||
                    states.contains(MaterialState.disabled)) {
                  return 0;
                }
                return 5;
              },
            ),
            shape: MaterialStateProperty.all<BeveledRectangleBorder>(
                const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
            shadowColor: MaterialStateProperty.all<Color>(global.colorList[1]),
          ),
          child: Text(
            widget.faq.ask,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: global.fontFamily,
            ),
          ),
          onPressed: () {
            setState(() {
              display = !display;
            });
          }),
      const SizedBox(height: 10),
      display
          ? widget.faq.anwser.contains("/img/")
              ? const Text("img")
              : widget.faq.anwser.contains(".png")
                  ? const Text("img")
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 0),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(widget.faq.anwser)),
                      ))
          : const SizedBox()
    ]);
  }
}
