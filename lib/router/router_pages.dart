import 'package:flutter_wan_android/page/category/article_list/view.dart';
import 'package:flutter_wan_android/page/login/view.dart';
import 'package:flutter_wan_android/page/main/view.dart';
import 'package:flutter_wan_android/page/search/view.dart';
import 'package:flutter_wan_android/page/webview/view.dart';
import 'package:flutter_wan_android/page/wen_da/view.dart';
import 'package:flutter_wan_android/page/wxarticle/view.dart';
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
    GetPage(
      name: AppRoutes.articleListPage,
      page: () => ArticleListPage(),
    ),
    GetPage(
      name: AppRoutes.wXArticlePage,
      page: () => WXArticlePage(),
    ),
    GetPage(
      name: AppRoutes.wenDaPage,
      page: () => WenDaPage(),
    ),
    GetPage(
      name: AppRoutes.searchPage,
      page: () => SearchPage(),
    ),
    GetPage(
      name: AppRoutes.LoginPage,
      page: () => LoginPage(),
    ),
  ];
}
