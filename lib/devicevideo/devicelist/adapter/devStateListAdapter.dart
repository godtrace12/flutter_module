import 'package:flutter/material.dart';
import 'package:flutter_module/devicevideo/deviceset/deviceSetting.dart';

class DevStateListAdapter extends StatelessWidget{
  String _camName;
  DevStateListAdapter(this._camName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: EdgeInsets.all(20),
      width: 200.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
//          new Text(_camName),
          new TitleArea(_camName),
          new DevCoverArea(_camName)
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

class DevCoverArea extends StatefulWidget{
  String _camName;
  DevCoverArea(this._camName);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DevCoverAreaState();
  }

}

class _DevCoverAreaState extends State<DevCoverArea>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 150.0
      ),
      child: new Stack(
        alignment: AlignmentDirectional.topEnd,
        fit: StackFit.loose,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          new GestureDetector(
            child: new Image(image: new AssetImage('assets/images/pic_hzw.jpeg'),),
            onTap: _handleDevCoverTap,
          ),
          new Positioned(top: 16.0,right:6.0,child: new Icon(Icons.accessibility))
//        new Icon(Icons.accessibility)
        ],
      ),);;
  }

  void _handleDevCoverTap(){
    print("DevCover tapped");
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new DeviceSetting(this.widget._camName)));
  }

}


