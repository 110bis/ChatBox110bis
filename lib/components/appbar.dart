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
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 249, 223, 211)),
      ),
    );
  }
}
