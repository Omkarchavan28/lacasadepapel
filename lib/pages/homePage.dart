import 'package:flutter/material.dart';
import 'package:lacasadepapel/services/basicFunctions.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
    @required this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('assets/bg-1.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            top: constraints.maxHeight - 320,
            // left: constraints.maxWidth - 180,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  width: 400,
                  child: Text(
                    removeAllHtmlTags(data['summary']),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Genres(genres: data['genres'][0]),
                    Genres(genres: data['genres'][1]),
                    Genres(genres: data['genres'][2]),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  // width: 150,
                  height: 50,
                  child: RaisedButton.icon(
                    icon: Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                      size: 25,
                    ),
                    splashColor: Colors.black87,
                    onPressed: () => launchURL(data['officialSite'].toString()),
                    color: Colors.red[700],
                    label: Text(
                      'Watch Now on Netflix',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: constraints.maxHeight - 120,
            left: 20,
            child: SizedBox(
              width: 150,
              height: 50,
              child: RaisedButton.icon(
                splashColor: Colors.black87,
                icon: Icon(
                  Icons.people_outline,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/castPage');
                },
                color: Colors.red[700],
                label: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      'Cast ',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: constraints.maxHeight - 120,
            left: constraints.maxWidth - 170,
            child: SizedBox(
              width: 150,
              height: 50,
              child: RaisedButton.icon(
                splashColor: Colors.black87,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 15,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/episodePage');
                },
                color: Colors.red[700],
                label: Text(
                  'Episode List',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Genres extends StatelessWidget {
  const Genres({
    Key key,
    @required this.genres,
  }) : super(key: key);

  final genres;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
      ),
      child: Text(
        genres,
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }
}
