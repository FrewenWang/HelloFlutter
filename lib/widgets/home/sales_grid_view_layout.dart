import 'package:demo/model/sales_box_model.dart';
import 'package:flutter/material.dart';

class SalesBox extends StatelessWidget {
  final SalesBoxModel salesBox;

  const SalesBox({Key key, this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: _contentItem(context),
    );
  }

  Widget _contentItem(BuildContext context) {
    if (salesBox == null) return null;
  }
}
