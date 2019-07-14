import 'package:flutter/material.dart';
class TabMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("this is tabMain")),
      body: new Center(
        child: new Text(
            "PageSecond",
            style: new TextStyle(fontSize: 25)),
      ),
    );
  }
}