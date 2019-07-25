import 'package:flutter/material.dart';

enum VisibilityFlag {
  visible,
  invisible,
  offscreen,
  gone,
}

//3种隐藏flutter widget到方式
//1、（visible)显示
//2、（invisible)隐藏：
//这种隐藏是指在屏幕中占据空间，只是没有显示。这种情况出现场景如：用带有背景色的Container Widget去包含一个不可见的Image，当从网络中加载图片后才让它显示，这是为了避免图片显示后让页面布局改变发生跳动。
//3、（Offscreen)超出屏幕，同样占据空间
//4、（Gone)消失：
class VisibilityControl extends StatelessWidget{
  VisibilityFlag _visibilityFlag = VisibilityFlag.visible;
  Widget _child;
  Widget _removeChild;

  VisibilityControl(this._visibilityFlag, this._child):this._removeChild = Container();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(_visibilityFlag == VisibilityFlag.visible){
      return _child;
    }else if(_visibilityFlag == VisibilityFlag.invisible){
      return new IgnorePointer(
        ignoring: true,
        child: new Opacity(opacity: 0.0,child: _child,),
      );
    }else if(_visibilityFlag == VisibilityFlag.offscreen){
      return new Offstage(
        offstage: true,
        child: _child,
      );
    }else{  //gone的情况
      return _removeChild;
    }
  }

}