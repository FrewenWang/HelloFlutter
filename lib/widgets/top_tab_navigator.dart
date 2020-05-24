import 'package:demo/pages/home_page.dart';
import 'package:flutter/material.dart';

class PageViewModel {
  final String title;
  final Widget widget;

  const PageViewModel({
    this.title,
    this.widget,
  });
}

/// 顶部Tab的NavigationBar
class BottomTabNavigator extends StatelessWidget {
  final String title;
  final List<PageViewModel> pages;
  final bool tabScrollable;
  final TabController tabController;

  BottomTabNavigator({
    this.title,
    this.pages,
    this.tabScrollable = true,
    this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        bottom: TabBar(
          controller: this.tabController,
          isScrollable: this.tabScrollable,
          tabs: this.pages.map((item) => Tab(text: item.title)).toList(),
        ),
      ),
      body: TabBarView(
        controller: this.tabController,
        children: this.pages.map((item) => item.widget).toList(),
      ),
    );
  }
}
