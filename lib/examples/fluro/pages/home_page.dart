import 'package:demo/widgets/menu_button.dart';
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
          mKey: "native",
          assetSrc: 'assets/images/ic_transform_native_hz.png',
          title: "原生动画")
    ];

    /// TODO MediaQuery待研究
    final size = MediaQuery.of(context).size;

    return null;
  }
}
