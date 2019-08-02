import 'package:json_annotation/json_annotation.dart';

part 'dx_login_info.g.dart';
@JsonSerializable()

class DX_LoginInfo{
  // 隐藏直播模块
  static final String LIVE_MODULE_CONFIG_NO = "0";
  // 显示直播模块
  static const String LIVE_MODULE_CONFIG_YES = "1";

  //会话ID
  String sessionId;

 //访问令牌，用来和萤石交互
  String accessToken;

  // sessionID有效时间，单位：分钟
  int lifeTime;

  // 应用版本类型（0-企业版，1-个人版，2-工程版）
  int appType;

  // 直播模块配置（0-隐藏，1-显示）
  String liveModuleConfig;

  // 登录用户的appkey( 此字段不是登录接口返回，是getAppKey接口拿到后，保存在此处，便于将appkey、accesToken放在同一个地方)
  String appKey;

  //【说明】：判断直播模块是否显示
  bool isLiveModuleShow() {
    if(LIVE_MODULE_CONFIG_YES.compareTo(liveModuleConfig) == 0){
      return true;
    }
    return false;
  }

  DX_LoginInfo(this.sessionId, this.accessToken, this.lifeTime, this.appType,
      this.liveModuleConfig, this.appKey);

  factory DX_LoginInfo.fromJson(Map<String, dynamic> json) => _$DX_LoginInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DX_LoginInfoToJson(this);

}