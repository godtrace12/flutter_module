import 'package:json_annotation/json_annotation.dart';
import 'dx_timer_zone.dart';
part 'dx_camera_privilege.g.dart';
@JsonSerializable()

class DX_CameraPrivilege {
  //功能权限（第一位-视频预览，第二位-录像回放，第三位-报警接收，第四位-语音对讲，第五位-云台控制。0为不开放，1为开放该功能），默认为预览（1,0,0,0,0）
  String permission;

//周一至周日时间段（0-周一，1-周二，2-周三，3-周四，4-周五，5-周六，6-周日），默认为全时段（0,1,2,3,4,5,6）
  String timerPeriod;

  //每天的时间段列表（默认为全时段）
  List<DX_TimerZone> timerZone;

  DX_CameraPrivilege(this.permission, this.timerPeriod,
      this.timerZone);

  factory DX_CameraPrivilege.fromJson(Map<String, dynamic> json) => _$DX_CameraPrivilegeFromJson(json);
  Map<String, dynamic> toJson() => _$DX_CameraPrivilegeToJson(this);
}