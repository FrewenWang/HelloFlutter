import 'dart:async';
import 'dart:convert';
import 'package:demo/model/home_model.dart';
import 'package:http/http.dart' as http;

const HOME_URL = 'http://www.devio.org/io/flutter_app/json/home_page.json';

///首页大接口
class HomeDao {
  static Future<HomeModel> fetch() async {
    // 运行的时候.发现报错：
    /// How to solve SocketException: Failed host lookup: 'www.xyz.com' (OS Error: No address associated with hostname, errno = 7)
    ///
    final response = await http.get(HOME_URL);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}
