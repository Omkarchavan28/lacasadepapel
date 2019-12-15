import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lacasadepapel/popUp.dart';
import 'package:lacasadepapel/services/shared.dart';

class EpisodeList extends StatefulWidget {
  final data;

  const EpisodeList({Key key, this.data}) : super(key: key);

  @override
  _EpisodeListState createState() => _EpisodeListState();
}

class _EpisodeListState extends State<EpisodeList> {
  _showDialog(BuildContext context, Widget child) {
    showDialog(
      context: context,
      builder: (_) => Container(
        color: Colors.black12,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data['_embedded']['episodes'].length,
      itemBuilder: (BuildContext context, int index) {
        return widget.data['_embedded']['episodes'][index]['season'] == 4
            ? null
            : InkWell(
                onTap: () => _showDialog(
                    context,
                    Stack(
                      children: <Widget>[
                        Dialog(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: DialogData(
                            episode: widget.data['_embedded']['episodes']
                                [index],
                          ),
                        ),
                      ],
                    )),
                child: Card(
                  child: Container(
                    height: 300,
                    width: 450,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            widget.data['_embedded']['episodes'][index]['image']
                                ['original']),
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
                              widget.data['_embedded']['episodes'][index]
                                  ['name'],
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
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
