import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lacasadepapel/castList.dart';
import 'package:http/http.dart' as http;

class CastPage extends StatefulWidget {
  @override
  _CastPageState createState() => _CastPageState();
}

class _CastPageState extends State<CastPage> {
  var data;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    print('getting');
    print(data);
    http.Response res = await http.get(
        'http://api.tvmaze.com/singlesearch/shows?q=money%20heist&embed=cast');
    data = jsonDecode(res.body);
    setState(() {
      print('got');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Episodes')),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : CastList(data: data),
    );
  }
}
