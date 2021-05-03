import 'package:demo/aura/utils/color_utils.dart';
import 'package:demo/biz/examples/fluro/pages/home_page.dart';
import 'package:demo/biz/examples/fluro/pages/simple_demo_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var demoRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String message = params["message"]?.first;
  String colorHex = params["color_hex"]?.first;
  String result = params["result"]?.first;

  Color color = Color(0xFFFFFFFF); //设置默认颜色是白色
  if (colorHex != null && colorHex.length > 0) {
    color = Color(ColorUtils.fromHexString(colorHex));
  }
  print("handlerFunc ==== $message, $colorHex,$result");
  return DemoSimplePage(message: message, color: color, result: result);
});

var demoFunctionHandler = Handler(
    type: HandlerType.function,
    // ignore: missing_return
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String message = params["message"]?.first;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Hey Hey!",
              style: TextStyle(
                color: const Color(0xFF00D6F7),
                fontFamily: "Lazer84",
                fontSize: 22.0,
              ),
            ),
            content: Text("$message"),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("OK"),
                ),
              ),
            ],
          );
        },
      );
    });
