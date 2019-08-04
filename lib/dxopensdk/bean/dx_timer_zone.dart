import 'package:json_annotation/json_annotation.dart';
part 'dx_timer_zone.g.dart';
@JsonSerializable()

class DX_TimerZone {
  //起始时间，如00:00
  String timerStart;

 //结束时间，如n00:00（n代表第二天，但时间间隔不能超过24小时）
  String timerEnd;

  DX_TimerZone(this.timerStart, this.timerEnd);

  factory DX_TimerZone.fromJson(Map<String, dynamic> json) => _$DX_TimerZoneFromJson(json);
  Map<String, dynamic> toJson() => _$DX_TimerZoneToJson(this);
}