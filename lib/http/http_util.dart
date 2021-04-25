import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

class HttpUtil {
  static HttpUtil _instance;
  Dio _dio = Dio();

  Dio getDio() => _dio;
  final int limit = 20;
  int offset = 0;

  static HttpUtil getInstance() {
    if (_instance == null) {
      _instance = HttpUtil();
    }
    return _instance;
  }

  HttpUtil() {
    BaseOptions options = BaseOptions(
        baseUrl: "https://www.wanandroid.com",
        connectTimeout: 20000,
        receiveTimeout: 20000,
        sendTimeout: 20000,
        headers: {Headers.contentTypeHeader: Headers.jsonContentType});
    getDio().options = options;
    getCookieJar().then((value) {
      getDio().interceptors
        ..add(CookieManager(value))
        ..add(LogInterceptor(responseBody: true));
    });
  }

  Future<CookieJar> getCookieJar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    print("Cookie存放路径 = $appDocPath");
    var cj = PersistCookieJar(
        ignoreExpires: true, storage: FileStorage(appDocPath + "/.cookies/"));
    return cj;
  }

  get(String path,
      {Function onSuccess, Function onError, CancelToken cancelToken}) {
    request(path, method: "get", onSuccess: onSuccess, onError: onError);
  }

  post(String path, Map<String, dynamic> params,
      {Function onSuccess, Function onError, CancelToken cancelToken}) {
    request(path,
        method: "post", params: params, onSuccess: onSuccess, onError: onError);
  }

  void request(String path,
      {String method,
      Map<String, dynamic> params,
      Function onSuccess,
      Function onError,
      Options options,
      CancelToken cancelToken}) async {
    Response response;
    try {
      if (method == "get") {
        response = await getDio().get(path,
            queryParameters: params,
            options: options,
            cancelToken: cancelToken);
      } else if (method == "post") {
        response = await getDio().post(path,
            queryParameters: params,
            options: options,
            cancelToken: cancelToken);
      }
      var errorCode = response.data["errorCode"];
      var errorMsg = response.data["errorMsg"];
      var data = response.data["data"];
      if (errorCode == 0) {
        onSuccess?.call(data);
      } else {
        onError?.call(errorMsg);
      }
    } on DioError catch (e) {
      print('请求异常----->' + e.toString());
      onError?.call(e.toString());
    } catch (e) {
      print('其他异常----->' + e.toString());
      onError?.call(e.toString());
    }
  }
}
