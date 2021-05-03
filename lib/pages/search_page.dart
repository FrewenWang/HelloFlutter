import 'package:demo/aura/widgets/search_bar.dart';
import 'package:demo/dao/search_dao.dart';
import 'package:demo/model/search_model.dart';
import 'package:demo/network/NetWorkUrl.dart';
import 'package:flutter/material.dart';

/// 搜索页面的实现
class SearchPage extends StatefulWidget {
  final bool hideLeftBtn;
  final String searchUrl;
  final String keyWord;
  final String hintSearchText;

  const SearchPage(
      {Key key,
      this.hideLeftBtn,
      this.searchUrl = SEARCH_URL,
      this.keyWord,
      this.hintSearchText})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel searchModel;
  String keyWord;

  @override
  void initState() {
    if (widget.keyWord != null) {
      _onInputTextChange(widget.keyWord);
    }
    super.initState();
  }

  /// 这里我们重点学习一下ListView的初始化样式
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(),
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: searchModel?.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int position) {
                    return null;
                  }),
            ),
          )
        ],
      ),
    );
  }

  /// 当输入的文字发生变化的时候，我们需要进行搜索的网络请求
  void _onInputTextChange(String text) {
    keyWord = text;
    if (text == null) {
      setState(() {
        searchModel = null;
      });
      return;
    }

    SearchDao.fetch(widget.searchUrl, text)
        .then((SearchModel searchModel) {})
        .catchError((error) {
      // 警告：Set literals weren't supported until version 2.2,
      // but this code is required to be able to run on earlier versions.
      print(error);
    });
  }

  /// 搜索页面的SearchBar我们用来做一些遮罩
  /// 然后承载我们的搜索框SearchBar
  Widget _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x66000000), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Container(
            padding: EdgeInsets.only(top: 30),
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: SearchBar(
              defaultText: widget.keyWord,
              hint: widget.hintSearchText,
              speakClick: _jumpToSpeak,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChange,
            ),
          ),
        )
      ],
    );
  }

  void _jumpToSpeak() {

  }

  void _onTextChange(String text) {
    keyWord = text;
  }
}
