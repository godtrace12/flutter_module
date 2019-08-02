import 'package:flutter_module/dxopensdk/bean/dx_account_info.dart';
import 'package:flutter_module/dxopensdk/bean/dx_login_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dx_login_rsp.g.dart';
@JsonSerializable()

class DX_LoginRspModel{

  //当前登录信息
  DX_LoginInfo loginInfo;

  //当前登录的账号信息
  DX_AccountInfo userInfo;

  DX_LoginRspModel(this.loginInfo, this.userInfo);

  factory DX_LoginRspModel.fromJson(Map<String, dynamic> json) => _$DX_LoginRspModelFromJson(json);
  Map<String, dynamic> toJson() => _$DX_LoginRspModelToJson(this);
}