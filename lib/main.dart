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
      return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Marianne',
        ),
        debugShowCheckedModeBanner: false,
        title: Lab.name,
        home: Scaffold(
            appBar: const AppBarPage(),
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                    Color.fromARGB(255, 255, 229, 82),
                    Color.fromARGB(255, 173, 72, 71),
                  ])),
              child: ButtonList(ask: ask, answer: answer),
            )),
      );
    }
  }
}
