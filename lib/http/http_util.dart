import 'package:dio/dio.dart';

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
        connectTimeout: 2000,
        receiveTimeout: 2000,
        sendTimeout: 2000,
        headers: {Headers.contentTypeHeader: Headers.jsonContentType});
    getDio().options = options;
  }

  get(String path,
      {Function onSuccess, Function onError, CancelToken cancelToken}) {
    request(path, method: "get", onSuccess: onSuccess, onError: onError);
  }

  post(String path,
      {Function onSuccess, Function onError, CancelToken cancelToken}) {
    request(path, method: "post", onSuccess: onSuccess, onError: onError);
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
      print('请求地址：' + response.request.baseUrl + path + params.toString());
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
