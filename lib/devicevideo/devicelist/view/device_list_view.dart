import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_module/zhihunews/model/getLatestNewsModel.dart';
import 'package:flutter_module/util/dateUtil.dart';
import 'package:flutter_module/zhihunews/bean/latestNewsModel.dart';
import 'package:flutter_module/zhihunews/bean/baseRspModel.dart';
import 'package:flutter_module/zhihunews/bean/latestNewsSerialWholeModel.dart';
import 'package:flutter_module/dxopensdk/responsemodel/dx_camera_list_rsp.dart';
import 'package:flutter_module/dxopensdk/bean/dx_camera_info.dart';
import 'package:flutter_module/devicevideo/devicelist/adapter/zhihuNewsListAdapter.dart';
import 'package:flutter_module/dxopensdk/responsemodel/dx_camera_list_rsp.dart';
import 'package:flutter_module/dxopensdk/api/dxOpenSDK.dart';
import 'package:flutter_module/dxopensdk/responsemodel/dx_base_rsp.dart';
import 'package:flutter_module/dxopensdk/responsemodel/dx_login_rsp.dart';
import 'package:flutter_module/devicevideo/devicelist/adapter/device_list_cam_adapter.dart';
//下拉刷新，上拉加载更多列表
class DeviceListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    print("dj refresh create");
    return new DeviceListViewState();
  }

}


class DeviceListViewState extends State<DeviceListView>{
  var _words = <String>[];
  ScrollController _scrollController = ScrollController();
  bool isFirstTime = true;
  GetLatestNewsModel _getLatestNewsModel = new GetLatestNewsModel();
  LatestNewsModel _latestNewsModel;
  //消息列表
  List<StoryModel> _storyList = new List();
  DateTime _curDateTime = null;

  //获取监控点列表
  List<DX_CameraInfo> _cameraList = new List();


  @override
  void initState(){
    super.initState();
    print("dj refresh initState");
    if(isFirstTime){
//      _retrieveZhihuNews();
//      _retrieveZhihuNewsWholeSerial();//获取自动json序列化的信息
      _getDeviceList();
    }
    //列表滑动到末尾，并且长度还不足15时去加载更多
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent
        && _cameraList.length <10){
        print("滑动到了底部，准备加载更多");
//        _retrieveZhihuNews();
        _getDeviceList();
      }
    });
  }

  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
  // 下拉刷新样式
    return new RefreshIndicator(
        child: new ListView.builder(
            controller: _scrollController,
            itemBuilder: (context,index){
//          //表尾
          if(index == _cameraList.length) {
            if(_cameraList.length <10){
              // 不足100，继续获取数据
              //加载显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)),
              );
            }else{
              return Container(alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text("没有更多了",style: TextStyle(color: Colors.grey),),);
            }
          }
          // 显示设备列表适配器
//          return ZhihuNewsListAdapter(_storyList[index]);
          return DeviceListCamAdapter(_cameraList[index]);

            },
//            长度为实际数据长度加1，这个1用来显示上拉加载中或没有更多
        itemCount: _cameraList.length+1),
        onRefresh: _onRreshZhihuNews);
  }




  Future<Null> _onRreshZhihuNews() async{
    print("_onRreshZhihuNews 开始刷新知乎消息！");
    _curDateTime = new DateTime.now();
    String curDateStr = DateUtil.formatDateSimple(_curDateTime);
    BaseRspModel<LatestNewsModel> baseRspModel = await _getLatestNewsModel.getLatestNews(curDateStr);  //拿到future的值
    print("dj 加载完成知乎消息");
    _latestNewsModel = baseRspModel.data;
    _storyList.clear();
    _storyList.addAll(_latestNewsModel.stories); //增加所有story列表
    print(_latestNewsModel.stories[0].title);
    print('storty length=${_latestNewsModel.stories.length}');
    setState(() {

    });
  }

  void _retrieveZhihuNews() async{
    print("_retrieveZhihuNews 开始加载知乎消息！");
    if(_curDateTime == null){
      _curDateTime = new DateTime.now();
      print("使用的当前时间");
    }else{
      _curDateTime = _curDateTime.add(new Duration(days: -1));
      print('使用减去后的时间');
    }
    String curDateStr = DateUtil.formatDateSimple(_curDateTime);
    print('获取时间---'+curDateStr);
    BaseRspModel<LatestNewsModel> baseRspModel = await _getLatestNewsModel.getLatestNews(curDateStr);  //拿到future的值
    print("dj 加载完成知乎消息");
    _latestNewsModel = baseRspModel.data;
    _storyList.addAll(_latestNewsModel.stories);
    print(_latestNewsModel.stories[0].title);
//    print(_latestNewsModel.topStories[0].title);
    print('storty length=${_latestNewsModel.stories.length}');
    setState(() {

    });
  }

  void _retrieveZhihuNewsWholeSerial() async{
    print("_retrieveZhihuNewsWholeSerial 开始加载知乎消息！");
    if(_curDateTime == null){
      _curDateTime = new DateTime.now();
      print("使用的当前时间");
    }else{
      _curDateTime = _curDateTime.add(new Duration(days: -1));
      print('使用减去后的时间');
    }
    String curDateStr = DateUtil.formatDateSimple(_curDateTime);
    print('获取时间---'+curDateStr);
    BaseRspModel<LatestNewsSerialWholeModel> baseRspModel = await _getLatestNewsModel.getLatestNewsWholeSerial(curDateStr);  //拿到future的值
    print("dj 加载完成知乎消息");
    LatestNewsSerialWholeModel latestNewsSerialWholeModel = baseRspModel.data;
    print(latestNewsSerialWholeModel.stories[0].title);
    print('storty length=${latestNewsSerialWholeModel.stories.length}');
    setState(() {

    });
  }

  void _getDeviceList() async{
    _storyList.clear();
    DXOpenSDK dxOpenSDK = DXOpenSDK.getInstance();
    DX_BaseRspModel<DX_CameraListRspModel> rspModel =await dxOpenSDK.getCameraList();
    print("获取到的监控点:${rspModel.params.cameraList[0].cameraName}");
    _cameraList = rspModel.params.cameraList;
    setState(() {

    });
  }



}

