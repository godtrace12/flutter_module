import 'package:flutter/material.dart';

class DeviceSetting extends StatelessWidget{
  String _camName;
  DeviceSetting(this._camName);

  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Scaffold(
      appBar: AppBar(title: Text("设备设置")),
      body: Center(
        child: ListView(

        ),
      ),
    );
  }

}