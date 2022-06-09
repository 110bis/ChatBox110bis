import 'package:chatboxlab/api/sheets/faq_sheets_api.dart';
import 'package:flutter/material.dart';

import 'package:chatboxlab/global.dart' as global;
import 'package:package_info_plus/package_info_plus.dart';

import 'components/appbar.dart';
import 'components/buttonlist.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FAQSheetsApi.init();

  runApp(const Lab());
}

class Lab extends StatefulWidget {
  const Lab({Key? key}) : super(key: key);

  @override
  LabState createState() => LabState();
}

class LabState extends State<Lab> {
  bool started = false;

<<<<<<< HEAD
  int index = 0;
=======
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
>>>>>>> 20-improve-design

  getData() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    global.appName = packageInfo.appName;
    global.version = packageInfo.version;
    final _faq = await FAQSheetsApi.getAll();
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      global.faq = _faq;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (global.faq.isEmpty) {
      getData();
      return const Center(child: CircularProgressIndicator());
    } else {
      if (!started) {
        Future.delayed(const Duration(milliseconds: 10), () {
          setState(() {
<<<<<<< HEAD
            global.bottomColor = global.colorList[1];
            global.centerColor = global.colorList[0];
            global.topColor = global.colorList[1];
=======
            bottomColor = const Color.fromARGB(255, 255, 229, 82);
            centerColor = const Color.fromARGB(255, 173, 72, 71);
            topColor = const Color.fromARGB(255, 228, 121, 74);
>>>>>>> 20-improve-design
            index = index + 1;
          });
        });
        started = true;
      }
      return MaterialApp(
        theme: ThemeData(
          fontFamily: global.fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        title: global.name,
        home: Scaffold(
            appBar: const AppBarPage(),
            body: AnimatedContainer(
              duration: const Duration(seconds: 4),
              onEnd: () {
                setState(() {
<<<<<<< HEAD
=======
                  int index1 = 0;
                  int index2 = 0;

>>>>>>> 20-improve-design
                  if (index == 2) {
                    index = 0;
                  } else {
                    index = index + 1;
                  }

                  if (index == 0) {
<<<<<<< HEAD
                    global.topColor = global.colorList[index];
                    global.centerColor = global.colorList[index + 1];
                    global.bottomColor = global.colorList[index + 2];
                  } else if (index == 1) {
                    global.topColor = global.colorList[index];
                    global.centerColor = global.colorList[index - 1];
                    global.bottomColor = global.colorList[index];
                  } else if (index == 2) {
                    global.topColor = global.colorList[index];
                    global.centerColor = global.colorList[index - 1];
                    global.bottomColor = global.colorList[index - 2];
                  }
                });
              },
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: global.begin,
                    end: global.end,
                    stops: global.stops,
                    colors: [
                      global.topColor,
                      global.centerColor,
                      global.bottomColor,
                    ]),
              ),
              child: const ButtonList(),
=======
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
>>>>>>> 20-improve-design
            )),
      );
    }
  }
}
