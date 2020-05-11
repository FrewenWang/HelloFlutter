import 'package:demo/app/app.dart';
import 'package:demo/examples/fluro/routes/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

///fluro is a flutter routing library that adds flexible routing options like wildcards,
///named parameters and clear route definitions.
/// Fluro是一个Flutter路由库，它添加了通配符、命名参数和清晰路由定义等灵活的路由选项。
/// 参见：https://github.com/theyakka/fluro
class FluroDemo extends StatefulWidget {
  @override
  State createState() {
    return _FluroDemoState();
  }
}

///
class _FluroDemoState extends State<FluroDemo> {
  _FluroDemoState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      title: "FluroDemo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: Application.router.generator,
    );
    print("initial route = ${app.initialRoute}");
    return app;
  }
}
