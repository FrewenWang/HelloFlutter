import 'package:demo/pages/demo_basic_widgets.dart';
import 'package:demo/widgets/bottom_tab_navigator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// 应用的入口的Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NyxFlutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoBasicWidget(),
    );
  }
}
