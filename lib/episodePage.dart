import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lacasadepapel/episodeList.dart';
import 'package:http/http.dart' as http;
import 'package:lacasadepapel/services/fileFunctions.dart';

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

  _showDialog(BuildContext context, Function function) => showDialog(
        context: context,
        builder: (_) => Container(
          color: Colors.black12,
          child: Stack(
            children: <Widget>[
              Dialog(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'No Internet Found Please Connect To Internet And Try Again',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      FlatButton(
                        color: Colors.green,
                        onPressed: () {
                          function();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Yes, I'am Connected",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      FlatButton(
                        color: Colors.red,
                        onPressed: () {
                          exit(0);
                        },
                        child: Text(
                          "NO, I'am Not Connected",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      );

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
        _showDialog(context, getData);
      }
    } else {
      data = jsonDecode(_data);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
