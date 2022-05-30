import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

import 'components/appbar.dart';
import 'components/buttonlist.dart';

void main() => runApp(const Lab());

class Lab extends StatefulWidget {
  const Lab({Key? key}) : super(key: key);

  static const String name =
      "110 bis, lab d'innovation de l'éducation nationale";

  static const List<Color> colorList = [
    Color.fromARGB(255, 255, 229, 82),
    Color.fromARGB(255, 228, 121, 74),
    Color.fromARGB(255, 173, 72, 71),
  ];

  @override
  LabState createState() => LabState();
}

class LabState extends State<Lab> {
  List<String> ask = [];
  List<String> answer = [];
  List<List<dynamic>> tmp = [];

  bool started = false;

  int index = 0;

  Color bottomColor = Lab.colorList[2];
  Color centerColor = Lab.colorList[1];
  Color topColor = Lab.colorList[0];

  Alignment begin = Alignment.topRight;
  Alignment end = Alignment.bottomLeft;

  getData() async {
    String rep = "";
    rep = await rootBundle.loadString('assets/docs/data.csv');
    tmp = const CsvToListConverter(fieldDelimiter: ',').convert(rep);
    for (var i = 0; tmp.length != i; ++i) {
      ask.add(tmp[i][0].toString());
      answer.add(tmp[i][1].toString());
    }
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
            bottomColor = Lab.colorList[1];
            centerColor = Lab.colorList[0];
            topColor = Lab.colorList[1];
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
                  if (index == 2) {
                    index = 0;
                  } else {
                    index = index + 1;
                  }

                  if (index == 0) {
                    topColor = Lab.colorList[index];
                    centerColor = Lab.colorList[index + 1];
                    bottomColor = Lab.colorList[index + 2];
                  } else if (index == 1) {
                    topColor = Lab.colorList[index];
                    centerColor = Lab.colorList[index - 1];
                    bottomColor = Lab.colorList[index];
                  } else if (index == 2) {
                    topColor = Lab.colorList[index];
                    centerColor = Lab.colorList[index - 1];
                    bottomColor = Lab.colorList[index - 2];
                  }
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
