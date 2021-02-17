import 'package:demo/aura/widgets/search_bar.dart';
import 'package:demo/dao/home_dao.dart';
import 'package:demo/model/common_model.dart';
import 'package:demo/model/grid_nav_model.dart';
import 'package:demo/model/home_model.dart';
import 'package:demo/navigator/navigator_utils.dart';
import 'package:demo/pages/sales_box_model.dart';
import 'package:demo/pages/search_page.dart';
import 'package:demo/widgets/home/top_local_gridview.dart';
import 'package:demo/widgets/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

/// 这个是首页的相关逻辑
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 顶部的AppBar的透明度
  double appBarAlpha = 0;
  List<CommonModel> localNavList = [];
  List<CommonModel> bannerList = [];
  List<CommonModel> subNavList = [];
  GridNavModel gridNavModel;
  SalesBoxModel salesBoxModel;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _handleRefresh();

    /// 我们在首页进行启动屏的关闭
    Future.delayed(Duration(milliseconds: 600), () {
      FlutterSplashScreen.hide();
    });
  }

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  Future<Null> _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        localNavList = model.localNavList;
        subNavList = model.subNavList;
        gridNavModel = model.gridNav;
        salesBoxModel = model.salesBox;
        bannerList = model.bannerList;
        _loading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _loading = false;
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    /// Scaffold是脚手架工具，可以帮我们提供页面的初始化布局左很多工作
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
          isLoading: _loading,
          child: Stack(
            children: <Widget>[
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: RefreshIndicator(
                    onRefresh: _handleRefresh,
                    child: NotificationListener(
                      // ignore: missing_return
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollUpdateNotification &&
                            scrollNotification.depth == 0) {
                          //滚动且是列表滚动的时候
                          _onScroll(scrollNotification.metrics.pixels);
                        }
                      },
                      child: _listView,
                    )),
              ),
              _appBar
            ],
          )),
    );
  }

  /// 这个是内容区域的ListView的相关布局
  Widget get _listView {
    return ListView(
      children: <Widget>[
        _banner,
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: TopLocalGridView(topLocalNavList: localNavList),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: Text("我好"),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: Text("大家好"),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: Text("他们好"),
        ),
      ],
    );
  }

  /// 设置首页的AppBar.我们首页_appBar是一个Column
  Widget get _appBar {
    return Column(
      children: <Widget>[
        /// 是一个Container组件。里面加一个装饰器，
        /// 装饰器里面是一个LinearGradient线性渐变组件
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          // 然后填充一个Container容器组件。里面承载我们的SearchBar
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80.0,
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBar(
                hideLeftBtn: true,
                searchBarType: SearchBarType.TopSearch,
                inputBoxClick: _jumpToSearch),
          ),
        ),
        Container(
            height: appBarAlpha > 0.2 ? 0.5 : 0,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]))
      ],
    );
  }

  Widget get _banner {
    return Container(
      height: 160,
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              CommonModel model = bannerList[index];
              // TODO 页面跳转
            },
            child: Image.network(
              bannerList[index].icon,
              fit: BoxFit.fill,
            ),
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }

  /// 这个一个普通方法的调用，
  /// TODO 为什么普通方法可以直接使用方法名，不需要括号可以直接调用
  _jumpToSearch() {
    NavigatorUtil.push(
        context,
        SearchPage(
          hintSearchText: SEARCH_BAR_DEFAULT_TEXT,
        ));
  }

  _jumpToSpeak() {
    // TODO 页面跳转
  }
}
