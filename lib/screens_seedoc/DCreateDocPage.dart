import 'package:flutter/material.dart';

class DCreateDocPage extends StatefulWidget {
  DCreateDocPage({Key key}) : super(key: key);

  @override
  _DCreateDocPageState createState() => _DCreateDocPageState();
}

class _DCreateDocPageState extends State<DCreateDocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Create Document"),),
    );
  }
}