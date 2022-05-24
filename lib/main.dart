import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/appbar.dart';
import 'components/buttonlist.dart';

void main() => runApp(const Lab());

class Lab extends StatefulWidget {
  const Lab({Key? key}) : super(key: key);

  static const String name =
      "110 bis, lab d'innovation de l'éducation nationale";

  @override
  LabState createState() => LabState();
}

class LabState extends State<Lab> {
  List<String> ask = [];
  List<String> answer = [];
  List<String> tmp = [];

  List<Color> colorList = [
    const Color.fromARGB(255, 255, 229, 82),
    const Color.fromARGB(255, 228, 121, 74),
    const Color.fromARGB(255, 173, 72, 71),
  ];

  bool started = false;

  int index = 0;

  Color bottomColor = const Color.fromARGB(255, 173, 72, 71);
  Color centerColor = const Color.fromARGB(255, 228, 121, 74);
  Color topColor = const Color.fromARGB(255, 255, 229, 82);

  Alignment begin = Alignment.topRight;
  Alignment end = Alignment.bottomLeft;

  splitData(String rep) {
    tmp = rep.split(';\n');
    for (var i = 0; i != tmp.length; ++i) {
      if (i % 2 == 0) {
        if (tmp[i][0] == '\n') {
          tmp[i] = tmp[i].substring(1);
        }
        ask.add(tmp[i]);
      } else {
        answer.add(tmp[i]);
      }
    }
  }

  getData() async {
    String rep = "";
    rep = await rootBundle.loadString('assets/docs/data.txt');
    splitData(rep);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (ask.isEmpty ||
        answer.isEmpty &&
            ask.length != answer.length &&
            tmp.length / 2 != ask.length &&
            tmp.length / 2 != answer.length) {
      getData();
      return const Center(child: CircularProgressIndicator());
    } else {
      if (!started) {
        Future.delayed(const Duration(milliseconds: 10), () {
          setState(() {
            bottomColor = const Color.fromARGB(255, 255, 229, 82);
            centerColor = const Color.fromARGB(255, 173, 72, 71);
            topColor = const Color.fromARGB(255, 228, 121, 74);
            index = index + 1;
          });
        });
        started = true;
      }
      return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Marianne',
        ),
        debugShowCheckedModeBanner: false,
        title: Lab.name,
        home: Scaffold(
            appBar: const AppBarPage(),
            body: AnimatedContainer(
              duration: const Duration(seconds: 4),
              onEnd: () {
                setState(() {
                  int index1 = 0;
                  int index2 = 0;

                  if (index == 2) {
                    index = 0;
                  } else {
                    index = index + 1;
                  }

                  if (index == 0) {
                    index1 = 1;
                    index2 = 2;
                  } else if (index == 1) {
                    index1 = 2;
                    index2 = 0;
                  } else if (index == 2) {
                    index1 = 0;
                    index2 = 1;
                  }

                  // animate the color
                  topColor = colorList[index];
                  centerColor = colorList[index1];
                  bottomColor = colorList[index2];
                });
              },
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: begin, end: end, stops: const [
                  0.2,
                  0.5,
                  0.75
                ], colors: [
                  topColor,
                  centerColor,
                  bottomColor,
                ]),
              ),
              child: ButtonList(ask: ask, answer: answer),
            )),
      );
    }
  }
}
