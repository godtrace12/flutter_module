
class DX_UrlConstants {
  //2个人中心接口(user)----------------------------------------------------------------------------
  /** 2.1获取注册短信验证码 */
  static const String DX_GET_REGISTER_SMS = "/mobile/user/getRegisterSms.action";
  /** 2.2校验注册短信 */
  static const String DX_CHECK_REGISTER_SMS = "/mobile/user/checkRegisterSms.action";
  /** 2.2用户注册 */
  static const String DX_REGISTER = "/mobile/user/register.action";
  /** 2.3用户登录 */
  static const String DX_LOGIN = "/mobile/user/login.action";
  /** 2.4登出，注销 */
  static const String DX_LOGOUT = "/mobile/user/logout.action";

  // 3.9根据用户获取设备列表
  static final String DX_GET_CAMERA_LIST = "/mobile/camera/getCameraList.action";
  //** 3.10根据序列号和通道号获取单个监控点
  static final String DX_GET_CAMERA_BY_SN = "/mobile/camera/getCameraBySn.action";
  //** 3.11根据分组ID获取设备列表
  static final String DX_GET_CAMERA_LIST_BY_GROUP = "/mobile/camera/getCameraListByGroup.action";
  //** 3.12根据ID获取单个设备
  static final String DX_GET_CAMERA = "/mobile/camera/getCamera.action";


  //** 小微定制获取云存储节点
  static final String DX_GET_CLOUD_NODE_LIST = "/mobile/user/getCloudNodeList.action";
}