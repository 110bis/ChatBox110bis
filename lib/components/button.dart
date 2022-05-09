import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key, required this.ask, required this.answer})
      : super(key: key);

  final String ask;
  final String answer;

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
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 211, 237, 249)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            minimumSize: MaterialStateProperty.all(const Size(550, 35)),
            maximumSize: MaterialStateProperty.all(const Size(550, 50)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 150)),
            textStyle: MaterialStateProperty.all(const TextStyle(
              fontStyle: FontStyle.italic,
            )),
            elevation: MaterialStateProperty.resolveWith<double>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed) ||
                    states.contains(MaterialState.disabled)) {
                  return 0;
                }
                return 5;
              },
            ),
            //side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Colors.black, width: 0.5)),
            shape: MaterialStateProperty.all<BeveledRectangleBorder>(
                const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)))),
            //shadowColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          child: Text(widget.ask),
          onPressed: () {
            setState(() {
              display = !display;
            });
          }),
      display
          ? widget.answer.contains("/img/", 0)
              ? const Text("img")
              : widget.answer.contains(".png")
                  ? const Text("img")
                  : Text(widget.answer)
          : const SizedBox()
    ]);
  }
}
