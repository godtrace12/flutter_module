
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


  /** 小微定制获取云存储节点 */
  static final String DX_GET_CLOUD_NODE_LIST = "/mobile/user/getCloudNodeList.action";
}