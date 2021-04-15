import 'package:flutter_easyrefresh/easy_refresh.dart';

class RefreshUtils {
  appRefreshHeader() => BallPulseHeader();

  // ClassicalHeader(
  // key: _headerKey,
  // refreshText: "下拉刷新",
  // refreshingText: "正在加载...",
  // refreshReadyText: "松开加载",
  // refreshedText: "刷新完成",
  // refreshFailedText: "刷新失败",
  // infoText: "更新于 %T");

  appRefreshFooter() => BallPulseFooter();
// ClassicalFooter(
// key: _footerKay,
// loadedText: "上拉加载",
// loadingText: "正在加载...",
// loadFailedText: "加载失败",
// loadReadyText: "松手加载",
// infoText: "更新于 %T");
}
