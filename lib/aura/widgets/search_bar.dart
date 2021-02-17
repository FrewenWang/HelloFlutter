import 'package:flutter/material.dart';

///
enum SearchBarType { TopSearch, NormalPage, TopSearchHighLight }

/// 我们定义一个状态型组件
///
class SearchBar extends StatefulWidget {
  final bool enabled;

  // 判断是否隐藏左侧返回按钮
  final bool hideLeftBtn;
  final SearchBarType searchBarType;
  final String hint;

  /// 进入搜索框的默认文字
  final String defaultText;

  /// SearchBar的构造方法的回调
  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;

  /// 这个SearchBar的输入文字监听
  final ValueChanged<String> onChanged;

  /// 构造函数
  /// 构造函数传入的参数是一个对象
  const SearchBar(
      {Key key,
      this.enabled = true,
      this.hideLeftBtn,
      this.searchBarType = SearchBarType.NormalPage,
      this.hint,
      this.defaultText = "",
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

/// SearchBarState
class _SearchBarState extends State<SearchBar> {
  /// 是否显示清除按钮
  bool showClearBtn = false;

  /// 文字编辑的控制器
  /// 这个TextEditingController可以设置TextField的文字，清空等
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.NormalPage
        ? _createNormalSearchPage()
        : _createTopSearchBar();
  }

  /// 常见通用页面Page的Search页面
  ///
  _createNormalSearchPage() {
    return Container(
      ///Row 线性布局
      child: Row(children: <Widget>[
        _wrapTapWidget(
            Container(
              padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
              // 判断hideLeftBtn按钮的属性是否是false 如果是则异常左侧按钮
              // 设置Icon的大小
              child: widget?.hideLeftBtn ?? false
                  ? null
                  : Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 26,
                    ),
            ),
            widget.leftButtonClick),
        Expanded(
          flex: 1,
          child: _searchInputBox(),
        ),
        _wrapTapWidget(
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: Text(
                '搜索',
                style: TextStyle(color: Colors.blue, fontSize: 17),
              ),
            ),
            widget.rightButtonClick)
      ]),
    );
  }

  /// 返回顶部的搜索框组件
  _createTopSearchBar() {
    return Container(
      child: Row(children: <Widget>[
        _wrapTapWidget(
            Container(
                padding: EdgeInsets.fromLTRB(6, 5, 5, 5),
                child: Row(
                  children: <Widget>[
                    Text(
                      '上海',
                      style: TextStyle(
                          color: _topSearchBarFontColor(), fontSize: 14),
                    ),
                    Icon(
                      Icons.expand_more,
                      color: _topSearchBarFontColor(),
                      size: 22,
                    )
                  ],
                )),
            widget.leftButtonClick),
        Expanded(
          flex: 1,
          child: _searchInputBox(),
        ),
        _wrapTapWidget(
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Icon(
                Icons.comment,
                color: _topSearchBarFontColor(),
                size: 26,
              ),
            ),
            widget.rightButtonClick)
      ]),
    );
  }

  /// 这是输入框相关的组件
  _searchInputBox() {
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.TopSearch) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse('0xffEDEDED'));
    }
    return Container(
      height: 35,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          color: inputBoxColor,
          // 输入框的圆角半径
          borderRadius: BorderRadius.circular(
              widget.searchBarType == SearchBarType.NormalPage ? 5 : 15)),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 22,
            color: widget.searchBarType == SearchBarType.NormalPage
                ? Color(0xffA9A9A9)
                : Colors.blue,
          ),
          _getCenterTextInputFiled(),

          /// 使用Expanded来封装Row的子组件，弹性系数为1.即占满素所有剩余组件
          !showClearBtn ? _getTextInputMicWidget() : _getTextInputClearWidget()
        ],
      ),
    );
  }

  /// 这个方法其实就是针对可以点击的组件封装
  /// 然后将组件封装成GestureDetector
  _wrapTapWidget(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  /// 输入框的文件变化的监听
  /// 入参：输入框的文字.输入框有内容，显示
  _onTextInputChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClearBtn = true;
      });
    } else {
      setState(() {
        showClearBtn = false;
      });
    }

    /// 回调到外部
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  /// 顶部搜索按钮的字体颜色设置
  _topSearchBarFontColor() {
    return widget.searchBarType == SearchBarType.TopSearchHighLight
        ? Colors.black54
        : Colors.white;
  }

  /// 获取搜索框右侧的麦克风组件
  _getTextInputMicWidget() {
    return _wrapTapWidget(
        Icon(
          Icons.mic,
          size: 22,
          color: widget.searchBarType == SearchBarType.NormalPage
              ? Colors.blue
              : Colors.grey,
        ),
        widget.speakClick);
  }

  _getTextInputClearWidget() {
    return _wrapTapWidget(
        Icon(
          Icons.clear,
          size: 22,
          color: Colors.grey,
        ), () {
      setState(() {
        _controller.clear();
      });
      _onTextInputChanged('');
    });
  }

  /// 获取输入法的内容布局区域
  _getCenterTextInputFiled() {
    return Expanded(
        flex: 1,
        child: widget.searchBarType == SearchBarType.NormalPage
            ? TextField(
                controller: _controller,
                onChanged: _onTextInputChanged,
                // 监听TextField的onChanged
                autofocus: true,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                  //输入框文本的样式,设置输入框contentPadding、边距、hintText、hintStyle
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  border: InputBorder.none,
                  hintText: widget.hint ?? '',
                  hintStyle: TextStyle(fontSize: 10),
                ))
            : _wrapTapWidget(
                Container(
                  child: Text(
                    widget.defaultText,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
                widget.inputBoxClick));
  }
}
