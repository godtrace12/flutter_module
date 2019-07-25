import 'package:flutter/material.dart';
import 'package:flutter_module/widget/commonSubItem.dart';
import 'package:flutter_module/widget/commonSubItemDivider.dart';
import 'package:flutter_module/widget/visibilityControl.dart';

class DeviceSetting extends StatelessWidget{
  String _camName;
  DeviceSetting(this._camName);

  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    VisibilityFlag isShowGuestFlow = _camName.contains('5') ? VisibilityFlag.gone : VisibilityFlag.visible;
    return Scaffold(
      appBar: AppBar(title: Text("设备设置")),
      body: Center(
        child:
        Container(
          color: Theme.of(context).backgroundColor,
          child: ListView(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(top: 20.0),
                child: new NameSerialArea(_camName),
              ),
              new Container(
                padding: EdgeInsets.only(top: 20.0),
                child: new ActiveDetectArea(),
              ),
              new Container(
                padding: EdgeInsets.only(top: 20.0),
                child: new CommonSubItem('云存储',_onCloudStorageTapped ),
              ),
              new Container(
                padding: EdgeInsets.only(top: 20.0),
                child: new CommonSubItem('存储状态',_onCloudStorageTapped ),
              ),
              new CommonSubItemDivider(),
              new CommonSubItem('设备版本', _onCloudStorageTapped),
              //控制widget是否显示，如果名称包含'5'，则不显示
              new VisibilityControl(isShowGuestFlow, new Container(
                padding: EdgeInsets.only(top: 20.0),
                child: new CommonSubItem('客流统计设置', _onCloudStorageTapped),
              ))
            ],
          ),
        )

      ),
    );
  }

  void _onCloudStorageTapped(){
    print("点击在云存储上");
  }

}

class NameSerialArea extends StatelessWidget{
  String _camName;
  NameSerialArea(this._camName);
  @override
  Widget build(BuildContext context) {
    return new Ink(
      color: Colors.white,
      child: new InkWell(
        child: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(left: 8.0,right: 8.0),
                height: 60.0,
                width: 60.0,
                child: new Image(image: new AssetImage('assets/images/main_alarm.png')),
              ),
              new Expanded(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_camName),
                      Text("这是序列号")
                    ],
                  )),
              new Container(
                padding: EdgeInsets.only(right: 8.0),
                child: new Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
        onTap: _onDevNameTapped,
      ),
    );
  }

  void _onDevNameTapped(){
    print("点击在设备名称上");
  }

}


class ActiveDetectArea extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 8.0,top: 13.0,bottom: 13.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text("活动检测"),
          new Expanded(
            flex: 1,
            child: new Text(""),
          ),
          new Text("开启"),
          new Container(
            padding: EdgeInsets.only(right: 8.0,left: 6.0),
            child: new Icon(Icons.keyboard_arrow_right),
          ),
        ],
      ),
    );
  }

}