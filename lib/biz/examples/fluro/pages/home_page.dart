import 'package:demo/biz/widgets/menu_button.dart';
import 'package:flutter/material.dart';

/// 路由框架Demo的首页
class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _deepLinkOpacity = 1.0;
  final _deepLinkURL =
      "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21";

  @override
  Widget build(BuildContext context) {
    var menuWidgets = <Widget>[
      MenuButton(
          id: "native",
          assetSrc: 'assets/images/ic_transform_native_hz.png',
          title: "原生动画"),
      MenuButton(
          id: "preset-fade",
          assetSrc: 'assets/images/ic_transform_fade_in_hz.png',
          title: "预设淡入动画"),
      MenuButton(
          id: "preset-from-left",
          assetSrc: 'assets/images/ic_transform_fade_in_hz.png',
          title: "从左侧进入"),
      MenuButton(
          id: "custom",
          assetSrc: 'assets/images/ic_transform_custom_hz.png',
          title: "自定义过渡动画"),
      MenuButton(
          id: "pop-result",
          assetSrc: 'assets/images/ic_result_hz.png',
          title: "页面回退结果"),
      MenuButton(
          id: "native",
          assetSrc: 'assets/images/ic_transform_native_hz.png',
          title: "原生动画"),
    ];

    final size = MediaQuery.of(context).size;
//    print("MediaQuery.of(context).size = $size");
    final childRatio = (size.width / size.height) * 2.5;
//    print("childRatio = $childRatio");

    return Material(
        color: const Color(0xFF00D6F7),
        child: SafeArea(
            top: true,
            child: Column(
              // 纵列组件
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 35, left: 25),
                  child: Image(
                    image: AssetImage("assets/images/logo_fluro.png"),
                    width: 100.0,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    // 使用GridView来进行放置menuWidgets
                    child: GridView.count(
                      childAspectRatio: childRatio,
                      crossAxisCount: 2, //每行Item的个数
                      mainAxisSpacing: 5, // 主轴方向上的间距
                      children: menuWidgets,
                    ),
                  ),
                ),
              ],
            )));
  }
}
