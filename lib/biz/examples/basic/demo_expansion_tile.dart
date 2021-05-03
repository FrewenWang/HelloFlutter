import 'package:flutter/material.dart';

// 数据集合
const ExpansionTileList = {
  "主标题一": ["子标题一", "子标题二", "子标题三", "子标题四", "子标题五"],
  "主标题二": ["子标题一", "子标题二", "子标题三", "子标题四", "子标题五"],
  "主标题三": ["子标题一", "子标题二", "子标题三", "子标题四", "子标题五"],
  "主标题四": ["子标题一", "子标题二", "子标题三", "子标题四", "子标题五"],
  "主标题五": ["子标题一", "子标题二", "子标题三", "子标题四", "子标题五"],
};

void main() => runApp(MyExpansionTileApp());

class MyExpansionTileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "MyExpansionTileApp",
      theme: new ThemeData.light(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

// 我们看可展列表的的构造函数
// const ExpansionTile({
// Key key,
// this.leading,                        //标题左侧要展示的Widget
// @required this.title,                // 必填项：标题
// this.subtitle,
// this.backgroundColor,                // 展开项的背景颜色
// this.onExpansionChanged,             // 列表展开收起的回调函数
// this.children = const <Widget>[],    // 列表展开的时候的显示的Widget
// this.trailing,                       // 标题侧要展示的Widget
// this.initiallyExpanded = false,      // 默认的展开状态
// this.maintainState = false,
// this.tilePadding,
// this.expandedCrossAxisAlignment,
// this.expandedAlignment,
// this.childrenPadding,
// })
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ExpansionTile"),
      ),
      body: new Center(
        child: new ListView(
          children: _buildListView(),
        ),
      ),
    );
  }

  List<Widget> _buildListView() {
    List<Widget> widgets = [];
    ExpansionTileList.forEach((key, value) {
      widgets.add(_item(key, ExpansionTileList[key]));
    });
    return widgets;
  }

  Widget _item(String title, List<String> subTitles) {
    return ExpansionTile(
      title: Text(title),
      leading: Icon(Icons.favorite, color: Colors.red),
      backgroundColor: Colors.grey,
      initiallyExpanded: false,
      children: subTitles.map((subTitle) => _buildSubTitles(subTitle)).toList(),
    );
  }
}

// Widget _buildSubTitles(String subTitle) {
//   return ListTile(
//       title: Text(subTitle),
//       leading: Icon(Icons.favorite_border, color: Colors.red));
// }

Widget _buildSubTitles(String subTitle) {
  return FractionallySizedBox(
      child: Container(
        height: 30,
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        margin: EdgeInsets.all(5),
        child: Text(
          subTitle,
          textAlign: TextAlign.center,
        ),
      ),
      widthFactor: 1);
}
