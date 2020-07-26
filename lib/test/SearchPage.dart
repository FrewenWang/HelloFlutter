import 'package:demo/aura/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: SearchBar(
              hideLeftBtn: false,
              defaultText: "这个默认搜索文本",
              searchBarType: SearchBarType.TopSearch,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextInputChanged,
            ),
          )
        ],
      ),
    );
  }

  void _onTextInputChanged(String value) {
    print("输入框" + value);
  }
}
