import 'package:flutter/material.dart';
import 'package:lacasadepapel/services/services.dart';

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
            top: constraints.maxHeight - 300,
            // left: constraints.maxWidth - 180,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  width: 400,
                  child: Text(removeAllHtmlTags(data['summary']),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
                RaisedButton.icon(
                  icon: Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 25,
                  ),
                  splashColor: Colors.black87,
                  onPressed: () {},
                  color: Colors.red[700],
                  label: Text(
                    'Watch Now on Netflix',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: constraints.maxHeight - 100,
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
            top: constraints.maxHeight - 100,
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
    // return Column(
    //   children: <Widget>[
    //     Container(
    //       height: 300.0,
    //       child: Image(
    //         image: CachedNetworkImageProvider(data['image']['original']),
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.all(10),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(5),
    //       ),
    //       child: Text(
    //         removeAllHtmlTags(data['summary']),
    //         style: TextStyle(
    //           fontSize: 20,
    //           color: Colors.black,
    //         ),
    //       ),
    //     ),
    //     Card(
    //       color: Colors.white,
    //       child: Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Column(
    //           children: <Widget>[
    //             RaisedButton(
    //               onPressed: () {},
    //               color: Colors.red[700],
    //               child: Text(
    //                 'Watch Now on Netflix',
    //                 style: TextStyle(
    //                   color: Colors.white,
    //                 ),
    //               ),
    //             ),
    //             RaisedButton.icon(
    //               icon: Icon(
    //                 Icons.arrow_forward_ios,
    //                 color: Colors.white,
    //                 size: 15,
    //               ),
    //               onPressed: () {
    //                 Navigator.pushNamed(context, '/episodePage');
    //               },
    //               color: Colors.red[700],
    //               label: Text(
    //                 'Episode List',
    //                 style: TextStyle(color: Colors.white, fontSize: 15),
    //               ),
    //             ),
    //             RaisedButton.icon(
    //               icon: Icon(
    //                 Icons.people_outline,
    //                 color: Colors.white,
    //                 size: 15,
    //               ),
    //               onPressed: () {
    //                 Navigator.pushNamed(context, '/castPage');
    //               },
    //               color: Colors.red[700],
    //               label: Container(
    //                 child: Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 2),
    //                   child: Text(
    //                     'Cast ',
    //                     style: TextStyle(color: Colors.white, fontSize: 15),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
