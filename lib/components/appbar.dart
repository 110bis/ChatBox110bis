import 'package:flutter/foundation.dart';
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

  Widget _qrCodeDialog(BuildContext context) {
    return AlertDialog(
      title: const Text("QR Code"),
      content: Image.asset(
        "assets/img/qrcode.png",
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Version Beta",
        style: TextStyle(color: Colors.black, fontSize: 30),
      ),
      centerTitle: true,
      leading: !kIsWeb
          ? IconButton(
              icon: const Icon(Icons.qr_code_2, color: Colors.black),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => _qrCodeDialog(context));
              },
            )
          : const SizedBox(),
      actions: [
        kIsWeb
            ? const SizedBox()
            : IconButton(
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
              applicationVersion: "ver. " + global.version,
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
                colors: [
              orange,
              orange,
            ])),
      ),
    );
  }
}
