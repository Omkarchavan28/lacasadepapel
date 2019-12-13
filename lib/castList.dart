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
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: widget.data['_embedded']['cast'].length,
        itemBuilder: (BuildContext context, int index) {
          var _headtextStyle = TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          );
          var _subHeadtextStyle = TextStyle(
            color: Colors.white,
            fontSize: 15,
          );
          return Card(
            color: Colors.red[600],
            child: Container(
              height: 300,
              width: 450,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(widget.data['_embedded']
                      ['cast'][index]['character']['image']['original']),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                    width: 450.0,
                    child: Container(
                      color: Color.fromRGBO(10, 10, 10, 0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.data['_embedded']['cast'][index]
                                        ['character']['name'],
                                    style: _headtextStyle,
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.data['_embedded']['cast'][index]
                                        ['person']['name'],
                                    style: _subHeadtextStyle,
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
// Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     Text(
//                       widget.data['_embedded']['cast'][index]['person']
//                                   ['country'] !=
//                               null
//                           ? widget.data['_embedded']['cast'][index]['person']
//                                   ['country']['name']
//                               .toString()
//                           : 'N/A',
//                     ),
//                     Text(
//                       widget.data['_embedded']['cast'][index]['person']
//                                   ['birthday']
//                               .toString() ??
//                           'N/A',
//                     ),
//                   ],
//                 ),
