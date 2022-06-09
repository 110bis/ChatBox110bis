library chatboxlab.global;

import 'package:flutter/material.dart';
import 'package:chatboxlab/models/faq.dart';

//set default values for the initial run
const String name = "110 bis, lab d'innovation de l'éducation nationale";

const String fontFamily = "Marianne";

List<FAQ> faq = [];

const Alignment begin = Alignment.topRight;
const Alignment end = Alignment.bottomLeft;

const List<Color> colorList = [
  Color.fromARGB(255, 255, 229, 82),
  Color.fromARGB(255, 228, 121, 74),
  Color.fromARGB(255, 173, 72, 71),
];

const List<double> stops = [0.2, 0.5, 0.75];

Color bottomColor = colorList[2];
Color centerColor = colorList[1];
Color topColor = colorList[0];

String appName = "";
String version = "";
