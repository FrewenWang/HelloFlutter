import 'package:demo/aura/widgets/search_bar.dart';
import 'package:demo/dao/search_dao.dart';
import 'package:demo/model/search_model.dart';
import 'package:demo/network/NetWorkUrl.dart';
import 'package:demo/widgets/aura_web_view.dart';
import 'package:flutter/material.dart';

/// 我的页面的实现
class MyProfilePage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuraWebView(
        url: 'https://m.ctrip.com/webapp/myctrip/',
        hideAppBar: true,
        backForbid: true,
        statusBarColor: '4c5bca',
      ),
    );
  }
}
