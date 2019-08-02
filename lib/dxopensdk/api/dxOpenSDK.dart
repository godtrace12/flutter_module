import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_module/dxopensdk/constant/dx_UrlConstants.dart';
import 'package:flutter_module/dxopensdk/constant/appConstant.dart';
import 'package:flutter_module/dxopensdk/constant/dx_HttpConstants.dart';
import 'package:flutter_module/dxopensdk/responsemodel/dx_base_rsp.dart';
import 'package:flutter_module/dxopensdk/responsemodel/dx_login_rsp.dart';
import 'package:flutter_module/dxopensdk/model/user_info.dart';

import 'dart:convert';

Map<String,dynamic> optHeader = {
  'accept-language':'zh-cn',
  'content-type':'application/plain'
};

class DXOpenSDK{
  static const String CHANNEL_DECODE = "com.hikvision.viop.hybrid.flutter/decode";
  static const platform = const MethodChannel(CHANNEL_DECODE);
  static const String METHOD_DECODE = "method_decode";
  String _sessionId;
  static DXOpenSDK _instance;
  static Dio dio;
  DXOpenSDK._(){
    dio = new Dio(BaseOptions(connectTimeout: 30000,headers: optHeader,baseUrl: AppConstant.HTTP_SERVER_URL));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
      client.badCertificateCallback = (X509Certificate cert,String host,int port){
        return true;
      };
    };
  }

  static DXOpenSDK getInstance(){
    if(_instance == null){
      _instance = DXOpenSDK._();
    }
    return _instance;
  }

  Future<DX_BaseRspModel<DX_LoginRspModel>> login(String userName, String password, String mac) async{
    Map<String, dynamic> queryParam = new Map();
    queryParam[DX_HttpConstants.DX_REQ_KEY_CLIENT_TYPE] = DX_HttpConstants.DX_REQ_VALUE_CLIENT_TYPE;
    queryParam[DX_HttpConstants.DX_REQ_KEY_VERSION] = DX_HttpConstants.DX_REQ_VALUE_VERSION;
    queryParam[DX_HttpConstants.DX_REQ_KEY_PASSWORD] = password;
    queryParam[DX_HttpConstants.DX_REQ_KEY_USERNAME] = userName;
    queryParam[DX_HttpConstants.DX_REQ_KEY_MAC] = mac;
    //原始请求返回
    DX_BaseRspModel<DX_LoginRspModel> rspModel;
    int status;
    String description;
    DX_LoginRspModel dataRsp;
    //异常里应该再加个捕获平台通道解码的异常
    try{
      Response oriResponse = await dio.get(DX_UrlConstants.DX_LOGIN,queryParameters:queryParam);
      String decodeRsp = await getDecodeResponse(oriResponse.data);
      print('flutter得到解密后：${decodeRsp}');
      Map<String,dynamic> rspJsonMap = json.decode(decodeRsp);
      status = int.parse(rspJsonMap[DX_BaseRspModel.STATUS] as String);
      description = rspJsonMap[DX_BaseRspModel.DESCRIPTION];
      dataRsp = DX_LoginRspModel.fromJson(rspJsonMap[DX_BaseRspModel.PARAMS] as Map<String,dynamic>);
    } on DioError catch(e){
      status = e.error;
      description = e.message;
      print('request:${e.request.data}');
    } on PlatformException catch(ep){
      description = "net 通过原生解密失败 errorMsg:'${ep.message}'";
    } catch (e){

    }finally{
      rspModel = new DX_BaseRspModel(status, description, dataRsp);
      //保存用户信息
      UserInfo.getInstance().loginInfo = dataRsp.loginInfo;
      UserInfo.getInstance().accountInfo = dataRsp.userInfo;
      _sessionId = dataRsp.loginInfo.sessionId;//保存session
    }
    return rspModel;
  }


  Future<String> loginTest(String userName, String password, String mac) async{
    String url = AppConstant.HTTP_SERVER_URL+DX_UrlConstants.DX_LOGIN;
    print("开始登录小微平台 +url="+url);
//    Dio dio = new Dio(BaseOptions(connectTimeout: 30000,headers: optHeader));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
      client.badCertificateCallback = (X509Certificate cert,String host,int port){
        return true;
      };
    };
    try{
      //方式1 get方式，结果成功
      Map<String, dynamic> queryParam = new Map();
      queryParam[DX_HttpConstants.DX_REQ_KEY_CLIENT_TYPE] = DX_HttpConstants.DX_REQ_VALUE_CLIENT_TYPE;
      queryParam[DX_HttpConstants.DX_REQ_KEY_VERSION] = DX_HttpConstants.DX_REQ_VALUE_VERSION;
      queryParam[DX_HttpConstants.DX_REQ_KEY_PASSWORD] = password;
      queryParam[DX_HttpConstants.DX_REQ_KEY_USERNAME] = userName;
      queryParam[DX_HttpConstants.DX_REQ_KEY_MAC] = mac;

      Response response = await dio.get(url,queryParameters:queryParam/*{DX_HttpConstants.DX_REQ_KEY_CLIENT_TYPE:DX_HttpConstants.DX_REQ_VALUE_CLIENT_TYPE,
      DX_HttpConstants.DX_REQ_KEY_VERSION:DX_HttpConstants.DX_REQ_VALUE_VERSION,
      DX_HttpConstants.DX_REQ_KEY_PASSWORD:password,
      DX_HttpConstants.DX_REQ_KEY_USERNAME:userName,
      DX_HttpConstants.DX_REQ_KEY_MAC:mac}*/);
      //方式2  post方式 formdata 失败
//    FormData formData = new FormData();
//    formData.add(DX_HttpConstants.DX_REQ_KEY_CLIENT_TYPE, DX_HttpConstants.DX_REQ_VALUE_CLIENT_TYPE);
//    formData.add(DX_HttpConstants.DX_REQ_KEY_VERSION, DX_HttpConstants.DX_REQ_VALUE_VERSION);
//    formData.add(DX_HttpConstants.DX_REQ_KEY_PASSWORD, password);
//    formData.add(DX_HttpConstants.DX_REQ_KEY_USERNAME, userName);
//    formData.add(DX_HttpConstants.DX_REQ_KEY_MAC, mac);
//      Response response = await dio.post(url,data:formData);
      //方式3 post方式
//      Response response = await dio.post(url,data:{DX_HttpConstants.DX_REQ_KEY_CLIENT_TYPE:DX_HttpConstants.DX_REQ_VALUE_CLIENT_TYPE,
//        DX_HttpConstants.DX_REQ_KEY_VERSION:DX_HttpConstants.DX_REQ_VALUE_VERSION,
//        DX_HttpConstants.DX_REQ_KEY_PASSWORD:password,
//        DX_HttpConstants.DX_REQ_KEY_USERNAME:userName,
//        DX_HttpConstants.DX_REQ_KEY_MAC:mac});
      print(response.data);
      String decodeRsp = await getDecodeResponse(response.data);

      //方法4 使用httpClient，依然是参数错误
//      HttpClient httpClient = new HttpClient();
//      httpClient.badCertificateCallback = (X509Certificate cert,String host,int port){
//        return true;
//      };
//      HttpClientRequest httpClientRequest = await httpClient.postUrl(Uri.parse(url));
//      httpClientRequest.headers.add('user-agent', '');
//      HttpClientResponse clientRsp = await httpClientRequest.close();
//      String clientRspTxt = await clientRsp.transform(utf8.decoder).join();
//      String clientDecode = await getDecodeResponse(clientRspTxt);
//      httpClient.close();

      print("回放报文解码后：${decodeRsp}");

    }on DioError catch(e){
      print('request:${e.request.data}');
      print("unknow exception msg:${e.message}");
    } catch(e){
      print("dx 网络异常$e");
    }finally{
      print("dx 网络finally");
    }
    return "登录成功";
  }

  Future<String> getDecodeResponse (dynamic oriResponse) async{
    print('net 进行原生解密');
    String decodeRsp = null;
    try{
      decodeRsp = await platform.invokeMethod(METHOD_DECODE,oriResponse);
    } on PlatformException catch(e){
      print("net 通过原生解密失败 errorMsg:'${e.message}'");
    }
    return decodeRsp;
  }

}