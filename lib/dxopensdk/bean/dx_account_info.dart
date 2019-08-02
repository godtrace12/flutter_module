import 'package:json_annotation/json_annotation.dart';

part 'dx_account_info.g.dart';
@JsonSerializable()

class DX_AccountInfo{
  //消息推送，开启状态
  static final int PUSH_MSG_ON = 1;
  // 消息推送，关闭状态
  static final int PUSH_MSG_OFF = 0;

  // 消息推送提示音，开启状态
  static final int PUSH_RING_ON = 1;
  // 消息推送提示音，关闭状态
  static final int PUSH_RING_OFF = 0;

  // 密码状态:0首次/重置
  static final int PWD_STATUS_FIRST = 0;
  // 密码状态:1修改
  static final int PWD_STATUS_MOD = 1;

  //设备管理权限
  // 设备添加/删除
  static final String DEVICE_MANAGE_ADD_DEL = "DEVICE_MANAGE_ADD_DEL";
  // 工程用户-添加
  static final String DEVICE_MANAGE_ADD = "DEVICE_MANAGE_ADD";
  // 工程用户-删除
  static final String DEVICE_MANAGE_DEL = "DEVICE_MANAGE_DEL";

  // 设备划拨/取消
  static final String DEVICE_MANAGE_DISTRIBUTE = "DEVICE_MANAGE_DISTRIBUTE";
  // 设备启用/停用
  static final String DEVICE_MANAGE_START_STOP = "DEVICE_MANAGE_START_STOP";
  // 设备布防/撤防
  static final String DEVICE_MANAGE_DEFENCE = "DEVICE_MANAGE_DEFENCE";
  // 设备加密/解密
  static final String DEVICE_MANAGE_ENCRYPT = "DEVICE_MANAGE_ENCRYPT";
  // 设备修改名称
  static final String DEVICE_MANAGE_RENAME = "DEVICE_MANAGE_RENAME";
  // 设备抓取封面
  static final String DEVICE_MANAGE_GET_PICURL = "DEVICE_MANAGE_GET_PICURL";
  // 设备本地截图
  static final String DEVICE_MANAGE_SCREENSHOT = "DEVICE_MANAGE_SCREENSHOT";
  // 设备本地录像
  static final String DEVICE_MANAGE_RECORDING = "DEVICE_MANAGE_RECORDING";
  //设备功能权限
  // 设备封面设置
  static final String DEVICE_FUNCTION_COVER = "DEVICE_FUNCTION_COVER";
  // 报警声音设置
  static final String DEVICE_FUNCTION_ALARM_SOUND = "DEVICE_FUNCTION_ALARM_SOUND";
  // 移动侦测灵敏度设置
  static final String DEVICE_FUNCTION_ALG = "DEVICE_FUNCTION_ALG";
  // 设备全天录像设置
  static final String DEVICE_FUNCTION_RECORD = "DEVICE_FUNCTION_RECORD";
  // 摄像机指示灯设置
  static final String DEVICE_FUNCTION_LIGHT = "DEVICE_FUNCTION_LIGHT";
  // 声源定位设置
  static final String DEVICE_FUNCTION_SSL = "DEVICE_FUNCTION_SSL";
  // 摄像头遮蔽设置
  static final String DEVICE_FUNCTION_SCENE = "DEVICE_FUNCTION_SCENE";
  // 设备云台控制
  static final String DEVICE_FUNCTION_PTZ = "DEVICE_FUNCTION_PTZ";
  // 设备语音对讲
  static final String DEVICE_FUNCTION_TALK = "DEVICE_FUNCTION_TALK";
  // 设备报警
  static final String DEVICE_FUNCTION_ALARM = "DEVICE_FUNCTION_ALARM";
  // 历史录像回放
  static final String DEVICE_FUNCTION_PLAYBACK = "DEVICE_FUNCTION_PLAYBACK";
  // 视频预览
  static final String DEVICE_FUNCTION_PREVIEW = "DEVICE_FUNCTION_PREVIEW";


  // 账号ID
  int userId;

  // 账号名称
  String userName;

// 昵称
  String nickName;

  // 手机号
  String phoneNo;

  // 头像地址
  String userIcon;

  // 推送开关
  int pushMsg;

  // 推送提示音
  int pushRing;

  // 密码状态:0首次/重置，1修改
  int pwdStatus;

  // 用户权限数组
  List<String> opPrivilege;

  DX_AccountInfo(this.userId, this.userName, this.nickName, this.phoneNo,
      this.userIcon, this.pushMsg, this.pushRing, this.pwdStatus,
      this.opPrivilege);

  factory DX_AccountInfo.fromJson(Map<String, dynamic> json) => _$DX_AccountInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DX_AccountInfoToJson(this);

  // 用户设备权限:添加删除
  bool hasRightDeviceAddDel() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_MANAGE_ADD_DEL) == 0) {
          return true;
        }
      }
    }
    return false;
  }

  bool hasRightDeviceAdd(){
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_MANAGE_ADD) == 0) {
          return true;
        }
      }
    }
    return false;
  }

  bool hasRightDeviceDel(){
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_MANAGE_DEL) == 0) {
          return true;
        }
      }
    }
    return false;
  }


  // 用户设备权限:划拨取消
  bool hasRightDeviceDistribute() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_MANAGE_DISTRIBUTE) == 0) {
          return true;
        }
      }
    }
    return false;
  }


  // 用户设备权限:启用停用
  bool hasRightDeviceStartStop() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_MANAGE_START_STOP) == 0) {
          return true;
        }
      }
    }
    return false;
  }


  // 用户设备权限:布撤防
  bool hasRightDeviceDefence() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_MANAGE_DEFENCE) == 0) {
          return true;
        }
      }
    }
    return false;
  }

  // 用户设备权限:加解密
  bool hasRightDeviceEncrypt() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_MANAGE_ENCRYPT) == 0) {
          return true;
        }
      }
    }
    return false;
  }

  // 用户设备权限:修改名称
  bool hasRightDeviceRename() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_MANAGE_RENAME) == 0) {
          return true;
        }
      }
    }
    return false;
  }

  //用户设备权限:抓取封面
  bool hasRightDeviceGetPicture() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_MANAGE_GET_PICURL) == 0) {
          return true;
        }
      }
    }
    return false;
  }


  //【说明】：判断设备功能权限--设备封面设置
  bool hasRightFunctionCover() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_FUNCTION_COVER) == 0) {
          return true;
        }
      }
    }
    return false;
  }


  // 【说明】：判断设备功能权限--报警声音设置
  bool hasRightFunctionAlarmSound() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_FUNCTION_ALARM_SOUND) == 0) {
          return true;
        }
      }
    }
    return false;
  }

  //【说明】：判断设备功能权限--移动侦测灵敏度设置
  bool hasRightFunctionAlg() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_FUNCTION_ALG) == 0) {
          return true;
        }
      }
    }
    return false;
  }


  //【说明】：判断设备功能权限--设备全天录像设置
  bool hasRightFunctionRecord() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_FUNCTION_RECORD) == 0) {
          return true;
        }
      }
    }
    return false;
  }


  //【说明】：判断设备功能权限--摄像机指示灯设置
  bool hasRightFunctionLight() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_FUNCTION_LIGHT) == 0) {
          return true;
        }
      }
    }
    return false;
  }


  // 【说明】：判断设备功能权限--设备报警
  bool hasRightFunctionAlarm() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_FUNCTION_ALARM) == 0) {
          return true;
        }
      }
    }
    return false;
  }

  // 【说明】：判断设备功能权限--历史录像回放
  bool hasRightFunctionPlayback() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_FUNCTION_PLAYBACK) == 0) {
          return true;
        }
      }
    }
    return false;
  }


  // 【说明】：判断设备功能权限--视频预览
  bool hasRightFunctionPreview() {
    if (opPrivilege != null && opPrivilege.length > 0) {
      int size = opPrivilege.length;
      for (int i = 0; i < size; i++) {
        if (opPrivilege[i].compareTo(DEVICE_FUNCTION_PREVIEW) == 0) {
          return true;
        }
      }
    }
    return false;
  }

  // 【说明】：账号是否是第一次登录
  bool isFirstLogin() {
    if (pwdStatus == PWD_STATUS_FIRST) {
      return true;
    }
    return false;
  }

}