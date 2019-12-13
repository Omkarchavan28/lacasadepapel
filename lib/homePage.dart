import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

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
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: data == null ? CircularProgressIndicator() : HomePage(data: data),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    @required this.data,
  }) : super(key: key);

  final data;
  // final List<int> seasons = [1,2,3,4];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              data['name'],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 300.0,
            // decoration: BoxDecoration(
            //     color: Colors.red, borderRadius: BorderRadius.circular(20)),

            child:
                // Image.network(data['image']['original']),
                CachedNetworkImage(
              imageUrl: "http://via.placeholder.com/350x150",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(
            child: Text(removeAllHtmlTags(data['summary'])),
          ),
          RaisedButton(
            onPressed: () {},
            color: Colors.red[700],
            child: Text(
              'WATCH NOW',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    data['_embedded']['episodes'][index]
                                        ['name'],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    data['_embedded']['episodes'][index]
                                            ['season']
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
                              Image.network(data['_embedded']['episodes'][index]
                                  ['image']['original']),
                              Text(
                                removeAllHtmlTags(data['_embedded']['episodes']
                                    [index]['summary']),
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
          )
        ],
      ),
    );
  }
}
