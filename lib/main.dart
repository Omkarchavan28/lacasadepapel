import 'package:flutter/material.dart';
import 'package:lacasadepapel/pages/castPage.dart';
import 'package:lacasadepapel/pages/episodePage.dart';
import 'package:lacasadepapel/src/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Casa De Papel',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the Home widget.
        '/': (context) => Home(),
        // When navigating to the "/episodePage" route, build the episodePage Screen widget.
        '/episodePage': (context) => EpisodePage(),
        // When navigating to the "/castPage" route, build the castPage Screen widget.
        '/castPage': (context) => CastPage(),
      },
    );
  }
}
