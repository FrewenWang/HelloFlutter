import 'package:demo/pages/meituan_service_page.dart';
import 'package:demo/widgets/top_tab_navigator.dart';
import 'package:flutter/material.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

List<PageViewModel> pages = [
  PageViewModel(title: 'UI效果组件', widget: MeituanServicePage()),
  PageViewModel(title: '美团 - 服务菜单', widget: MeituanServicePage()),
  PageViewModel(title: '喜马拉雅 - 相声列表', widget: MeituanServicePage()),
];

/// 发现页面，我们会汇集一些Flutter的Demo
class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryState createState() => _DiscoveryState();
}

class _DiscoveryState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = new TabController(length: pages.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: _gridView,
    );
  }

  Widget get _gridView {
    return BottomTabNavigator(
      pages: pages,
      title: 'GridView',
      tabController: this.tabController,
    );
  }
}
