import 'package:flutter/material.dart';

class CommonSubItem extends StatelessWidget{
  static final double LEFT_MARGIN = 8.0;
  static final double TOP_MARGIN = 10.0;
  static final double BOTTOM_MARGIN = 10.0;
  static final double RIGHT_MARGIN = 10.0;

  String _itemName;
  void Function() _onItemTapped;
  CommonSubItem(this._itemName, this._onItemTapped);

  @override
  Widget build(BuildContext context) {
    //InkWell中子widget设置了颜色会导致水波点击效果无效
    return new Ink(
      color: Colors.white,
      child: new InkWell(
        child: new Container(
          padding: EdgeInsets.only(left: 8.0,top: 13.0,bottom: 13.0),
          child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(_itemName),
              new Expanded(
                flex: 1,
                child: new Text(""),
              ),
              new Container(
                padding: EdgeInsets.only(right: 8.0,left: 6.0),
                child: new Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
        onTap: _onItemTapped,
      ),
    );

  }



}