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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
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
}
