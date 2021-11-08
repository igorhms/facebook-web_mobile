import 'package:facebook_interface/screens/major.dart';
import 'package:facebook_interface/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Facebook",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: ColorsPalette.scaffold),
      // home: const Home(),
      home: const Major(),
    ),
  );
}
