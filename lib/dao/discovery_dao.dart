import 'package:demo/common/custom_icons.dart';
import 'package:demo/model/meituan_service_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 美团 - 服务菜单
const List<MeituanServiceItemModel> serviceList = [
  MeituanServiceItemModel(
    title: '精选早餐',
    icon: Icon(
      CustomIcons.breakFirst,
      size: 25,
      color: Colors.lightBlue,
    ),
  ),
  MeituanServiceItemModel(
    title: '包子',
    icon: Icon(
      CustomIcons.baozi,
      size: 25,
      color: Colors.orangeAccent,
    ),
  ),
  MeituanServiceItemModel(
    title: '炸鸡',
    icon: Icon(
      CustomIcons.friedFood,
      size: 29,
      color: Colors.deepOrangeAccent,
    ),
  ),
  MeituanServiceItemModel(
    title: '网红甜品',
    icon: Icon(
      CustomIcons.sweetmeats,
      size: 30,
      color: Colors.pinkAccent,
    ),
  ),
  MeituanServiceItemModel(
    title: '湘菜',
    icon: Icon(
      CustomIcons.xiangCuisine,
      size: 20,
      color: Colors.redAccent,
    ),
  ),
  MeituanServiceItemModel(
    title: '减免配送费',
    icon: Icon(
      CustomIcons.truck,
      size: 25,
      color: Colors.orange,
    ),
  ),
  MeituanServiceItemModel(
    title: '美团专送',
    icon: Icon(
      CustomIcons.motorbike,
      size: 28,
      color: Colors.blueAccent,
    ),
  ),
  MeituanServiceItemModel(
    title: '到点自取',
    icon: Icon(
      CustomIcons.shop,
      size: 25,
      color: Colors.lightGreen,
    ),
  ),
  MeituanServiceItemModel(
    title: '跑腿代购',
    icon: Icon(
      CustomIcons.errand,
      size: 25,
      color: Colors.red,
    ),
  ),
  MeituanServiceItemModel(
    title: '全部分类',
    icon: Icon(
      CustomIcons.allCategories,
      size: 25,
      color: Colors.amber,
    ),
  ),
];
