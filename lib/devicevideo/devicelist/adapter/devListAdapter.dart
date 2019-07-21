import 'package:flutter/material.dart';

class DevListAdapter extends StatelessWidget{
  String _camName;
  DevListAdapter(this._camName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TitleArea(_camName),
          DevCoverArea()
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(_canName),
        Expanded(
          flex: 1,
          child: null,
        ),
        Icon(Icons.more_horiz)
      ],
    );
  }
}

class DevCoverArea extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Image(image: new AssetImage('assets/images/pic_hzw.jpeg'),
            width: 600.0,height: 240.0,)
        ),
        Positioned(
            child: Icon(Icons.accessibility)
        )
      ],
    );
  }

}
