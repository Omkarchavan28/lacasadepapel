import 'package:flutter/material.dart';
import 'package:lacasadepapel/services/basicFunctions.dart';
import 'package:lacasadepapel/src/customAboutDialog.dart';

class AboutInfoButtom extends StatelessWidget {
  const AboutInfoButtom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buildCustomShowAboutDialog(context);
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.info,
          color: Colors.red,
          size: 40,
        ),
      ),
    );
  }
}

void buildCustomShowAboutDialog(BuildContext context) {
  return customShowAboutDialog(
    context: context,
    applicationVersion: '1.0.0',
    applicationName: "La Casa De Papel",
    applicationIcon: Icon(Icons.face),
    children: [
      Text(
        'La Casa De Papel Information App made using Tv-Maze API',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      InkWell(
        onTap: () => launchURL('www.tvmaze.com'),
        child: SelectableText(
          'www.tvmaze.com',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      SizedBox(height: 20),
      Text(
        'Made By',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      SizedBox(height: 20),
      Text(
        'Omkar Chavan',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      Divider(
        thickness: 1,
        height: 10,
        color: Colors.white,
        indent: 50,
        endIndent: 50,
      ),
      Column(
        children: <Widget>[
          Text(
            'Email me:',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          Divider(
            thickness: 1,
            height: 5,
            color: Colors.white,
            indent: 100,
            endIndent: 100,
          ),
          InkWell(
            onTap: () => launchURL('chavanomkar245@gmail.com'),
            child: SelectableText(
              'chavanomkar245@gmail.com',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      Column(
        children: <Widget>[
          Text(
            'GitHub link:',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          Divider(
            thickness: 1,
            height: 5,
            color: Colors.white,
            indent: 100,
            endIndent: 100,
          ),
          InkWell(
            onTap: () => launchURL('https://github.com/Omkarchavan28'),
            child: SelectableText(
              'https://github.com/Omkarchavan28',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      Column(
        children: <Widget>[
          Text(
            'Twitter link:',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          Divider(
            thickness: 1,
            height: 5,
            color: Colors.white,
            indent: 100,
            endIndent: 100,
          ),
          InkWell(
            onTap: () => launchURL('twitter.com/meomkarchavan'),
            child: SelectableText(
              'twitter.com/meomkarchavan',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
