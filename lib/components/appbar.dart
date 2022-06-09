import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

import 'package:chatboxlab/global.dart' as global;

class AppBarPage extends StatefulWidget with PreferredSizeWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  AppBarState createState() => AppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarState extends State<AppBarPage> {
  static Color orange = global.colorList[1];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
<<<<<<< HEAD
        global.name,
=======
        Lab.name,
>>>>>>> 20-improve-design
        style: TextStyle(color: Colors.black, fontSize: 30),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Restart.restartApp();
          },
          color: Colors.black,
          icon: const Icon(Icons.restart_alt_sharp),
        ),
        IconButton(
          onPressed: () {
            showAboutDialog(
              context: context,
              applicationName: global.appName,
              applicationVersion: global.version,
            );
          },
          color: Colors.black,
          icon: const Icon(Icons.info),
        ),
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
<<<<<<< HEAD
                colors: [
              orange,
              orange,
=======
                stops: [
              0.2,
              0.5,
              0.75
            ],
                colors: [
              Color.fromARGB(255, 255, 229, 82),
              Color.fromARGB(255, 228, 121, 74),
              Color.fromARGB(255, 173, 72, 71),
>>>>>>> 20-improve-design
            ])),
      ),
    );
  }
}
