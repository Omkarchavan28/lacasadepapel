import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lacasadepapel/pages/homePage.dart';
import 'dart:io';

import 'package:lacasadepapel/services/fileFunctions.dart';
import 'package:lacasadepapel/src/AboutDialog.dart';
import 'package:lacasadepapel/src/popUp.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    String _data = await readContent('homePage');
    if (_data == null) {
      print('empty');
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          http.Response res = await http
              .get('http://api.tvmaze.com/singlesearch/shows?q=money%20heist');
          data = jsonDecode(res.body);
          setState(() {});
          writeContent('homePage', res.body);
        }
      } on SocketException catch (_) {
        noInternetShowDialog(context, getData);
      }
    } else {
      data = jsonDecode(_data);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AboutInfoButtom(),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: data == null
            ? Center(child: CircularProgressIndicator())
            : HomePage(data: data),
      ),
    );
  }
}
