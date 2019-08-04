import 'package:flutter/material.dart';
import 'package:flutter_module/dxopensdk/api/dxOpenSDK.dart';
import 'package:flutter_module/dxopensdk/responsemodel/dx_base_rsp.dart';
import 'package:flutter_module/dxopensdk/responsemodel/dx_login_rsp.dart';
import 'package:flutter_module/dxopensdk/model/user_info.dart';
import 'package:flutter_module/dxopensdk/responsemodel/dx_camera_list_rsp.dart';


class LoginWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('登录'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: new Text('login'),
                color: Colors.blue,
                onPressed: _onLoginTapped),
            RaisedButton(
                child: new Text('camera list'),
                color: Colors.blue,
                onPressed: _onGetCamListTapped)
          ],
        ),
      ),
    );
  }

  void _onLoginTapped() async{
    DXOpenSDK dxOpenSDK = DXOpenSDK.getInstance();
    DX_BaseRspModel<DX_LoginRspModel> rspModel =await dxOpenSDK.login('Test', 'uR4Edof6Htc8TrX7r1w4+8E5uDHh5suF4x4Dih5mduY', 'iz2YhqiupsFiXs3Ek');
    print("正式接口登录用户名：${rspModel.params.userInfo.userName}");
    print("sessionId=${UserInfo.getInstance().loginInfo.sessionId}");
  }

  void _onGetCamListTapped() async{
    DXOpenSDK dxOpenSDK = DXOpenSDK.getInstance();
    DX_BaseRspModel<DX_CameraListRspModel> rspModel =await dxOpenSDK.getCameraList();
    print("获取到的监控点:${rspModel.params.cameraList[0].cameraName}");
  }

}