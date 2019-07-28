
class BaseRspModel<T>{
  int errorCode;
  String errorMsg;
  T data;

  BaseRspModel(this.errorCode, this.errorMsg, this.data);
}