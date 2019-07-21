import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'adapter/devListAdapter.dart';
import 'adapter/devRowAdapter.dart';

class NoSeprateWordList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new NoSeprateWordListInner();
  }

}

class NoSeprateWordListInner extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _INoSeprateWordListInnerState();
  }

}

class _INoSeprateWordListInnerState extends State<NoSeprateWordListInner>{
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
      return ListView.builder(
          itemBuilder: (BuildContext context,int index){
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
//          return new Row(
//            children: <Widget>[
//              new Container(
//                child: new Image(image: new AssetImage('assets/images/pic_hzw.jpeg'),
//                width: 100.0,
//                height: 70.0,
//                fit: BoxFit.cover,),
//                margin: EdgeInsets.all(10.0),
//              ),
//              new Expanded(child: new Column(
//                children: <Widget>[
//                  new Container(
//                    height: 70.0,
//                    child: new Text('这是一张非常漂亮的图片'),
//                  )
//                ],
//              ),
//              flex: 1,)
//            ],
//          );
          return new DevRowAdapter();
          });
  }

  void _retrieveData(){
    Future.delayed(Duration(seconds: 2)).then((e){
      //每次生成20单词，单词插入到最后一个单词到前面
      _words.insertAll(_words.length-1, generateWordPairs().take(20).map((e)=>e.asPascalCase).toList());

      setState(() {

      });
    });

  }

}

