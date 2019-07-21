import 'package:flutter/material.dart';

class DevListAdapter extends StatelessWidget{
  String _camName;
  DevListAdapter(this._camName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: 200.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
//          new Text(_camName),
          new TitleArea(_camName),
          new DevCoverArea()
        ],
      ),
    );
  }

}


class TitleArea extends StatelessWidget{
  String _canName;

  TitleArea(this._canName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Text(_canName),
        new Expanded(
          flex: 1,
          child: new Text(""),
        ),
        new Icon(Icons.more_horiz)
      ],
    );
  }
}

class DevCoverArea extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return new Stack(
//      alignment: AlignmentDirectional.topStart,
//      children: <Widget>[
//        new ConstrainedBox(
//          constraints: BoxConstraints.expand(),
//          child: new Image(image: new AssetImage('assets/images/pic_hzw.jpeg'),
//            width: 600.0,height: 240.0,)
//        ),
//        new Positioned(
//            child: new Icon(Icons.accessibility)
//        )
//      ],
//    );
  return new Image(image: new AssetImage('assets/images/pic_hzw.jpeg'),width: 400.0,height: 150.0,);
  }

}
