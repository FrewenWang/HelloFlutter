import 'package:demo/pages/demo_basic_widgets.dart';
import 'package:demo/widgets/bottom_tab_navigator.dart';
import 'package:flutter/material.dart';

/// Flutter 的入口函数
void main() => runApp(MyApp());

/// 应用的入口的Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 返回的是一个材料设计的APP独享
    return MaterialApp(
      title: 'NyxFlutter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BottomTabNavigator(),
    );
  }
}
