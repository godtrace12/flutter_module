import 'package:json_annotation/json_annotation.dart';

class DX_BaseRspModel<T>{
  static final String STATUS = 'status';
  static final String DESCRIPTION = 'description';
  static final String PARAMS = 'params';
  //返回码
  int status;

  //返回信息
  String description;
  //返回参数
  T params;
  DX_BaseRspModel(this.status, this.description, this.params);
}