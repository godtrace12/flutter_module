import 'package:flutter/material.dart';
import 'devicevideo/devicelist/infiniteWordList.dart';
import 'devicevideo/devicelist/container.dart';
import 'devicevideo/devicelist/noSeparateWordList.dart';
import 'devicevideo/devicelist/refreshWordList.dart';

class TabMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TabMainState();
  }
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Scaffold(
//      appBar: new AppBar(title: new Text("this is tabMain")),
//      body: new Center(
////        new TabController(mainItems.length, vsync: null);
////        new DefaultTabController(mainItems.length,new TabBar(
////          isScrollable: true,
////          tabs: <Widget>[]));
//      ),
//    );
//  }
}

class _TabMainState extends State<TabMain> with SingleTickerProviderStateMixin{
  TabController mController;

  @override
  void initState(){
    super.initState();
    mController = TabController(length: mainItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("tab test")),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TabBarView(
                controller: mController,
                children: mainItems
                    .map((MainItem item) {
                      return item.widget;
                }
//                    Container(child: Center(child: Text(item.title)))
//                    item.widget
                )
                    .toList()
            ),
          ),
          TabBar(
            controller: mController,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.blue,
            tabs:mainItems.map((MainItem choice) {
              return new Tab(
                text: choice.title,
                icon: new Icon(choice.icon),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class MainItem{
  final String title;
  final IconData icon;
  final Widget widget;

  const MainItem({this.title, this.icon,this.widget});
}

 List<MainItem> mainItems = <MainItem>[
  new MainItem(title: '视频',icon: Icons.directions_car,widget:new InfiniteWordList()),
  new MainItem(title: '消息', icon: Icons.directions_bike,widget:new RefreshWordList()),
  new MainItem(title: '工单', icon: Icons.directions_boat,widget:new ContainerDemo()),
  new MainItem(title: '直播', icon: Icons.directions_bus,widget:new ContainerDemo()),
  new MainItem(title: '个人中心', icon: Icons.directions_railway,widget:new ContainerDemo()),
];

class MainItemWidget extends StatelessWidget {
  final MainItem item;

  const MainItemWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(item.icon, size: 128.0, color: textStyle.color),
            new Text(item.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
