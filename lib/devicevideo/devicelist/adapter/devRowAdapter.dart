import 'package:flutter/material.dart';

class DevRowAdapter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(
          child: new Image(image: new AssetImage('assets/images/pic_hzw.jpeg'),
            width: 100.0,
            height: 70.0,
            fit: BoxFit.cover,),
          margin: EdgeInsets.all(10.0),
        ),
        new Expanded(child: new Column(
          children: <Widget>[
            new Container(
              height: 70.0,
              child: new Text('这是一张非常漂亮的图片'),
            )
          ],
        ),
          flex: 1,)
      ],
    );
  }

}