import 'package:demo/model/common_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TopLocalGridView extends StatelessWidget {
  final List<CommonModel> topLocalNavList;

  const TopLocalGridView({Key key, this.topLocalNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) {
    if (topLocalNavList == null) {
      return null;
    }
    List<Widget> items = [];
    topLocalNavList.forEach((element) {
      items.add(_contentItem(context, element));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _contentItem(BuildContext context, CommonModel element) {
    return GestureDetector(
      onTap: () {
        /// 点击内容的Item。然后弹出提示Toast
        Fluttertoast.showToast(
            msg: element.title,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      },
      child: Column(
        children: <Widget>[
          Image.network(
            element.icon,
            width: 32,
            height: 32,
          ),
          Text(
            element.title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
