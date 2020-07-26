import 'dart:async';
import 'dart:convert';
import 'package:demo/model/home_model.dart';
import 'package:demo/model/search_model.dart';
import 'package:http/http.dart' as http;

///搜索接口的DAO层
class SearchDao {
  static Future<SearchModel> fetch(String url, String text) async {
    if (text != null) {
      url = url + text;
    }
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return SearchModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}
