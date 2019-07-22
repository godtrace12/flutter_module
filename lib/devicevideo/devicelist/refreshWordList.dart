import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'adapter/devListAdapter.dart';

class RefreshWordList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    print("dj refresh create");
    // TODO: implement createState
    return new RefreshwordListState();
  }

}


class RefreshwordListState extends State<RefreshWordList>{
  static const loadingTag ="##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState(){
    super.initState();
    print("dj refresh initState");
    _retrieveData();
  }
  
  @override
  Widget build(BuildContext context) {
  // 下拉刷新样式
    return new RefreshIndicator(
        child: new ListView.builder(itemBuilder: (context,index){
//          //表尾
          if(_words[index] == loadingTag) {
            if(_words.length -1 <15){
              // 不足100，继续获取数据
              _retrieveData();
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
          return DevListAdapter(_words[index]);
        },
        itemCount: _words.length),
        onRefresh: _onRrefresh);
  }


  void _retrieveData(){
    Future.delayed(Duration(seconds: 2)).then((e){
      //每次生成20单词，单词插入到最后一个单词到前面
      _words.insertAll(_words.length-1, generateWordPairs().take(5).map((e)=>e.asPascalCase).toList());

      setState(() {

      });
    });

  }

  Future<Null> _onRrefresh() async{
    await Future.delayed(Duration(seconds: 2),(){
      _words.clear();
      _words.add("##loading##");
      _words.insertAll(_words.length-1, generateWordPairs().take(5).map((e)=>e.asPascalCase).toList());
      setState(() {

      });
    });
  }



}

