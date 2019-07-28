import 'package:flutter_module/zhihunews/bean/latestNewsModel.dart';
import 'package:flutter_module/zhihunews/bean/baseRspModel.dart';
import 'package:flutter_module/zhihunews/net/zhihuNetConstant.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'dart:io';

Map<String,dynamic> optHeader = {
  'accept-language':'zh-cn',
  'content-type':'application/json'
};

class GetLatestNewsModel {

  Future<BaseRspModel<LatestNewsModel>> getLatestNews(String date) async{
    String url;
    if(null == date){
      url = ZhihuNetConstant.baseUrl + ZhihuNetConstant.latest;
    }else{
      url = ZhihuNetConstant.baseUrl + ZhihuNetConstant.before + date;
    }
    Dio dio = new Dio(BaseOptions(connectTimeout: 30000,headers: optHeader));
    LatestNewsModel latestNews;
    List stories = null;
    List topStories = null;
    int code;
    String errorMsg;
    BaseRspModel<LatestNewsModel> rspModel;
    try{
      Response response =await dio.get(url);
      print(response.data);
      if(response.statusCode == HttpStatus.OK){
        code = 200;
        String date = response.data['date'];
        stories = response.data['stories'];
        topStories = response.data['top_stories'];
        List<StoryModel> storiesList = stories.map((model){
          return StoryModel.fromJson(model);
        }).toList();
        List<TopStoryModel> topStoriesList;
        if(topStories != null && topStories.isNotEmpty){
          topStoriesList = topStories.map((model){
            return new TopStoryModel.fromJson(model);
          }).toList();
        }
        latestNews = new LatestNewsModel(date, storiesList, topStoriesList);
      }else{
        errorMsg = '后台服务异常';
      }
    }catch(exception){
      print("网络异常");
      errorMsg ="网络出现异常";
    }finally{
      print("finally 啦");
      rspModel =new BaseRspModel(code, errorMsg, latestNews);
    }
    return rspModel;
  }
}