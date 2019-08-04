import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_module/dxopensdk/bean/dx_camera_info.dart';
part 'dx_camera_list_rsp.g.dart';
@JsonSerializable()

class DX_CameraListRspModel{
  //监控点信息列表
  List<DX_CameraInfo> cameraList;

  DX_CameraListRspModel(this.cameraList);

  factory DX_CameraListRspModel.fromJson(Map<String, dynamic> json) => _$DX_CameraListRspModelFromJson(json);
  Map<String, dynamic> toJson() => _$DX_CameraListRspModelToJson(this);
}