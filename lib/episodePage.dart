import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lacasadepapel/episodeList.dart';
import 'package:http/http.dart' as http;

class EpisodePage extends StatefulWidget {
  @override
  _EpisodePageState createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
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
        'http://api.tvmaze.com/singlesearch/shows?q=money%20heist&embed=episodes');
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
          : EpisodeList(data: data),
    );
  }
}
