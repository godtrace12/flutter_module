import 'package:flutter/material.dart';
import 'package:flutter_module/devicevideo/deviceset/deviceSetting.dart';

class DevStateListAdapter extends StatelessWidget{
  String _camName;
  DevStateListAdapter(this._camName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Color.fromRGBO(3, 54, 255, 1.0),
          border: Border.all(
              color: Colors.grey
          ),
          borderRadius: BorderRadius.circular(2.0),
          boxShadow: [BoxShadow(
            color: Colors.black54,
            offset: Offset(3.0, 3.0),
            blurRadius: 1.0,
          )]
      ),
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
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 6.0,top: 6.0,bottom: 6.0,right: 4.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text(_canName,style: TextStyle(fontSize: 12),),
          new Expanded(
            flex: 1,
            child: new Text(""),
          ),
          new Icon(Icons.more_horiz)
        ],
      ),
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
    return new Container(
      height: 160.0,
      color: Colors.amber,
      child: new Stack(
        alignment: AlignmentDirectional.topEnd,
        fit: StackFit.expand,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          new GestureDetector(
            child: new Image(image: new AssetImage('assets/images/main_alarm.png'),fit: BoxFit.fitHeight,),
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


