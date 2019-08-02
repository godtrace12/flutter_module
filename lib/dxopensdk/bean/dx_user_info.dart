import 'package:json_annotation/json_annotation.dart';

part 'dx_user_info.g.dart';
@JsonSerializable()

class DX_UserInfo{
  //用户ID
  int userId;

 //有昵称返回昵称，没有则返回用户名
  String userName;

  // 用户手机号
  String phoneNo;

  //用户头像URL
  String userIcon;

  // 是否是好友（true-是，false-不是）
  bool isFriend;

  DX_UserInfo(this.userId, this.userName, this.phoneNo, this.userIcon,
      this.isFriend);

  factory DX_UserInfo.fromJson(Map<String, dynamic> json) => _$DX_UserInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DX_UserInfoToJson(this);
}