import 'package:demo/model/meituan_service_item_model.dart';
import 'package:flutter/material.dart';

class MeituanServiceItem extends StatelessWidget {
  final MeituanServiceItemModel data;

  MeituanServiceItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Expanded(child: this.data.icon),
          Text(
            this.data.title,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }
}
