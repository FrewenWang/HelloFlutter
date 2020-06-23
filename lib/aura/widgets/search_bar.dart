import 'package:demo/aura/utils/color_utils.dart';
import 'package:flutter/material.dart';

// TODO 这个搜索框的类型暂定如此，后续重新设计
enum SearchBarType { home, normal, homeLight }

/// 通用搜索框的设计
class SearchBar extends StatefulWidget {
  ///是否禁止搜索
  final bool enabled;

  /// 是够隐藏左边按钮
  final bool hideLeft;

  /// 默认搜索Hint
  final String hint;
  final SearchBarType searchBarType;
  final String defaultText;

  /// 左边按钮点击回调
  final void Function() leftButtonClick;

  /// 右边按钮点击回调
  final void Function() rightButtonClick;

  /// 语音按钮点击
  final void Function() voiceClick;

  /// 搜索输入框的点击
  final void Function() inputBoxClick;

  /// 输入框文字窗台变化
  final ValueChanged<String> onChanged;

  /// 继承自Super,传入默认参数key
  const SearchBar(
      {Key key,
      this.enabled = true,
      this.hideLeft,
      this.searchBarType = SearchBarType.normal,
      this.hint,
      this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.voiceClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

/// 带下划线的是内部类
class _SearchBarState extends State<SearchBar> {
  bool showClearBtn = false;

  /// TextEditing的Controller
  final TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    /// 这段代码的目的是组件在初始化的时候可能会有传入默认文本，可以进行显示
    if (widget.defaultText != null) {
      setState(() {
        _editingController.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.searchBarType) {
      case SearchBarType.normal:
        return _buildNormalSearchBar();
        break;
      default:
        return _buildHomeSearchBar();
        break;
    }
  }

  /// 构建通用的SearchBar的组件
  Widget _buildNormalSearchBar() {
    /// 容器组件中，存放Row组件
    return Container(
      /// 行排列组件
      /// 这个??是if null 运算符
      /// 具体参见：https://www.dartcn.com/guides/language/language-tour
      child: Row(
        children: <Widget>[
          /// 返回的是一个Container点击回调的GestureDetector
          _widgetTapCallBackWrapper(
              Container(
                child: widget?.hideLeft ?? false
                    ? null
                    : Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                        size: 26,
                      ),
              ),
              widget.leftButtonClick),

          /// Expanded 展开自适应组件
          Expanded(flex: 1, child: _inputEditBox()),

          /// 返回的是一个Container点击回调的GestureDetector
          _widgetTapCallBackWrapper(
              Container(

                  /// 设施容器组件的内边距
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    "搜索",
                    style: TextStyle(color: Colors.blue, fontSize: 17),
                  )),
              widget.rightButtonClick),
        ],
      ),
    );
  }

  // ignore: missing_return
  Widget _buildHomeSearchBar() {}

  /// 组件点击回调的包装方法
  _widgetTapCallBackWrapper(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (null != callback) callback();
      },
      child: child,
    );
  }

  /// 搜索输入框的实现
  _inputEditBox() {
    Color inputBoxColor;

    /// 设置颜色的两种方式
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(ColorUtils.fromHexString("0xffEDEDED"));
    }

    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0), // 设置内边距
      decoration: BoxDecoration(
          // 外部装饰器是一个圆角矩形
          color: inputBoxColor,
          borderRadius: BorderRadius.circular(
              widget.searchBarType == SearchBarType.normal ? 5 : 15)),
      child: Row(
        // 行排列组件
        children: <Widget>[
          Icon(Icons.search,
              size: 20,
              color: widget.searchBarType == SearchBarType.normal
                  ? Color(0xffA9A9A9)
                  : Colors.blue),
          Expanded(
            child: widget.searchBarType == SearchBarType.normal
                ? TextField()
                : _widgetTapCallBackWrapper(
                    Container(
                      child: Text(widget.defaultText,
                          style: TextStyle(fontSize: 13, color: Colors.grey)),
                    ),
                    (widget.inputBoxClick)),
          )
        ],
      ),
    );
  }
}
