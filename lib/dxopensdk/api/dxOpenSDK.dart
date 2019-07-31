import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_module/dxopensdk/constant/dx_UrlConstants.dart';
import 'package:flutter_module/dxopensdk/constant/appConstant.dart';
import 'package:flutter_module/dxopensdk/constant/dx_HttpConstants.dart';

Map<String,dynamic> optHeader = {
  'accept-language':'zh-cn',
  'content-type':'application/plain'
};

class DXOpenSDK{
  static const String CHANNEL_DECODE = "com.hikvision.viop.hybrid.flutter/decode";
  static const platform = const MethodChannel(CHANNEL_DECODE);
  static const String METHOD_DECODE = "method_decode";

  Future<String> login(String userName, String password, String mac) async{
    String url = AppConstant.HTTP_SERVER_URL+DX_UrlConstants.DX_LOGIN;
    print("开始登录小微平台 +url="+url);
    Dio dio = new Dio(BaseOptions(connectTimeout: 30000,headers: optHeader));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
      client.badCertificateCallback = (X509Certificate cert,String host,int port){
        return true;
      };
    };
    try{
      //方式1 get方式，结果成功
      Response response = await dio.get(url,queryParameters:{DX_HttpConstants.DX_REQ_KEY_CLIENT_TYPE:DX_HttpConstants.DX_REQ_VALUE_CLIENT_TYPE,
      DX_HttpConstants.DX_REQ_KEY_VERSION:DX_HttpConstants.DX_REQ_VALUE_VERSION,
      DX_HttpConstants.DX_REQ_KEY_PASSWORD:password,
      DX_HttpConstants.DX_REQ_KEY_USERNAME:userName,
      DX_HttpConstants.DX_REQ_KEY_MAC:mac});
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