import 'package:demo/utils/date_utils.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

/// 菜单按钮
class MenuButton extends StatelessWidget {
  final String mKey;
  final String assetSrc;
  final String title;

  MenuButton({this.mKey, this.assetSrc, this.title});

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
            tappedMenuButton(context, mKey);
          },
        ),
      ),
    );
  }

  void tappedMenuButton(BuildContext context, String key) {
    String message = "";
    String hexCode = "#FFFFFF";
    String result;
    //TODO 待研究 TransitionType 转场动画类
    TransitionType transitionType = TransitionType.native;

    if (key != "custom" && key != "function-call" && key != "fixed-trans") {
      if (key == "native") {
        hexCode = "#F76F00";
        message =
            "This screen should have appeared using the default flutter animation for the current OS";
      } else if (key == "preset-from-left") {
        hexCode = "#5BF700";
        message =
            "This screen should have appeared with a slide in from left transition";
        transitionType = TransitionType.inFromLeft;
      } else if (key == "preset-fade") {
        hexCode = "#F700D2";
        message = "This screen should have appeared with a fade in transition";
        transitionType = TransitionType.fadeIn;
      } else if (key == "pop-result") {
        transitionType = TransitionType.native;
        hexCode = "#7d41f4";
        message =
            "When you close this screen you should see the current day of the week";
        result = "Today is ${DateUtils.getCurrentWeekDay()}!";
      }
    }

    String route = "/demo?message=$message&color_hex=$hexCode";
  }
}
