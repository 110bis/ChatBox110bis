import 'package:chatboxlab/api/sheets/faq_sheets_api.dart';
import 'package:flutter/material.dart';

import 'package:chatboxlab/global.dart' as global;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:chatboxlab/api/sheets/gsheets_credentials.dart';

import 'components/appbar.dart';
import 'components/buttonlist.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  await Credential.init();
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

  int index = 0;

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
            global.bottomColor = global.colorList[1];
            global.centerColor = global.colorList[0];
            global.topColor = global.colorList[1];
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
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 100,
              leadingWidth: 100,
              leading: Container(
                padding: const EdgeInsets.all(3.5),
                child: Image.asset(
                  "assets/img/logo_MENJS.jpg",
                  isAntiAlias: true,
                ),
              ),
              actions: [
                Container(
                  padding: const EdgeInsets.all(3.5),
                  child: Image.asset(
                    "assets/img/110bisd.jpg",
                    isAntiAlias: true,
                  ),
                ),
              ],
            ),
            body: Scaffold(
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
                )),
          ));
    }
  }
}
