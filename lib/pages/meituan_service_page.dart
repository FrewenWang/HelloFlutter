import 'package:demo/dao/discovery_dao.dart';
import 'package:demo/widgets/Item_meituan_service.dart';
import 'package:flutter/material.dart';

class MeituanServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      padding: EdgeInsets.symmetric(vertical: 0),
      children:
          serviceList.map((item) => MeituanServiceItem(data: item)).toList(),
    );
  }
}
