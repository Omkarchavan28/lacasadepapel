import 'package:flutter/material.dart';
import 'package:lacasadepapel/episodeList.dart';
import 'package:lacasadepapel/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
