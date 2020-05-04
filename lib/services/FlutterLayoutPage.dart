import 'package:flutter/material.dart';

class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() => _FlutterLayoutPageState();
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  @override
  Widget build(BuildContext context) {
    Color myColor = Theme.of(context).primaryColor;
    return MaterialApp(
        title: 'Flutter Lay Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Create Doc"),
          ),
          body: ListView(
            children: <Widget>[
              Image.asset('assets/images/bg01.jpg',
                  width: 600, height: 240, fit: BoxFit.cover),
              titleSection,
              buttonSelection(myColor),
              textSelection,
            ],
          ),
        ));
  }
}

Widget titleSection = Container(
  child: Padding(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  child: Text(
                    "Oeschinen Lake Camground",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                "Kandersteg, Switzerland",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          ),
        ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        Text("41"),
      ],
    ),
  ),
);

Widget buttonSelection(Color myColor) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonColumn(Colors.black, Icons.call, 'CALL'),
        _buildButtonColumn(Colors.black, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
      ],
    ),
  );
}

Column _buildButtonColumn(Color myColor, IconData myIconData, String myStr) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(myIconData, color: myColor),
      Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            myStr,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: myColor,
            ),
          ))
    ],
  );
}

Widget textSelection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Oeschinen Lake is a lake in the Bernese Oberland, Switzerland, 4 kilometres east of '
    'Kandersteg in the Oeschinen valley. At an elevation of 1,578 metres, it has a surface area of 1.1147 '
    'square kilometres. Its maximum depth is 56 metres. The lake is fed through a series of mountain creeks '
    'and drains underground. Wikipedia ',
    softWrap: true,
  ),
);
