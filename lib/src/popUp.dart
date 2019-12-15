import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lacasadepapel/services/basicFunctions.dart';
import 'package:lacasadepapel/services/shared.dart';

showEpisodeDialog(BuildContext context, Widget child) {
  showDialog(
    context: context,
    builder: (_) => Container(
      color: Colors.black12,
      child: child,
    ),
  );
}

class DialogData extends StatelessWidget {
  const DialogData({
    Key key,
    @required this.episode,
  }) : super(key: key);

  final episode;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Container(
          height: 300,
          width: 450,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            image: DecorationImage(
              image: CachedNetworkImageProvider(episode['image']['original']),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                child: Text(
                  episode['name'],
                  style: headtextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Season ${episode['season'].toString()}',
                      style: subHedtextStyle.copyWith(color: Colors.red[700]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Episode ${episode['number'].toString()}',
                      style: subHedtextStyle.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Runtime : ${episode['runtime'].toString()} mins',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          removeAllHtmlTags('${episode['airdate']}'),
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.red[500]),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    child: Text(
                      removeAllHtmlTags(episode['summary']),
                      style: headtextStyle.copyWith(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Nointernet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Text('Please Connnect to Internet'),
      ),
    );
  }
}

noInternetShowDialog(BuildContext context, Function function) {
  showDialog(
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
}
