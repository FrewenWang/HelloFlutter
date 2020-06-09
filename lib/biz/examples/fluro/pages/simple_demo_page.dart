import 'package:demo/aura/utils/color_utils.dart';
import 'package:flutter/material.dart';

/// 路由跳转Demo
class DemoSimplePage extends StatelessWidget {
  final String message;
  final Color color;
  final String result;

  const DemoSimplePage(
      {Key key,
      this.message = "默认信息",
      this.color = const Color(0xFFFFFFFF),
      this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Column(
        // Column主轴上的对齐方式
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/acc_boom.png"),
            color: ColorUtils.blackOrWhiteContrastColor(color),
            width: 260.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorUtils.blackOrWhiteContrastColor(color),
                height: 2.0,
              ),
            ),
          ),
          Padding(
            // padding，内缩进组件
            padding: EdgeInsets.only(top: 15.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 42.0),
              child: FlatButton(
                highlightColor:
                    ColorUtils.blackOrWhiteContrastColor(color).withAlpha(17),
                splashColor:
                    ColorUtils.blackOrWhiteContrastColor(color).withAlpha(34),
                onPressed: () {
                  if (result == null) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context, result);
                  }
                },
                child: Text(
                  "返回",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: ColorUtils.blackOrWhiteContrastColor(color),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
