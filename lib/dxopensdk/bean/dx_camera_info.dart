import 'dx_camera_privilege.dart';

class DX_CameraInfo{
  // 撤防
  static final int DEFENCE_NO = 0;
  // 布防
  static final int DEFENCE_YES = 1;
  // A1设备：睡眠
  static final int DEFENCE_SLEEP = 0;
  // A1设备：在家
  static final int DEFENCE_HOME = 8;
  // A1设备：外出
  static final int DEFENCE_OUT = 16;
  // 不加密
  static final int ENCRYPT_NO = 0;
  // 加密
  static final int ENCRYPT_YES = 1;
  // 离线
  static final int ONLINE_NO = 0;
  // 在线
  static final int ONLINE_YES = 1;
  // 上级停用
  static final int STATUS_SUPER_DISABLE = -1;
  // 停用
  static final int STATUS_DISABLE = 0;
  // 启用
  static final int STATUS_ENABLE = 1;
  // 未分享
  static final int SHARED_NO = 0;
  // 已分享
  static final int SHARED_YES = 1;
  // 已接受
  static final int SHARED_ACCEPT = 2;
  // 清晰度--流畅
  static final int VIDEO_LEVEL_FLUENCY = 0;
  // 清晰度--均衡
  static final int VIDEO_LEVEL_BALANCE = 1;
  // 清晰度--高清
  static final int VIDEO_LEVEL_HIGH = 2;
  // 一键托管
  static final int TRUST_CAMERA_YES = 1;
  // 取消托管
  static final int TRUST_CAMERA_NO = 0;

  // 设备类型--监控点
  static final String MODEL_CAMERA = "CAMERA";
  // 设备类型--报警设备
  static final String MODEL_ALARM = "ALARM";

  // 客流设备
  static final int PASSENGER_YES = 1;
  // 不是客流设备
  static final int PASSENGER_NO = 0;

  // 客流状态--关闭
  static final int FLOW_STATUS_OFF = 0;
  // 客流状态--开启
  static final int FLOW_STATUS_ON = 1;

  // 提醒声音类型--报警音
  static final int SOUND_MODE_ALARM = 1;
  // 提醒声音类型--提示音
  static final int SOUND_MODE_REMIND = 0;
  // 提醒声音类型--静音
  static final int SOUND_MODE_MUTE = 2;

  // 收藏--是
  static final int FAVORITE_NO = 0;
  // 收藏--否
  static final int FAVORITE_YES = 1;

  // 设备是否有更新固件 -- 有
  static final int IS_VERSION_HAS_NEW_YES = 1;
  // 设备是否有更新固件  无
  static final int IS_VERSION_HAS_NEW_NO = 0;
  // 设备是否在升级 -- 有
  static final int IS_ON_UPGRADE_YES = 1;
  // 设备是否在升级  无
  static final int IS_ON_UPGRADE_NO = 0;

  //布撤防状态（0-撤防，1-布防）
  int defence;

  // 加密状态（0-不加密，1-加密）
  int isEncrypt;

  // 在线状态（0-不在线，1-在线）
  int onlineStatus;

  // 监控点名称
  String cameraName;

  // 萤石监控点ID
  String ysCameraId;

  // 通道号
  int chanNum;

  // 监控点ID
  int cameraId;

  // 封面地址
  String picUrl;

  // 分组ID，为空为默认分组
  int groupId;

  // 设备序列号
  String deviceSerial;

  // 清晰度（0-流畅，1-均衡，2-高清）
  int videoLevel;

  // 启用状态（0-停用，1-启用，-1-上级停用）
  int status;

  // 分享状态（0-未分享，1-已分享，2-已接受）
  int isShared;

  // 来自好友
  String fromFriend;

  // 时间功能权限控制
  DX_CameraPrivilege privilege;

  // 设备类型(MODEL_CAMERA-监控点，MODEL_ALARM-报警设备)
  String model;

  // 是否一键托管， 0不托管， 1托管
  int isTrust;

  // 划拨设备的到期时间
  String expireTime;

  // 客流状态（0-关闭，1-开启）
  int flowstatus;

  // 是否客流设备（0-不是，1-是）
  int ispassenger;

  // 提醒声音类型
  int alarmSoundMode;
}