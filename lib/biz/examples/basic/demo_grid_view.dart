import 'package:flutter/material.dart';

/// 学习使用网格布局
/// 文章参考：https://book.flutterchina.club/chapter6/gridview.html
/// GridView可以构建一个二维网格列表，其默认构造函数定义如下：
/// GridView({
//   Axis scrollDirection = Axis.vertical,
//   bool reverse = false,
//   ScrollController controller,
//   bool primary,
//   ScrollPhysics physics,
//   bool shrinkWrap = false,
//   EdgeInsetsGeometry padding,
//   @required SliverGridDelegate gridDelegate,   //控制子widget layout的委托
//   bool addAutomaticKeepAlives = true,
//   bool addRepaintBoundaries = true,
//   double cacheExtent,
//   List<Widget> children = const <Widget>[],
// })
///
///
///
///
///
///
///
///

void main() => runApp(MyExpansionTileApp());

class MyExpansionTileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "GridViewApp",
      theme: new ThemeData.light(),
      home: GridViewDemo(),
    );
  }
}

class GridViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridViewDemoState();
  }
}

class _GridViewDemoState extends State<GridViewDemo> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GridView"),
      ),
      // body: demoGridView1(),
      // body: demoGridView2(),
      body: demoGridView3(),
    );
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }

  /// SliverGridDelegate是一个抽象类，定义了GridView Layout相关接口，子类需要通过实现它们来实现具体的布局算法。
  /// Flutter中提供了两个SliverGridDelegate的子类:
  /// SliverGridDelegateWithFixedCrossAxisCount和SliverGridDelegateWithMaxCrossAxisExtent，
  /// 我们可以直接使用，下面我们分别来介绍一下它们。
  /// SliverGridDelegateWithFixedCrossAxisCount
  /// 该子类实现了一个横轴为固定数量子元素的layout算法，其构造函数为：
  /// SliverGridDelegateWithFixedCrossAxisCount({
  ///   @required double crossAxisCount,   crossAxisCount：横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，
  ///                                      即ViewPort横轴长度除以crossAxisCount的商。
  ///   double mainAxisSpacing = 0.0,       主轴方向的间距。
  ///   double crossAxisSpacing = 0.0,      横轴方向子元素的间距。
  ///   double childAspectRatio = 1.0,      子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，
  ///                                       子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。
  /// })
  ///
  ///
  Widget demoGridView1() {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //横轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
            ),
        children: widgetsGridView());
  }

  ///  GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，
  ///  我们通过它可以快速的创建横轴固定数量子元素的GridView。
  ///
  ///
  ///
  Widget demoGridView2() {
    return GridView.count(
        crossAxisCount: 3, //横轴三个子widget
        childAspectRatio: 1.0, //宽高比为1时，子widget
        children: widgetsGridView());
  }

  /// 上面我们介绍的GridView都需要一个widget数组作为其子元素，这些方式都会提前将所有子widget都构建好，
  /// 所以只适用于子widget数量比较少时，当子widget比较多时，我们可以通过GridView.builder来动态创建子widget。
  /// GridView.builder 必须指定的参数有两个：
  Widget demoGridView3() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 1.0 //显示区域宽高相等
            ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          //如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        });
  }

  List<Widget> widgetsGridView() {
    return [
      Icon(Icons.ac_unit),
      Icon(Icons.airport_shuttle),
      Icon(Icons.all_inclusive),
      Icon(Icons.beach_access),
      Icon(Icons.cake),
      Icon(Icons.free_breakfast),
    ];
  }
}
