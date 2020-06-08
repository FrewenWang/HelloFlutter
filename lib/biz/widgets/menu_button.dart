import 'package:demo/biz/app/app.dart';
import 'package:demo/biz/utils/date_utils.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

/// 菜单按钮
class MenuButton extends StatelessWidget {
  final String id;
  final String assetSrc;
  final String title;

  MenuButton({this.id, this.assetSrc, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),

      /// Container容器
      child: Container(
        height: 42.0,
        child: FlatButton(
          color: const Color(0x22FFFFFF),
          highlightColor: const Color(0x11FFFFFF),
          splashColor: const Color(0x22FFFFFF),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 36,
                  child: Image.asset(
                    assetSrc,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xAA001133),
                ),
              )
            ],
          ),
          onPressed: () {
            tappedMenuButton(context, id);
          },
        ),
      ),
    );
  }

  void tappedMenuButton(BuildContext context, String id) {
    String message = "";
    String hexCode = "#FFFFFF";
    String result;
    //TODO 待研究 TransitionType 转场动画类
    TransitionType transitionType = TransitionType.native;

    if (id != "custom" && id != "function-call" && id != "fixed-trans") {
      if (id == "native") {
        hexCode = "#F76F00";
        message =
            "This screen should have appeared using the default flutter animation for the current OS";
      } else if (id == "preset-from-left") {
        hexCode = "#5BF700";
        message =
            "This screen should have appeared with a slide in from left transition";
        transitionType = TransitionType.inFromLeft;
      } else if (id == "preset-fade") {
        hexCode = "#F700D2";
        message = "This screen should have appeared with a fade in transition";
        transitionType = TransitionType.fadeIn;
      } else if (id == "pop-result") {
        transitionType = TransitionType.native;
        hexCode = "#7d41f4";
        message =
            "When you close this screen you should see the current day of the week";
        result = "Today is ${DateUtils.getCurrentWeekDay()}!";
      }

      // 计算路由路径
      String route = "/demo?message=$message&color_hex=$hexCode";

      print("route = " + route);

      if (result != null) {
        route = "$route&result=$result";
      }

      Application.router
          .navigateTo(context, route, transition: transitionType)
          .then((result) {
        if (id == "pop-result") {
          Application.router.navigateTo(context, "/demo/func?message=$result");
        }
      });
    }
  }
}
