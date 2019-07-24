import 'package:flutter/material.dart';
import 'commonSubItem.dart';

class CommonSubItemDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 1.0,
      padding: EdgeInsets.only(left: CommonSubItem.LEFT_MARGIN),
      color: Colors.white,
      child: new Container(
        color: Colors.grey,
      ),
    );
  }

}