import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'adapter/devListAdapter.dart';

class InfiniteWordList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new InfiniteWordListInner();
  }

}

class InfiniteWordListInner extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _InfiniteWordListInnerState();
  }

}

class _InfiniteWordListInnerState extends State<InfiniteWordListInner>{
  static const loadingTag ="##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState(){
    super.initState();
    _retrieveData();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        itemCount:_words.length,
        itemBuilder: (context,index){
          //表尾
          if(_words[index] == loadingTag) {
            if(_words.length -1 <100){
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
          //显示material 的列表文本项
//          return ListTile(title: Text((_words[index])));
          //列表显示文本
//          return Text(_words[index],style: TextStyle(fontSize: 30),);
          // 显示设备列表适配器
          return DevListAdapter(_words[index]);

        },
        separatorBuilder: (context, index) => Divider(height: 1.0));
  }

  void _retrieveData(){
    Future.delayed(Duration(seconds: 2)).then((e){
      //每次生成20单词，单词插入到最后一个单词到前面
      _words.insertAll(_words.length-1, generateWordPairs().take(5).map((e)=>e.asPascalCase).toList());

      setState(() {

      });
    });

  }

}

