import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lacasadepapel/services/fileFunctions.dart';
import 'package:lacasadepapel/src/AboutDialog.dart';
import 'package:lacasadepapel/src/castList.dart';
import 'package:lacasadepapel/src/popUp.dart';

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
    String _data = await readContent('castPage');
    if (_data == null) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          http.Response res = await http.get(
              'http://api.tvmaze.com/singlesearch/shows?q=money%20heist&embed=cast');
          data = jsonDecode(res.body);
          writeContent('castPage', res.body);

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
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Cast'),
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : CastList(data: data),
    );
  }
}
