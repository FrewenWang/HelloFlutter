import 'package:demo/widgets/bottom_tab_navigator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// 应用的入口的Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Expanded测试',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DemoExpandedPage());
  }
}

/// Expanded是用于展开Row，Column或Flex的子child的Widget。
/// 使用Expanded可以使[Row]，[Column]或[Flex]的子项扩展以填充主轴中的可用空间（例如，水平用[Row]或垂直用[Column]）。
/// 如果扩展了多个子节点，则根据[flex]因子将可用空间划分为多个子节点。
class DemoExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded测试Demo')),
      body: Row(children: <Widget>[
        //作为Row的子组件的包装组件 根据flex系数，分配Row组件的剩余空间
        Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                /// 圆角弧度
                borderRadius: BorderRadius.circular(20),
                /// 渐变矩形
                gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
              ),
            ))
      ]),
    );
  }
}
