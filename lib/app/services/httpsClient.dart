// ignore_for_file: file_names

/*
 * @LastEditors: hezeying@xdf.cn
 * @Date: 2025-04-03 22:18:47
 * @LastEditTime: 2025-04-04 00:16:01
 * @FilePath: /xmshop/lib/app/services/httpsClient.dart
 * @Description: 网络请求类(单例模式)
 */
import 'package:dio/dio.dart';

class HttpsClient {
  // 域名
  static String domain = "https://miapp.itying.com";

  // 创建 Dio 实例
  static Dio dio = Dio();

  // 初始化 Dio 实例
  HttpsClient() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = 50000;
    dio.options.receiveTimeout = 50000;
  }

  Future get(apiUrl) async {
    print(apiUrl);
    try {
      var response = await dio.get(apiUrl);
      print(response);
      return response;
    } catch (e) {
      print("请求超时");
      return null;
    }
  }

  static replaeUri(picUrl) {
    String tempUrl = domain + picUrl;
    return tempUrl.replaceAll("\\", "/");
  }
}
