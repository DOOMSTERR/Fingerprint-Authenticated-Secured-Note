import '../Auth/BiometricsPage/biometricsIndex.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finger Print Auth',
      theme: ThemeData(

        primarySwatch:Colors.purple,
      ),
      home:biometricsIndex(),
    );
  }
}


