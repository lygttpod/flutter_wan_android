import 'package:flutter_wan_android/page/main/view.dart';
import 'package:flutter_wan_android/page/webview/view.dart';
import 'package:flutter_wan_android/router/router.dart';
import 'package:get/get.dart';

class RouterPages {
  static final pages = [
    GetPage(
      name: AppRoutes.Initial,
      page: () => MainPage(),
    ),
    GetPage(
      name: AppRoutes.WebView,
      page: () => WebViewPage(),
    ),
  ];
}
