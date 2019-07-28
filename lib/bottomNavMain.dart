import 'package:flutter/material.dart';
import 'devicevideo/devicelist/infiniteWordList.dart';
import 'devicevideo/devicelist/container.dart';
import 'devicevideo/devicelist/noSeparateWordList.dart';
import 'devicevideo/devicelist/refreshWordList.dart';
import 'devicevideo/devicelist/refreshScrollWordList.dart';
import 'devicevideo/devicelist/refreshZhihuNewsList.dart';

class BottomNavMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BottomNavMainState();
  }

}

class MainItem{
  final String title;
  final IconData icon;
  final Widget widget;

  const MainItem({this.title, this.icon,this.widget});
}

class _BottomNavMainState extends State<BottomNavMain>{
  int _currentIndex = 0;
  List<MainItem> mainItems = <MainItem>[
    new MainItem(title: '视频',icon: Icons.directions_car,widget:new InfiniteWordList()),
    new MainItem(title: '消息', icon: Icons.directions_bike,widget:new RefreshWordList()),
    new MainItem(title: '工单', icon: Icons.directions_boat,widget:new RefreshScrollWordList()),
    new MainItem(title: '直播', icon: Icons.directions_bus,widget:new RefreshZhihuNewsList()),
    new MainItem(title: '个人中心', icon: Icons.directions_railway,widget:new ContainerDemo()),
  ];

  List<BottomNavigationBarItem> _navTabBars = [];
  List<Widget> _navTabViews =[];

  @override
  void initState(){
    super.initState();
    for(int i=0;i<mainItems.length;i++){
      _navTabBars.add(BottomNavigationBarItem(
          icon: Icon(mainItems[i].icon),
      title: Text(mainItems[i].title)));
      _navTabViews.add(mainItems[i].widget);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('${mainItems[_currentIndex].title}')),
      body: IndexedStack(
        index: _currentIndex,
        children: _navTabViews,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navTabBars,
        currentIndex: _currentIndex,
        onTap: _navItemTapped,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _navItemTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

}
