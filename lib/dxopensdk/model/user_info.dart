import 'package:flutter_module/dxopensdk/bean/dx_login_info.dart';
import 'package:flutter_module/dxopensdk/bean/dx_account_info.dart';

class UserInfo{
  static UserInfo _instance;
  DX_AccountInfo _accountInfo;
  DX_LoginInfo _loginInfo;

  UserInfo._(){

  }

  static UserInfo getInstance(){
    if(_instance == null) {
      _instance = UserInfo._();
    }
    return _instance;
  }

  DX_LoginInfo get loginInfo => _loginInfo;

  set loginInfo(DX_LoginInfo value) {
    _loginInfo = value;
  }

  DX_AccountInfo get accountInfo => _accountInfo;

  set accountInfo(DX_AccountInfo value) {
    _accountInfo = value;
  }

}