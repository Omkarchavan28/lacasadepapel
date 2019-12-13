import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
        var headtextStyle = TextStyle(
          fontSize: 40.0,
          color: Colors.white,
        );
        var subHedtextStyle = TextStyle(color: Colors.white, fontSize: 20);
        return widget.data['_embedded']['episodes'][index]['season'] == 4
            ? null
            : Card(
                child: Container(
                  height: 300,
                  width: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(widget.data['_embedded']
                          ['episodes'][index]['image']['original']),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  child: Container(
                    color: Color.fromRGBO(1, 0, 0, 0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                          child: Text(
                            widget.data['_embedded']['episodes'][index]['name'],
                            style: headtextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Season ${widget.data['_embedded']['episodes'][index]['season'].toString()}',
                                style: subHedtextStyle.copyWith(
                                    color: Colors.red[400]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Episode ${widget.data['_embedded']['episodes'][index]['number'].toString()}',
                                style: subHedtextStyle.copyWith(
                                    color: Colors.white70),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 4, 4),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Runtime : ${widget.data['_embedded']['episodes'][index]['runtime'].toString()} mins',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.white60),
                              ),
                            ],
                          ),
                        )
                      ],
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: <Widget>[
                      //     Text(
                      //       widget.data['_embedded']['episodes'][index]
                      //               ['season']
                      //           .toString(),
                      //       style: TextStyle(
                      //         fontSize: 20.0,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     Align(
                      //       alignment: Alignment.topRight,
                      //       child: Text(
                      //         widget.data['_embedded']['episodes'][index]
                      //                 ['number']
                      //             .toString(),
                      //         style: TextStyle(
                      //           fontSize: 20.0,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ),
                      //     Text(
                      //       removeAllHtmlTags(widget.data['_embedded']
                      //           ['episodes'][index]['summary']),
                      //       style: TextStyle(
                      //         fontSize: 14.0,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
