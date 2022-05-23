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
            //backgroundColor: MaterialStateProperty.all<Color>(
            //    const Color.fromARGB(255, 153, 214, 204)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            minimumSize: MaterialStateProperty.all(const Size(550, 35)),
            maximumSize: MaterialStateProperty.all(const Size(550, 200)),
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
            shadowColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 228, 121, 74)),
          ),
          child: Text(
            widget.ask,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Marianne',
            ),
          ),
          onPressed: () {
            setState(() {
              display = !display;
            });
          }),
      const SizedBox(height: 10),
      display
          ? widget.answer.contains("/img/")
              ? const Text("img")
              : widget.answer.contains(".png")
                  ? const Text("img")
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      //height: MediaQuery.of(context).size.height * 0.4,
                      child: Card(
                        //color: const Color.fromARGB(255, 214, 153, 163),
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 0),
                        child: Text(widget.answer),
                      ))
          : const SizedBox()
    ]);
  }
}
