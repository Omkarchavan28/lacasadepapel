import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lacasadepapel/services/services.dart';

class EpisodeList extends StatefulWidget {
  final data;

  const EpisodeList({Key key, this.data}) : super(key: key);

  @override
  _EpisodeListState createState() => _EpisodeListState();
}

class _EpisodeListState extends State<EpisodeList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data['_embedded']['episodes'].length,
      itemBuilder: (BuildContext context, int index) {
        return widget.data['_embedded']['episodes'][index]['season'] == 4
            ? null
            : Card(
                color: Colors.red[600],
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              widget.data['_embedded']['episodes'][index]
                                  ['name'],
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              widget.data['_embedded']['episodes'][index]
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
                            widget.data['_embedded']['episodes'][index]
                                    ['number']
                                .toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Image(
                            image: CachedNetworkImageProvider(
                                widget.data['_embedded']['episodes'][index]
                                    ['image']['original'])),
                        Text(
                          removeAllHtmlTags(widget.data['_embedded']['episodes']
                              [index]['summary']),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
      },
    );
  }
}
