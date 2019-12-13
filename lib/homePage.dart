import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lacasadepapel/services/services.dart';

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
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : HomePage(data: data),
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
              child: Image(
                  image:
                      CachedNetworkImageProvider(data['image']['original']))),
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
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/episodePage');
            },
            color: Colors.red[700],
            child: Text(
              'Episode List',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/castPage');
            },
            color: Colors.red[700],
            child: Text(
              'Cast ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          // EpisodeList()
        ],
      ),
    );
  }
}
