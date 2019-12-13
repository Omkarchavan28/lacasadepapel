import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lacasadepapel/services/services.dart';
import 'package:http/http.dart' as http;

class EpisodeList extends StatefulWidget {
  @override
  _EpisodeListState createState() => _EpisodeListState();
}

class _EpisodeListState extends State<EpisodeList> {
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
    return Expanded(
      child: ListView.builder(
        itemCount: data['_embedded']['episodes'].length,
        itemBuilder: (BuildContext context, int index) {
          return data['_embedded']['episodes'][index]['season'] == 4
              ? null
              : Card(
                  color: Colors.red[600],
                  child: Container(
                    // height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              data['_embedded']['episodes'][index]['name'],
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              data['_embedded']['episodes'][index]['season']
                                  .toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            data['_embedded']['episodes'][index]['number']
                                .toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Image(
                            image: CachedNetworkImageProvider(data['_embedded']
                                ['episodes'][index]['image']['original'])),
                        Text(
                          removeAllHtmlTags(
                              data['_embedded']['episodes'][index]['summary']),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
