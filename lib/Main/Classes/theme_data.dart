import 'package:flutter/material.dart';

class Themes {
  static ThemeData light = ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.light,
    accentColor: Colors.pink[300],
    primarySwatch: Colors.purple,
  );
  static ThemeData dark = ThemeData(
    fontFamily: 'Montserrat',
    brightness: Brightness.dark,
    accentColor: Colors.red,
    primarySwatch: Colors.red,
  );
}
