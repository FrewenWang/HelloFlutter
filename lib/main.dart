import 'package:demo/widgets/bottom_tab_navigator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// 应用的入口的Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter之旅',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomTabNavigator(),
    );
  }
}
