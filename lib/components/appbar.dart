import 'package:chatboxlab/main.dart';
import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget with PreferredSizeWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  AppBarState createState() => AppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        Lab.name,
        style: TextStyle(color: Colors.black, fontSize: 30),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
              0.2,
              0.5,
              0.75
            ],
                colors: [
              Color.fromARGB(255, 255, 229, 82),
              Color.fromARGB(255, 228, 121, 74),
              Color.fromARGB(255, 173, 72, 71),
            ])),
      ),
    );
  }
}
