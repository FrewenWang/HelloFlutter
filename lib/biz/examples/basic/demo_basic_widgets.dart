import 'package:flutter/material.dart';

void main() => runApp(DemoBasicWidgetApp());

class DemoBasicWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "MyExpansionTileApp",
      theme: new ThemeData.light(),
      home: DemoBasicWidget(),
    );
  }
}

class DemoBasicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter基础组件"),
      ),

      /// 我们这里学习使用GridView
      /// https://book.flutterchina.club/chapter6/gridview.html
      body: GridView.builder(
          itemCount: BaseWidgets.length,
          padding: EdgeInsets.all(2),

          /// SliverGridDelegateWithFixedCrossAxisCount
          /// 该子类实现了一个横轴为固定数量子元素的layout算法
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            ///横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
            crossAxisCount: 2,

            /// 横轴方向子元素的间距。
            crossAxisSpacing: 5,

            /// 主轴方向的间距。
            mainAxisSpacing: 16,

            /// 子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            return FlatButton(
                onPressed: null,
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: COLORS[index % COLORS.length],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                BaseWidgets[index].title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              BaseWidgets[index].description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ])));
          }),
    );
  }
}

class BaseWidgetsItem {
  /// 标题
  final String title;

  /// 描述
  final String description;

  const BaseWidgetsItem({
    this.title,
    this.description,
  });
}

const BaseWidgets = [
  BaseWidgetsItem(
    title: '基础组件',
    description: '容器、行、列、文字、图片、图标等最常用组件，是构成界面的基础',
  ),
  BaseWidgetsItem(
    title: 'ListView组件',
    description: '滚动型容器列表组件，支持下拉刷新，上拉加载等交互操作',
  ),
  BaseWidgetsItem(
    title: 'GridView组件',
    description: '网格布局，支持自定义每行显示的列数以及每一格的宽高比例',
  ),
  BaseWidgetsItem(
    title: '自定义Icon图标',
    description: '下载ttf字体文件，fonts声明，根据unicode码对照生成语义的图标类型',
  ),
  BaseWidgetsItem(
    title: 'Sliver系列组件',
    description: '自定义高级滚动组件，float、snap、pinned效果任你组合',
  ),
  BaseWidgetsItem(
    title: 'ExpansionTile组件',
    description: '自定义高级滚动组件，float、snap、pinned效果任你组合',
  ),
  BaseWidgetsItem(
    title: 'FlexLayout',
    description: '自定义高级滚动组件，float、snap、pinned效果任你组合',
  ),
  BaseWidgetsItem(
    title: 'FlexLayout',
    description: '自定义高级滚动组件，float、snap、pinned效果任你组合',
  ),
  BaseWidgetsItem(
    title: 'FlexLayout',
    description: '自定义高级滚动组件，float、snap、pinned效果任你组合',
  ),
  BaseWidgetsItem(
    title: 'FlexLayout',
    description: '自定义高级滚动组件，float、snap、pinned效果任你组合',
  ),
  BaseWidgetsItem(
    title: 'FlexLayout',
    description: '自定义高级滚动组件，float、snap、pinned效果任你组合',
  ),
  BaseWidgetsItem(
    title: 'FlexLayout',
    description: '自定义高级滚动组件，float、snap、pinned效果任你组合',
  ),
];

/// 颜色
const List<Color> COLORS = [
  Color(0xFFFF4777),
  Color(0xFFCA6924),
  Color(0xFF00BC12),
  Color(0xFF725E82),
  Color(0xFFFFA400),
  Color(0xFFDD7160),
  Color(0xFF5D513C),
  Color(0xFFD180D2),
];
