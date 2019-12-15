import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lacasadepapel/services/fileFunctions.dart';
import 'package:lacasadepapel/src/AboutDialog.dart';
import 'package:lacasadepapel/src/episodeList.dart';
import 'package:lacasadepapel/src/popUp.dart';

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
    String _data = await readContent('episodePage');
    if (_data == null) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          http.Response res = await http.get(
              'http://api.tvmaze.com/singlesearch/shows?q=money%20heist&embed=episodes');
          data = jsonDecode(res.body);
          writeContent('episodePage', res.body);
          setState(() {});
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Episodes'),
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : EpisodeList(data: data),
    );
  }
}
