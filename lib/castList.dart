import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CastList extends StatefulWidget {
  final data;

  const CastList({Key key, this.data}) : super(key: key);

  @override
  _CastListState createState() => _CastListState();
}

class _CastListState extends State<CastList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.data['_embedded']['cast'].length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.red[600],
            child: Column(children: <Widget>[
              Text(widget.data['_embedded']['cast'][index]['person']['name']),
              Image(
                image: CachedNetworkImageProvider(widget.data['_embedded']
                    ['cast'][index]['character']['image']['original']),
              )
            ]),
          );
        });
  }
}
