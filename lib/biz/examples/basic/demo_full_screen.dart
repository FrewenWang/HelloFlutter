import 'package:demo/widgets/bottom_tab_navigator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// 应用的入口的Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '全面屏测试Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
//        home: _safeAreaForFullScreen());
        home: MediaQueryForFullScreen());
  }

  /// 第一种方法
  ///要进行适配全面屏的时候，我们只需要将我们要显示的内容放在SafeArea就可以
  Widget _safeAreaForFullScreen() {
    return Container(
      decoration: BoxDecoration(color: Colors.orange),

      /// 我们要进行适配全面屏的时候，我们只需要将我们要显示的内容放在SafeArea就可以
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text("顶部"), Text("底部")],
        ),
      ),
    );
  }
}

/// 第二种方法：我们可以使用MediaQuery.of(context).padding来机型计算，
/// 预留出系统进行操作处理的上下间距的padding
class MediaQueryForFullScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Container(
      decoration: BoxDecoration(color: Colors.orange),
      padding: EdgeInsets.fromLTRB(0, padding.top, 0, padding.bottom),

      /// 我们要进行适配全面屏的时候，我们只需要将我们要显示的内容放在SafeArea就可以
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text("顶部"), Text("底部")],
        ),
      ),
    );
  }

  /// 第三种方法：
  ///适用Scaffold的appBar与bottomNavigationBar的页面，是不需要适配的，因为Scaffold的框架会自动帮我们进行全面屏的适配
}
