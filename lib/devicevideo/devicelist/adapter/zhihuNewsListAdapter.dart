import 'package:flutter/material.dart';
import 'package:flutter_module/devicevideo/deviceset/deviceSetting.dart';
import 'package:flutter_module/zhihunews/bean/latestNewsModel.dart';
class ZhihuNewsListAdapter extends StatelessWidget{
  StoryModel _storyModel;

  ZhihuNewsListAdapter(this._storyModel);


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
          new TitleArea(_storyModel),
          new DevCoverArea(_storyModel)
        ],
      ),
    );
  }

}


class TitleArea extends StatelessWidget{
  StoryModel _storyModel;

  TitleArea(this._storyModel);

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 6.0,top: 6.0,bottom: 6.0,right: 4.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Text(_storyModel.title,style: TextStyle(fontSize: 12),),
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
  StoryModel _storyModel;

  DevCoverArea(this._storyModel);
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
      child: new Stack(
        alignment: AlignmentDirectional.topEnd,
        fit: StackFit.expand,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          new GestureDetector(
//            child: new Image.network(this.widget._storyModel.images[0],fit: BoxFit.cover,),
            child: new FadeInImage.assetNetwork(
                placeholder: 'assets/images/pic_hzw.jpeg',
                image: this.widget._storyModel.images[0],
                fit: BoxFit.fill,
            ),
            onTap: _handleDevCoverTap,
          ),
          new Positioned(top: 16.0,right:6.0,child: new Icon(Icons.accessibility))
//        new Icon(Icons.accessibility)
        ],
      ),);
  }

  void _handleDevCoverTap(){
    print("DevCover tapped");
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new DeviceSetting(this.widget._storyModel.title)));
  }

}


