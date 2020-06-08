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
          id: "native",
          assetSrc: 'assets/images/ic_transform_native_hz.png',
          title: "原生动画"),
      MenuButton(
          id: "native",
          assetSrc: 'assets/images/ic_transform_native_hz.png',
          title: "原生动画"),
      MenuButton(
          id: "native",
          assetSrc: 'assets/images/ic_transform_native_hz.png',
          title: "原生动画"),
      MenuButton(
          id: "native",
          assetSrc: 'assets/images/ic_transform_native_hz.png',
          title: "原生动画"),
      MenuButton(
          id: "native",
          assetSrc: 'assets/images/ic_transform_native_hz.png',
          title: "原生动画"),
    ];

    /// TODO MediaQuery待研究
    final size = MediaQuery.of(context).size;
    final childRatio = (size.width / size.height) * 2.5;

    return Material(
        color: const Color(0xFF00D6F7),
        child: SafeArea(
            top: true,
            child: Column(
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
                    child: GridView.count(
                      childAspectRatio: childRatio,
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      children: menuWidgets,
                    ),
                  ),
                ),
//            Padding(
//              padding: EdgeInsets.only(top: 35.0, bottom: 25),
//              child: Center(
//                child: ConstrainedBox(
//                  constraints: BoxConstraints.tightFor(height: 60.0),
//                  child: deepLinkWidget(context),
//                ),
//              ),
//            ),
              ],
            )));
  }
}
